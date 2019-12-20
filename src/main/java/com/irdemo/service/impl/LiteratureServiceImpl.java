package com.irdemo.service.impl;

import com.irdemo.bean.Literature;
import com.irdemo.service.LiteratureService;
import com.irdemo.utils.PageUtils;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.io.IOException;
import java.util.List;

@Service
public class LiteratureServiceImpl implements LiteratureService {

    @Autowired
    private HttpSolrClient httpSolrClient;

    public PageUtils search(String keyword, String catalogName, String priceStr, String psort, Integer currtPage, Integer pageSize) throws IOException, SolrServerException {
        PageUtils pageUtils=new PageUtils(0,pageSize,currtPage);

        SolrQuery query=new SolrQuery();

        if (StringUtils.isEmpty(keyword)){
            query.set("q","*:*");
        }else {
            query.set("q","prod_description:"+keyword);
        }

        if (!StringUtils.isEmpty(catalogName)){
            query.addFilterQuery("prod_catalog_name:"+catalogName);
        }

        if (!StringUtils.isEmpty(priceStr)){
            String[] strs=priceStr.split("-");
            if (strs.length==2){
                if (StringUtils.isEmpty(strs[0])){
                    query.addFilterQuery("prod_price:[0 TO "+strs[1]+"]");
                }else{
                    query.addFilterQuery("prod_price:["+strs[0]+" TO "+strs[1]+"]");
                }
            }else {
                query.addFilterQuery("prod_price:["+strs[0]+" TO *]");
            }
        }


        if (!StringUtils.isEmpty(psort)){
            if ("1".equals(psort)){
                query.addSort("prod_price",SolrQuery.ORDER.asc);
            }else if ("2".equals(psort)){
                query.addSort("prod_price",SolrQuery.ORDER.desc);
            }
        }


        query.setStart(pageUtils.getOffset());
        query.setRows(pageUtils.getPageSize());


        /*query.setHighlight(true);
        query.addHighlightField("prod_pname");
        query.setHighlightSimplePre("<font color=##FF0000>");
        query.setHighlightSimplePost("</font>");*/



        QueryResponse queryResponse=httpSolrClient.query(query);

        //Map<String, Map<String, List<String>>> map=queryResponse.getHighlighting();


        long count=queryResponse.getResults().getNumFound();



        List<Literature> list=queryResponse.getBeans(Literature.class);

        /*for (Literature p : list) {

            Map<String,List<String>> map1=map.get(p.getPid());
            List<String> list1=map1.get("prod_pname");
            if (list1!=null){
                String resultPname=list1.get(0);
                p.setPname(resultPname);
            }
        }*/
        pageUtils=new PageUtils((int)count,pageSize,currtPage);
        pageUtils.setList(list);

        return pageUtils;
    }
}


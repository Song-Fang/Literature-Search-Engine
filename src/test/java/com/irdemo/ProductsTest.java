package com.irdemo;

import com.irdemo.bean.Literature;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.client.solrj.response.UpdateResponse;
import org.junit.Test;

import java.io.IOException;
import java.util.List;
import java.util.Map;

public class ProductsTest {

    @Test
    public void addOrUpdate() throws IOException, SolrServerException {

        String solrUrl = "http://localhost:8081/solr/core_demo";


        HttpSolrClient solrClient = new HttpSolrClient.Builder(solrUrl).build();


        Literature p = new Literature();

        p.setPid("64");
        p.setCatalogName("Food");
        p.setDescription("Melted cheese between slices of toasted bread—the ultimate in comfort food. This mouthwatering cookbook features 39 grilled cheese recipes created by Heidi Gibson, winner of seven grilled cheese championships and the co-owner (with husband Nate) of the American Grilled Cheese Kitchen in San Francisco. The classic Mousetrap is dripping with three kinds of cheese. Discover nearly 40 unique and delicious recipes that include cheese, bread, and everything in between with tantalizing photographs that bring the words to life. Features 40 additional recipes for great accompaniments and side dishes including hearty soups, many variations of mac and cheese, spicy pickles, and tangy spreads that will keep mealtime interesting and inspiring.  Tips on choosing the best bread and cheese as well as techniques for grilling each sandwich at just the right temperature so you get the ideal melty, golden brown results every time. From beginner to expert, anyone can create a perfect grilled cheese sandwich with the easy-to-follow recipes and inclusive glossary included in this cheesy cookbook. Enticing recipes include Green Eggs and Ham Grilled Cheese, Jalapeno Popper Grilled Cheese, Grilled Cheese Birthday Cake, Butternut Squash Soup, Crab Mac, Kale Slaw, and so much more! Author Heidi Gibson is the winner of seven grilled cheese championships and the co-owner (with husband Nate) of the American Grilled Cheese Kitchen in San Francisco.");
        p.setPname("Grilled Cheese Kitchen: Bread Cheese Everything in Between");
        p.setPicture("64.jpg");
        p.setPrice(2016.5);


        UpdateResponse updateResponse = solrClient.addBean(p);
        System.out.println("solr J 执行成功");



        solrClient.commit();

        solrClient.close();
    }



    @Test
    public void search() throws IOException, SolrServerException {
        //1 Solr
        String solrUrl = "http://localhost:8081/solr/core_demo";
        //2 Create link
        HttpSolrClient solrClient = new HttpSolrClient.Builder(solrUrl).build();

        //3 Execute query
        SolrQuery solrQuery = new SolrQuery("*:*");
        QueryResponse query = solrClient.query(solrQuery);
        List<Literature> list = query.getBeans(Literature.class);
        for (Literature literature : list) {
            System.out.println(literature.getPid()+":"+ literature.getPname());
        }

    }




    @Test
    public void complexSearch() throws IOException, SolrServerException {

        String solrUrl = "http://localhost:8081/solr/core_demo";

        HttpSolrClient solrClient = new HttpSolrClient.Builder(solrUrl).build();




        SolrQuery solrQuery = new SolrQuery();
        solrQuery.set("q","手机");


        solrQuery.setFilterQueries("prod_catalog_name:手机饰品");
        solrQuery.addFilterQuery("prod_price:[5 TO *]");


        solrQuery.addSort("prod_price", SolrQuery.ORDER.desc);


        solrQuery.setStart(0);
        solrQuery.setRows(9);


        solrQuery.set("df","prod_pname");


        solrQuery.setHighlight(true);
        solrQuery.addHighlightField("prod_pname");
        solrQuery.setHighlightSimplePre("<font color='red'>");
        solrQuery.setHighlightSimplePost("</font>");


        QueryResponse query = solrClient.query(solrQuery);
        Map<String, Map<String, List<String>>> highlighting = query.getHighlighting();

        long numFound = query.getResults().getNumFound();
        System.out.println(numFound);
        List<Literature> list = query.getBeans(Literature.class);
        for (Literature literature : list) {
            Map<String, List<String>> stringListMap = highlighting.get(literature.getPid());
            List<String> strings = stringListMap.get("prod_pname");
            String result = strings.get(0);
            literature.setPname(result);
            System.out.println(literature.getPid()+":"+ literature.getPname()+"\t"+ literature.getPrice());
        }

    }
}

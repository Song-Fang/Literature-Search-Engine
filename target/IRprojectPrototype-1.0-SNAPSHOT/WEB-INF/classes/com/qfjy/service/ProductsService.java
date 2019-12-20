package com.qfjy.service;

import com.qfjy.utils.PageUtils;
import org.apache.solr.client.solrj.SolrServerException;

import java.io.IOException;

public interface ProductsService {
    public PageUtils search(String keyword, String catalogName, String priceStr, String psort,
                            Integer currtPage, Integer pageSize) throws IOException, SolrServerException;
}

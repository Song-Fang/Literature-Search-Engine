package com.irdemo.service;

import com.irdemo.utils.PageUtils;
import org.apache.solr.client.solrj.SolrServerException;

import java.io.IOException;

public interface LiteratureService {
    public PageUtils search(String keyword, String catalogName, String priceStr, String psort,
                            Integer currtPage, Integer pageSize) throws IOException, SolrServerException;
}

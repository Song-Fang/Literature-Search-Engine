package com.qfjy.controller;

import com.qfjy.service.ProductsService;
import com.qfjy.utils.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("product")
public class ProductsController {

    @Autowired
    private ProductsService productsService;


    @RequestMapping("search")
    public ModelAndView search(@RequestParam(value = "keyword",required = false) String keyword,
                               @RequestParam(value = "catalogName",required = false)String catalogName,
                               @RequestParam(value = "priceStr",required = false)String priceStr,
                               @RequestParam(value = "psort",required = false)String psort,
                               @RequestParam(value = "currtPage",defaultValue = "1",required = false)Integer currtPage){
        return sendUpdate(keyword,catalogName,priceStr,psort,currtPage,"/resultList");
    }

    @RequestMapping("advancedSearch")
    public ModelAndView advancedSearch(@RequestParam(value = "keyword",required = false) String keyword,
                               @RequestParam(value = "catalogName",required = false)String catalogName,
                               @RequestParam(value = "priceStr",required = false)String priceStr,
                               @RequestParam(value = "psort",required = false)String psort,
                               @RequestParam(value = "currtPage",defaultValue = "1",required = false)Integer currtPage){
        return sendUpdate(keyword,catalogName,priceStr,psort,currtPage,"/advancedSearchList");
    }

    private ModelAndView sendUpdate(String keyword,String catalogName,String priceStr,String psort,Integer currtPage,String url){
        ModelAndView model = new ModelAndView();
        model.setViewName(url);
        try {
            PageUtils pageUtils = productsService.search(keyword, catalogName, priceStr, psort, currtPage, 6);
            model.addObject("pageList",pageUtils);
            model.addObject("keyword",keyword);
            model.addObject("catalogName",catalogName);
            model.addObject("psort",psort);
            model.addObject("priceStr",priceStr);
            model.addObject("currtPage",currtPage);

        } catch (Exception e) {
            System.out.println(e.getMessage()+"\t ---------------->server can't be accessed now!");
            e.printStackTrace();
        }

        return model;



    }
}

package com.irdemo.utils;

import java.util.List;

public class PageUtils {
    private int pageSize=5; // 每页大小  默认显示5条
    private int currPage=1;// 当前页数
    private int offset; // 偏移量
    private int count; // 总记录数
    private int countPage;// 总页数 count/countPage...
    private List<?> list;// ?未知的数据类型 用于存放分页显示的数据信息

    public PageUtils(int count, int pageSize, int currPage) {
        if(pageSize>1){
            this.pageSize=pageSize;
        }else{
            this.pageSize=5;
        }
        if(currPage>1){
            this.currPage=currPage;
        }else{
            this.currPage=1;
        }
        //得到总页数
        this.countPage=count%pageSize==0?count/pageSize:count/pageSize+1;
        this.count=count;//总记录数

        //偏移量
        this.offset=(this.currPage-1)*this.pageSize;

        if(currPage>countPage){
            this.currPage=countPage;
        }
    }

    public PageUtils() {

    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getCurrPage() {
        return currPage;
    }

    public void setCurrPage(int currPage) {
        this.currPage = currPage;
    }

    public int getOffset() {
        return offset;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getCountPage() {
        return countPage;
    }

    public void setCountPage(int countPage) {
        this.countPage = countPage;
    }

    public List<?> getList() {
        return list;
    }

    public void setList(List<?> list) {
        this.list = list;
    }
}

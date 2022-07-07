package com.learn.entity;

import java.util.ArrayList;
import java.util.List;

/**
 * 封装分页对象
 **/
public class PageList {
    private int page;   //当前页
    private int totalRows;   //总行数
    private int pages;    //总页数
    private List list=new ArrayList();

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getPages() {
        return pages;
    }

    public void setPages(int pages) {
        this.pages = pages;
    }

    public List getList() {
        if(list==null){
            list=new ArrayList();
        }
        return list;
    }

    public void setList(List list) {
        this.list = list;
    }

    public int getTotalRows() {
        return totalRows;
    }

    public void setTotalRows(int totalRows) {
        this.totalRows = totalRows;
    }
}
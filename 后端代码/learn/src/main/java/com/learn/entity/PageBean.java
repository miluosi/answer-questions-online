package com.learn.entity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.Map;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PageBean<T> {

    private List<Map<String, Object>> content;  //内容列表

    private List<Map<String, Object>> content2;  //内容列表

    private int size ;  //每页大小

    private int pages;

    private int elementTotalSize;   //list中元素有多少个

    private int page; //当前页数

    private int total;   //总的页数

    private int totalSize;   //总共的数量
}


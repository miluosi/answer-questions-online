package com.learn.common.dto;

import lombok.Data;

import java.io.Serializable;

@Data
public class CorrectDto implements Serializable {
    private int ifTrue;
    private String review;
    private int id;

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    private String userid;

    public int getIfTrue() {
        return ifTrue;
    }

    public void setIfTrue(int ifTrue) {
        this.ifTrue = ifTrue;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}

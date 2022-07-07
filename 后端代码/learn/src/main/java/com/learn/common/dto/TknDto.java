package com.learn.common.dto;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;

@Data
public class TknDto implements Serializable {


    private String content;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getKnid() {
        return knid;
    }

    public void setKnid(String knid) {
        this.knid = knid;
    }

    @NotBlank(message = "学号不能为空")
    private String knid;
}

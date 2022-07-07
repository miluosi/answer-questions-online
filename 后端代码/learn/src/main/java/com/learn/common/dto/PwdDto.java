package com.learn.common.dto;

import lombok.Data;

import java.io.Serializable;

@Data
public class PwdDto implements Serializable {
    private String pass;

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }


    public void setOldpass(String oldpass) {
        this.oldPass = oldpass;
    }

    public String getCheckpass() {
        return checkPass;
    }

    public void setCheckpass(String checkpass) {
        this.checkPass = checkpass;
    }
    private String studentid;

    public String getStudentid() {
        return studentid;
    }

    public void setStudentid(String studentid) {
        this.studentid = studentid;
    }

    public String getOldPass() {
        return oldPass;
    }

    public void setOldPass(String oldPass) {
        this.oldPass = oldPass;
    }

    public String getCheckPass() {
        return checkPass;
    }

    public void setCheckPass(String checkPass) {
        this.checkPass = checkPass;
    }

    private String oldPass;
    private String checkPass;
}

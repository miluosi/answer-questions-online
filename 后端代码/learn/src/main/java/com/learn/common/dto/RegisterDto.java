package com.learn.common.dto;

import javax.validation.constraints.NotBlank;


public class RegisterDto {
    private String username;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public String getStudentid() {
        return studentid;
    }

    public void setStudentid(String studentid) {
        this.studentid = studentid;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getSpecialty() {
        return specialty;
    }

    public void setSpecialty(String specialty) {
        this.specialty = specialty;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @NotBlank(message = "密码不能为空")
    private String password;
    @NotBlank(message = "学号不能为空")
    private String studentid;
    private String sex;
    private String specialty;
}

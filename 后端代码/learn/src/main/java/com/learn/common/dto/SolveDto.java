package com.learn.common.dto;
import lombok.Data;
import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.time.LocalDateTime;

@Data
public class SolveDto implements Serializable{

    @NotBlank(message = "问题序号不为空")
    private String qsid;

    @NotBlank(message = "学生学号不为空")
    private String userid;

    @NotBlank(message = "答案不为空")
    private String answer;

    public String getQsid() {
        return qsid;
    }

    public void setQsid(String qsid) {
        this.qsid = qsid;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public String getCreated_time() {
        return created_time;
    }

    public void setCreated_time(String created_time) {
        this.created_time = created_time;
    }

    public String getFinished_time() {
        return finished_time;
    }

    public void setFinished_time(String finished_time) {
        this.finished_time = finished_time;
    }

    @NotBlank(message = "创建时间不为空")
    private String created_time;

    @NotBlank(message = "完成时间不为空")
    private String finished_time;

}

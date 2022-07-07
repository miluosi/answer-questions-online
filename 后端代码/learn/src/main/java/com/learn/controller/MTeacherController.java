package com.learn.controller;


import cn.hutool.core.map.MapUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.learn.common.dto.*;
import com.learn.common.lang.Result;
import com.learn.entity.MQuestion;
import com.learn.entity.MStudent;
import com.learn.entity.MTeacher;
import com.learn.entity.PageBean;
import com.learn.service.MTeacherService;
import com.learn.util.JwtUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.util.Assert;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author mz
 * @since 2021-11-18
 */
@RestController
@RequestMapping("/m-teacher")
public class MTeacherController {
    @Autowired
    MTeacherService mTeacherService;



    @Autowired
    JwtUtils jwtUtils;



    @Autowired
    private JdbcTemplate jdbcTemplate;



    @PostMapping("/login")
    public Result login(@Validated @RequestBody TeacherDto teacherDto, HttpServletResponse response) {
        MTeacher user = mTeacherService.getOne(new QueryWrapper<MTeacher>().eq("teacherid", teacherDto.getStudentid()));
        if(user==null){
            return Result.succ(MapUtil.builder()
                    .put("msg", "empty")
                    .map()
            );
        }
        if(!user.getPassword().equals(teacherDto.getPassword())){
            return Result.succ(MapUtil.builder()
                    .put("msg", "wrong")
                    .map()
            );
        }
        String jwt = jwtUtils.generateToken(user.getId());
        response.setHeader("Authorization", jwt);
        response.setHeader("Access-control-Expose-Headers", "Authorization");
        return Result.succ(MapUtil.builder()
                .put("id", user.getId())
                .put("password",user.getPassword())
                .put("username", user.getUsername())
                .put("teacherid", teacherDto.getStudentid())
                .map()
        );
    }




    @GetMapping("/getqs")
    @ResponseBody
    public Result detail2(@RequestParam(defaultValue = "1") Integer currentPage) {
        int origin = (currentPage-1)*5;
        String select = "select t1.id,userid,qsid,t2.content qs,t1.content,finished_time from m_qsrecord t1 LEFT JOIN m_question t2 on (t1.qsid = t2.id) WHERE ifTrue is NULL LIMIT "+origin+",5";
        String select1 = "select t1.id,userid,qsid,t2.content qs,t1.content,finished_time from m_qsrecord t1 LEFT JOIN m_question t2 on (t1.qsid = t2.id) WHERE ifTrue is NULL";
        System.out.println(currentPage);
        System.out.println(select);
        List<Map<String,Object>> questions=jdbcTemplate.queryForList(select);
        List<Map<String,Object>>wholequestions=jdbcTemplate.queryForList(select1);
        Assert.notNull(questions, "信息已被删除");
        return Result.succ(PageBean.builder()
                .content(questions)
                .pages(2)
                .total(wholequestions.size())
                .size(5)
                .build());
    }



    @GetMapping("/getfinishqs")
    @ResponseBody
    public Result detail3(@RequestParam(defaultValue = "1") Integer currentPage) {
        int origin = (currentPage-1)*5;
        String select = "select t1.id,userid,qsid,t2.content qs,t1.content,finished_time from m_qsrecord t1 LEFT JOIN m_question t2 on (t1.qsid = t2.id) WHERE ifTrue is not NULL LIMIT "+origin+",5";
        String select1 = "select t1.id,userid,qsid,t2.content qs,t1.content,finished_time from m_qsrecord t1 LEFT JOIN m_question t2 on (t1.qsid = t2.id) WHERE ifTrue is not NULL";
        System.out.println(currentPage);
        System.out.println(select);
        List<Map<String,Object>> questions=jdbcTemplate.queryForList(select);
        List<Map<String,Object>>wholequestions=jdbcTemplate.queryForList(select1);
        Assert.notNull(questions, "信息已被删除");
        return Result.succ(PageBean.builder()
                .content(questions)
                .pages(2)
                .total(wholequestions.size())
                .size(5)
                .build());
    }



    @GetMapping("/check/{userid}/{id}")
    public Result detail3(@PathVariable(name = "userid") Long userid,@PathVariable(name = "id") Long id) {
        String select = "select * from m_qsrecord WHERE  id ="+id+"";
        List<Map<String,Object>>result=jdbcTemplate.queryForList(select);
        return Result.succ(result);
    }



    @GetMapping("/qsinfo/{id}")
    public Result detail3(@PathVariable(name = "id") Long id) {
        String select = "select content,trueanswer from m_question where id = "+id+"";
        List<Map<String,Object>>result=jdbcTemplate.queryForList(select);
        return Result.succ(result);
    }


    @PostMapping("/add")
    public Result login(@Validated @RequestBody CorrectDto correctDto) {
        String userid = correctDto.getUserid();
        int id = correctDto.getId();
        int ifTrue = correctDto.getIfTrue();
        String str = correctDto.getReview();
        String str1;
        String str2;
        String str3;
        str3 = "update  m_qsrecord set review = '"+str+"' where id = "+id+"";
        jdbcTemplate.update(str3);
        if(ifTrue==1)
        {
            str1 = "update  "+userid+"_qs  set ifTrue = 1 where finished_time=(select finished_time from m_qsrecord where id ="+id+")";
            str2 = "update  m_qsrecord set ifTrue = 1 where id = "+id+"";

        }else {
            str1 = "update  "+userid+"_qs  set ifTrue = 0 where finished_time=(select finished_time from m_qsrecord where id ="+id+")";
            str2 = "update  m_qsrecord set ifTrue = 0 where id = "+id+"";
        }
        jdbcTemplate.update(str1);
        jdbcTemplate.update(str2);
        return Result.succ(MapUtil.builder()
                .put("id", correctDto.getId())
                .map()
        );
    }


    @PostMapping("/updatepassword")
    public Result update(@Validated @RequestBody PwdDto pwdDto) {

        MTeacher user = mTeacherService.getOne(new QueryWrapper<MTeacher>().eq("id", pwdDto.getStudentid()));
        System.out.println(pwdDto.getStudentid());
        System.out.println(user.getPassword());
        System.out.println(pwdDto.getOldPass());
        System.out.println(pwdDto.getCheckpass());
        if(user.getPassword().equals(pwdDto.getOldPass()))
        {
            user.setPassword(pwdDto.getCheckpass());
            mTeacherService.updateById(user);
            return Result.succ(MapUtil.builder()
                    .put("id", user.getId())
                    .put("password",user.getPassword())
                    .map()
            );
        }else {
            return Result.succ(MapUtil.builder()
                    .put("id", "")
                    .map()
            );
        }
    }

    @PostMapping("/update")
    public Result update(@Validated @RequestBody UpdatetDto updateDto, HttpServletResponse response) {

        MTeacher user = mTeacherService.getOne(new QueryWrapper<MTeacher>().eq("id", updateDto.getId()));
        user.setTeacherid(updateDto.getTeacherid());
        user.setUsername(updateDto.getUsername());
        mTeacherService.updateById(user);
        return Result.succ(MapUtil.builder()
                .put("id", user.getId())
                .put("teacherid", user.getTeacherid())
                .put("username", user.getUsername())
                .map()
        );
    }



}

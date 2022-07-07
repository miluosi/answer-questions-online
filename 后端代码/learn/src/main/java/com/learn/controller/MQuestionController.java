package com.learn.controller;


import cn.hutool.core.map.MapUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.learn.common.dto.RegisterDto;
import com.learn.common.dto.SolveDto;
import com.learn.common.lang.Result;
import com.learn.entity.MQuestion;
import com.learn.entity.PageBean;
import com.learn.entity.PageList;
import com.learn.service.MQuestionService;
import com.learn.util.JdbcUtil;
import com.learn.util.Timeutil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.util.Assert;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.stream.LongStream;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author mz
 * @since 2021-11-08
 */
@RestController
@RequestMapping("/m-question")
public class MQuestionController {
    @Autowired
    MQuestionService mQuestionService;

    @Autowired
    JdbcUtil jdbcUtil;


    @Autowired
    Timeutil timeutil;

    @Autowired
    JdbcTemplate jdbcTemplate;


    
    @GetMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "1") Integer currentPage) {
        Page page = new Page(currentPage, 5);
        IPage pageData = mQuestionService.page(page, new QueryWrapper<MQuestion>().orderByAsc("id"));
        return Result.succ(pageData);
    }



    @GetMapping("/getanswer/{id}")
    @ResponseBody
    public Result detail(@PathVariable(name = "id") Integer id) {
        QueryWrapper<MQuestion> sectionQueryWrapper = new QueryWrapper<>();
        sectionQueryWrapper.eq("id", id);
        List<MQuestion> questions = mQuestionService.list(sectionQueryWrapper);
        Assert.notNull(questions, "信息已被删除");
        return Result.succ(questions);
    }


    @GetMapping("/finished/{id}")
    @ResponseBody
    public Result detail1(@PathVariable(name = "id") Integer id,@RequestParam(defaultValue = "1") Integer currentPage) {
        int origin = (currentPage-1)*10;
        String select = "SELECT t1.id,qsid ,content,created_time,finished_time,ifTrue FROM "+id+"_qs t1  LEFT JOIN m_question t2 on(t1.qsid = t2.id) ORDER BY t1.id LIMIT "+origin+",10";
        String select1 = "SELECT t1.id,qsid ,content,created_time,finished_time FROM "+id+"_qs t1  LEFT JOIN m_question t2 on(t1.qsid = t2.id) ORDER BY t1.id ";
        System.out.println(currentPage);
        System.out.println(select);
        List<Map<String,Object>>questions=jdbcTemplate.queryForList(select);
        List<Map<String,Object>>wholequestions=jdbcTemplate.queryForList(select1);
        Assert.notNull(questions, "信息已被删除");
        return Result.succ(PageBean.builder()
                .content(questions)
                .pages(2)
                .total(wholequestions.size())
                .size(10)
                .build());
    }


    @GetMapping("/Wrongqs/{id}")
    @ResponseBody
    public Result detail2(@PathVariable(name = "id") Integer id,@RequestParam(defaultValue = "1") Integer currentPage) {
        int origin = (currentPage-1)*10;
        String select = "SELECT t1.id,qsid ,content,created_time,finished_time FROM "+id+"_qs t1  LEFT JOIN m_question t2 on(t1.qsid = t2.id)  where t1.ifTrue=0 ORDER BY t1.id  LIMIT "+origin+",10";
        String select1 = " SELECT t1.id,qsid ,content,created_time,finished_time FROM "+id+"_qs t1  LEFT JOIN m_question t2 on(t1.qsid = t2.id)  where t1.ifTrue=0 ORDER BY t1.id";
        System.out.println(currentPage);
        System.out.println(select);
        List<Map<String,Object>>questions=jdbcTemplate.queryForList(select);
        List<Map<String,Object>>wholequestions=jdbcTemplate.queryForList(select1);
        Assert.notNull(questions, "信息已被删除");
        return Result.succ(PageBean.builder()
                .content(questions)
                .pages(2)
                .total(wholequestions.size())
                .size(10)
                .build());
    }


    @GetMapping("/shoucangqs/{id}")
    @ResponseBody
    public Result detail3(@PathVariable(name = "id") Integer id,@RequestParam(defaultValue = "1") Integer currentPage) {
        int origin = (currentPage-1)*10;
        String select =  "select qsid,content,trueanswer,type from "+id+"_sc t1,m_question t2 WHERE(t1.qsid = t2.id) LIMIT "+origin+",10";
        String select1 = "select qsid,content,trueanswer,type from "+id+"_sc t1,m_question t2 WHERE(t1.qsid = t2.id)";
        String select2 = " select count(type) count ,type  from (select qsid,content,trueanswer,type " +
                "from "+id+"_sc t1,m_question t2 WHERE(t1.qsid = t2.id) ) as total GROUP BY total.type order by count(type) desc";
        System.out.println(currentPage);
        System.out.println(select);
        List<Map<String,Object>>questions=jdbcTemplate.queryForList(select);
        List<Map<String,Object>>wholequestions=jdbcTemplate.queryForList(select1);
        List<Map<String,Object>>questioninfo = jdbcTemplate.queryForList(select2);
        Assert.notNull(questions, "信息已被删除");
        return Result.succ(PageBean.builder()
                .content(questions)
                .content2(questioninfo)
                .pages(2)
                .total(wholequestions.size())
                .size(10)
                .build());
    }

    @GetMapping("/{id}")
    public Result detail2(@PathVariable(name = "id") Long id) {
        MQuestion mQuestion = mQuestionService.getById(id);
        Assert.notNull(mQuestion, "该博客已被删除");
        return Result.succ(mQuestion);
    }


    @GetMapping("/check/{userid}/{id}")
    public Result detail3(@PathVariable(name = "userid") Long userid,@PathVariable(name = "id") Long id) {
        MQuestion mQuestion = mQuestionService.getById(id);
        String select = "SELECT t1.id,qsid ,content,created_time,finished_time,answer,trueanswer,whole_time FROM "+userid+"_qs t1  LEFT JOIN m_question t2 on(t1.qsid = t2.id) where t1.id = "+id+"";
        List<Map<String,Object>>result=jdbcTemplate.queryForList(select);
        return Result.succ(result);
    }


    @GetMapping("/addshoucang/{userid}/{id}")
    public Result detail4(@PathVariable(name = "userid") Long userid,@PathVariable(name = "id") Long id) {
        String insert = "insert into "+userid+"_sc (qsid) VALUES ("+id+")";
        String select = "select * from "+userid+"_sc where qsid = "+id+"";
        System.out.println(select);
        List<Map<String,Object>>result=jdbcTemplate.queryForList(select);
        if(result.isEmpty())
        {
            jdbcTemplate.update(insert);
            return Result.succ(MapUtil.builder()
                    .put("msg", "success")
                    .map());
        }else {
            return Result.succ(MapUtil.builder()
                    .put("msg", "fail")
                    .map());
        }
    }

    @PostMapping("/add")
    public Result login(@Validated @RequestBody SolveDto solveDto) {
        String userid = solveDto.getUserid();
        String qsid = solveDto.getQsid();
        String answer = solveDto.getAnswer();
        String created_time = solveDto.getCreated_time();
        String finished_time = solveDto.getFinished_time();
        System.out.println(userid);
        System.out.println(created_time);
        System.out.println(finished_time);
        long whole_time = timeutil.getDistanceTimes(created_time,finished_time);
        String tablename =userid+"_qs";
        System.out.println(tablename);
        System.out.println(created_time);
        System.out.println(finished_time);
        String getanswer = "SELECT trueanswer FROM m_question WHERE id = "+qsid+"";
        List<Map<String,Object>>result=jdbcTemplate.queryForList(getanswer);
        System.out.println(result.get(0).get("trueanswer"));
        String insert = "insert into "+tablename+" (qsid,answer,created_time,finished_time,whole_time) value ('"+qsid+"','"+answer+"','"+created_time+"','"+finished_time+"','"+whole_time+"')";
        String insert1 = "insert into m_qsrecord (userid,qsid,content,finished_time) value ('"+userid+"','"+qsid+"','"+answer+"','"+finished_time+"')";
        System.out.println(answer);
        System.out.println(insert);
        System.out.println(insert1);
        jdbcTemplate.update(insert);
        jdbcTemplate.update(insert1);
        return Result.succ(MapUtil.builder()
                .put("id", solveDto.getUserid())
                .put("qsid", solveDto.getQsid())
                .put("answer", solveDto.getAnswer())
                .put("created_time", solveDto.getCreated_time())
                .put("finished_time",solveDto.getFinished_time())
                .map()
        );
    }

    @PostMapping("/addquestion")
    public Result login(@Validated @RequestBody MQuestion question) {
        mQuestionService.save(question);
        return Result.succ(MapUtil.builder()
                .put("msg","success")
                .map()
        );
    }



}

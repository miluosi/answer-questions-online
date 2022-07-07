package com.learn.controller;


import cn.hutool.core.map.MapUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.learn.common.dto.SolveDto;
import com.learn.common.dto.TknDto;
import com.learn.common.lang.Result;
import com.learn.entity.*;
import com.learn.service.MKnowledgeService;
import com.learn.service.MQuestionService;
import com.learn.util.JdbcUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.util.Assert;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author mz
 * @since 2021-11-17
 */
@RestController
@RequestMapping("/m-knowledge")
public class MKnowledgeController {

    @Autowired
    MKnowledgeService mKnowledgeService;

    @Autowired
    JdbcTemplate jdbcTemplate;

    @GetMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "1") Integer currentPage) {
        Page page = new Page(currentPage, 10);
        IPage pageData = mKnowledgeService.page(page, new QueryWrapper<MKnowledge>().orderByAsc("id"));
        return Result.succ(pageData);
    }



    @GetMapping("/getone/{id}")
    @ResponseBody
    public Result detail(@PathVariable(name = "id") Integer id) {
        QueryWrapper<MKnowledge> sectionQueryWrapper = new QueryWrapper<>();
        sectionQueryWrapper.eq("id", id);
        List<MKnowledge> questions = mKnowledgeService.list(sectionQueryWrapper);
        Assert.notNull(questions, "信息已被删除");
        return Result.succ(questions);
    }


    @GetMapping("/gettips")
    @ResponseBody
    public Result updateinfo(@RequestParam Integer qsid) {
        String select = "SELECT * from mapping t1 LEFT JOIN m_knowledge t2 on(t1.knid = t2.id) where qsid = "+qsid+"";
        List<Map<String,Object>> userinfo=jdbcTemplate.queryForList(select);
        return Result.succ(PageBean.builder()
                .content(userinfo)
                .build());
    }




    @GetMapping("/getreview/{userid}/{qsid}")
    @ResponseBody
    public Result detail(@PathVariable(name = "userid") Integer userid,@PathVariable(name = "qsid") Integer qsid) {
        String select = "select * from m_qsrecord where finished_time = (select finished_time from "+userid+"_qs where id = "+qsid+")";
        List<Map<String,Object>> userinfo=jdbcTemplate.queryForList(select);
        return Result.succ(PageBean.builder()
                .content(userinfo)
                .build());
    }



    @PostMapping("/add")
    public Result login(@Validated @RequestBody MKnowledge mKnowledge) {
        mKnowledgeService.save(mKnowledge);
        return Result.succ(MapUtil.builder()
                .put("msg","success")
                .map()
        );
    }



    @PostMapping("/alter")
    public Result add(@Validated @RequestBody TknDto tknDto) {
        String userid = tknDto.getKnid();
        QueryWrapper<MKnowledge> sectionQueryWrapper = new QueryWrapper<>();
        sectionQueryWrapper.eq("id", tknDto.getKnid());
        List<MKnowledge> record1 = mKnowledgeService.list(sectionQueryWrapper);
        MKnowledge mKnowledge = record1.get(0);
        mKnowledge.setContent(tknDto.getContent());
        mKnowledgeService.updateById(mKnowledge);
        return Result.succ(MapUtil.builder()
                .put("id", tknDto.getKnid())
                .map()
        );
    }



    @PostMapping("/dele")
    public Result dele(@Validated @RequestBody String id) {
        System.out.println(id);
        mKnowledgeService.removeById(id);
        return Result.succ(MapUtil.builder()
                .put("msg", "success")
                .map()
        );
    }

}

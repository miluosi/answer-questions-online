package com.learn.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.learn.common.lang.Result;
import com.learn.entity.MStudent;
import com.learn.service.MStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author mz
 * @since 2021-11-07
 */
@RestController
@RequestMapping("/m-student")
public class MStudentController {
    @Autowired
    MStudentService mStudentService;

    @GetMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "1") Integer currentPage) {
        Page page = new Page(currentPage, 5);
        IPage pageData = mStudentService.page(page, new QueryWrapper<MStudent>().orderByDesc("id"));
        return Result.succ(pageData);
    }

    @GetMapping("/id/{studentid}")
    @ResponseBody
    public Result detail(@PathVariable(name = "studentid") String studentid) {
        QueryWrapper<MStudent> sectionQueryWrapper = new QueryWrapper<>();
        sectionQueryWrapper.eq("studentid", studentid);
        List<MStudent> blogs = mStudentService.list(sectionQueryWrapper);
        Assert.notNull(blogs, "学生信息已被删除");
        return Result.succ(blogs);
    }
}

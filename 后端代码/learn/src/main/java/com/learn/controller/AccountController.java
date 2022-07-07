package com.learn.controller;

import cn.hutool.core.map.MapUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.learn.common.dto.LoginDto;
import com.learn.common.dto.PwdDto;
import com.learn.common.dto.RegisterDto;
import com.learn.common.dto.UpdateDto;
import com.learn.common.lang.Result;
import com.learn.entity.MKnowledge;
import com.learn.entity.MStudent;
import com.learn.entity.PageBean;
import com.learn.service.MStudentService;
import com.learn.util.JwtUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.util.Assert;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/*
* 整合jwt编写的登录接口
* */
@RestController
public class AccountController {

    @Autowired
    MStudentService studentService;



    @Autowired
    private JdbcTemplate jdbcTemplate;



    @Autowired
    JwtUtils jwtUtils;

    @PostMapping("/login")
    public Result login(@Validated @RequestBody LoginDto loginDto, HttpServletResponse response) {

        MStudent user = studentService.getOne(new QueryWrapper<MStudent>().eq("studentid", loginDto.getStudentid()));
        if(user==null){
            return Result.succ(MapUtil.builder()
                    .put("id", "")
                    .put("msg", "empty")
                    .map()
            );
        }
        if(!user.getPassword().equals(loginDto.getPassword())){
            return Result.succ(MapUtil.builder()
                    .put("id", "")
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
                .put("sex",user.getSex())
                .put("username", user.getUsername())
                .put("specialty", user.getSpecialty())
                .put("studentid", user.getStudentid())
                .put("userlevel", user.getUserlevel())
                .map()
        );
    }


    @RequiresAuthentication
    @GetMapping("/logout")
    public Result logout() {
        SecurityUtils.getSubject().logout();
        return Result.succ(null);
    }

    @PostMapping("/getuserinfo")
    public Result etuserinfo(@Validated @RequestBody Long studentid) {

        MStudent user = studentService.getOne(new QueryWrapper<MStudent>().eq("studentid", studentid));
        return Result.succ(MapUtil.builder()
                .put("id", user.getId())
                .put("password",user.getPassword())
                .put("sex",user.getSex())
                .put("username", user.getUsername())
                .put("specialty", user.getSpecialty())
                .put("studentid", user.getStudentid())
                .map()
        );
    }

    @GetMapping("/userqs")
    @ResponseBody
    public Result getuserinfo(@RequestParam Long studentid) {
        String select = "select date_format(finished_time, '%Y-%m-%d') date,count(*) count,sum(whole_time) time,sum(ifTrue)/count(*) tr from "+studentid+"_qs  group by date_format(finished_time, '%Y-%m-%d');";
        List<Map<String,Object>> questions=jdbcTemplate.queryForList(select);
        return Result.succ(PageBean.builder()
                .content(questions)
                .build());
    }
    @GetMapping("/qsinfo")
    @ResponseBody
    public Result getqsinfo() {
        String select = "select distinct type,qslevel from m_question";
        List<Map<String,Object>> questions=jdbcTemplate.queryForList(select);
        return Result.succ(PageBean.builder()
                .content(questions)
                .build());
    }



    @GetMapping("/getupdateinfo")
    @ResponseBody
    public Result updateinfo(@RequestParam Long studentid) {
        String select = "select count(DISTINCT qsid) count,type,ANY_VALUE(qslevel) qslevel FROM "+studentid+"_qs t1 LEFT JOIN m_question t2 on(t1.qsid = t2.id)  where ifTrue=1 GROUP BY type ORDER BY type";
        String select1 = "select count(id) count,type,ANY_VALUE(qslevel) qslevel from m_question GROUP BY type order by qslevel";
      /*  String select = "select count(DISTINCT qsid) count,type, qslevel FROM "+studentid+"_qs t1 LEFT JOIN m_question t2 on(t1.qsid = t2.id)  where ifTrue=1 GROUP BY type ORDER BY type";
        String select1 = "select count(id) count,type, qslevel from m_question GROUP BY type order by qslevel";*/
        MStudent user = studentService.getOne(new QueryWrapper<MStudent>().eq("studentid", studentid));
        int userlevel = user.getUserlevel();
        List<Map<String,Object>> userinfo=jdbcTemplate.queryForList(select);
        List<Map<String,Object>> qsinfo=jdbcTemplate.queryForList(select1);
        return Result.succ(PageBean.builder()
                .content(userinfo)
                .content2(qsinfo)
                .page(userlevel)
                .build());
    }



    @PostMapping("/register")
    public Result login(@Validated @RequestBody RegisterDto registerdto) {
        MStudent student = new MStudent();
        QueryWrapper<MStudent> sectionQueryWrapper = new QueryWrapper<>();
        sectionQueryWrapper.eq("studentid", registerdto.getStudentid());
        List<MStudent> record1 = studentService.list(sectionQueryWrapper);
        if(record1.size()!=0){
            return Result.succ(MapUtil.builder()
                    .put("resultcode", 500)
                    .map()
            );
        }
        QueryWrapper<MStudent> sectionQueryWrapper1 = new QueryWrapper<>();
        sectionQueryWrapper1.eq("username", registerdto.getUsername());
        List<MStudent> record2 = studentService.list(sectionQueryWrapper1);
        if(record2.size()!=0){
            return Result.succ(MapUtil.builder()
                    .put("resultcode", 400)
                    .map()
            );
        }
        student.setUsername(registerdto.getUsername());
        student.setPassword(registerdto.getPassword());
        student.setSex(registerdto.getSex());
        student.setSpecialty(registerdto.getSpecialty());
        student.setStudentid(registerdto.getStudentid());
        studentService.save(student);
        String studentid = registerdto.getStudentid();
        String tablename = studentid+"_qs";
        String constraint = "ts1_ibfk"+registerdto.getStudentid();
        String create = "CREATE TABLE `"+tablename+"`  (`id` int(11) NOT NULL AUTO_INCREMENT,`qsid` " +
                "int(11) NULL DEFAULT NULL," +
                " `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL," +
                "`created_time` datetime(0) NULL DEFAULT NULL," +
                "`finished_time` datetime(0) NULL DEFAULT NULL," +
                "`ifTrue` bigint(1) NULL DEFAULT NULL,"+
                "`whole_time` int(11) NULL DEFAULT NULL,"+
                " PRIMARY KEY (`id`) USING BTREE, INDEX `qsid`(`qsid`) USING BTREE," +
                " CONSTRAINT `"+constraint+"` FOREIGN KEY (`qsid`) REFERENCES `m_question` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE)";
        String create1 = "CREATE TABLE `"+studentid+"_sc`  (" +
                "  `id` int(11) NOT NULL AUTO_INCREMENT," +
                "  `qsid` int(11) NOT NULL," +
                "  PRIMARY KEY (`id`, `qsid`) USING BTREE," +
                "  INDEX `qsid`(`qsid`) USING BTREE," +
                "  CONSTRAINT `"+studentid+"_sc_ibfk_1` FOREIGN KEY (`qsid`) REFERENCES `m_question` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE" +
                ")";
        jdbcTemplate.update(create);
        jdbcTemplate.update(create1);
        return Result.succ(MapUtil.builder()
                .put("id", student.getId())
                .put("username", student.getUsername())
                .put("specialty", student.getSpecialty())
                .put("studentid", student.getStudentid())
                .map()
        );
    }

    @PostMapping("/user/update")
    public Result update(@Validated @RequestBody UpdateDto updateDto, HttpServletResponse response) {

        MStudent user = studentService.getOne(new QueryWrapper<MStudent>().eq("studentid", updateDto.getStudentid()));
        user.setStudentid(updateDto.getStudentid());
        user.setUsername(updateDto.getUsername());
        user.setSex(updateDto.getSex());
        user.setSpecialty(updateDto.getSpecialty());
        studentService.updateById(user);
        return Result.succ(MapUtil.builder()
                .put("id", user.getId())
                .put("password",user.getPassword())
                .put("sex",user.getSex())
                .put("username", user.getUsername())
                .put("specialty", user.getSpecialty())
                .put("studentid", user.getStudentid())
                .map()
        );
    }



    @GetMapping("/user/updateuserlevel")
    @ResponseBody
    public Result updateinfo2(@RequestParam Long studentid) {
        System.out.println(studentid);
        MStudent user = studentService.getOne(new QueryWrapper<MStudent>().eq("studentid", studentid));
        Integer userlevel = user.getUserlevel()+1;
        user.setUserlevel(userlevel);
        studentService.updateById(user);
        return Result.succ(MapUtil.builder()
                .put("id", user.getId())
                .map()
        );
    }


    @PostMapping("/user/updatepassword")
    public Result update(@Validated @RequestBody PwdDto pwdDto) {

        MStudent user = studentService.getOne(new QueryWrapper<MStudent>().eq("studentid", pwdDto.getStudentid()));
        System.out.println(pwdDto.getStudentid());
        System.out.println(user.getPassword());
        System.out.println(pwdDto.getOldPass());
        System.out.println(pwdDto.getCheckpass());
        if(user.getPassword().equals(pwdDto.getOldPass()))
        {
            user.setPassword(pwdDto.getCheckpass());
            studentService.updateById(user);
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
}

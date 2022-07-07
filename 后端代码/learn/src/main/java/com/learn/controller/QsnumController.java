package com.learn.controller;


import cn.hutool.core.map.MapUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.learn.common.lang.Result;
import com.learn.entity.MQuestion;
import com.learn.entity.MStudent;
import com.learn.entity.Qsnum;
import com.learn.service.MQuestionService;
import com.learn.service.QsnumService;
import io.swagger.models.auth.In;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.util.Assert;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.*;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author mz
 * @since 2021-11-30
 */
@RestController
@RequestMapping("/qsnum")
public class QsnumController {


    @Autowired
    QsnumService qsnumService;



    @Autowired
    MQuestionService mQuestionService;


    @Autowired
    JdbcTemplate jdbcTemplate;


    @PostMapping("/addqsnum")
    public Result etuserinfo(@Validated @RequestBody Qsnum qsnum) {
        QueryWrapper<Qsnum> sectionQueryWrapper = new QueryWrapper<>();
        sectionQueryWrapper.eq("userid", qsnum.getUserid());
        sectionQueryWrapper.eq("qsid", qsnum.getQsid());
        List<Qsnum> record1 = qsnumService.list(sectionQueryWrapper);
        if (record1.size() == 0) {
            qsnum.setNum(1);
            qsnumService.save(qsnum);
            return Result.succ(MapUtil.builder()
                    .put("msg", "empty")
                    .map());
        } else {
            qsnum = record1.get(0);
            int newnum = qsnum.getNum();
            qsnum.setNum(newnum + 1);
            qsnumService.updateById(qsnum);
            return Result.succ(MapUtil.builder()
                    .put("msg", "exist")
                    .map());
        }
    }


    @GetMapping("/getinfo/{userid}")
    public Result detail2(@PathVariable(name = "userid") Long userid) {
        QueryWrapper<Qsnum> sectionQueryWrapper = new QueryWrapper<>();
        sectionQueryWrapper.eq("userid", userid);
        List<Qsnum> record1 = qsnumService.list(sectionQueryWrapper);
        System.out.println(record1);
        QueryWrapper<Qsnum> sectionQueryWrapper2 = new QueryWrapper<>();
        sectionQueryWrapper2.ne("userid", userid);
        List<Qsnum> record2 = qsnumService.list(sectionQueryWrapper2);
        List username = new ArrayList();
        for (int i = 0; i < record2.size(); i++) {
            if (!username.contains(record2.get(i).getUserid())) {
                username.add(record2.get(i).getUserid());
            }
        }
        List userqs = new ArrayList();
        for (int i = 0; i < record1.size(); i++) {
            userqs.add(record1.get(i).getQsid());
        }
        HashMap<String, List<Integer>> Sites = new HashMap<String, List<Integer>>();
        for (int i = 0; i < username.size(); i++) {
            QueryWrapper<Qsnum> sectionQueryWrapper3 = new QueryWrapper<>();
            System.out.println(username.get(i));
            sectionQueryWrapper3.eq("userid", username.get(i));
            List<Qsnum> otherrecord = qsnumService.list(sectionQueryWrapper3);
            System.out.println(otherrecord);
            List otheruserqs = new ArrayList();
            for (int j = 0; j < otherrecord.size(); j++) {
                otheruserqs.add(otherrecord.get(j).getQsid());
            }
            System.out.println(otheruserqs);
            Sites.put(username.get(i).toString(), otheruserqs);
        }
        HashMap<String, Double> simi = new HashMap<String, Double>();
        List userunfinish = new ArrayList();
        for (Map.Entry<String, List<Integer>> arg : Sites.entrySet()) {
            String username1 = arg.getKey();
            List<Integer> p = arg.getValue();
            System.out.println("原用户:" + userqs);
            System.out.println("其他用户:" + p);
            for (int i = 0; i < p.size(); i++) {
                if (!userunfinish.contains(p.get(i))) {
                    userunfinish.add(p.get(i));
                }
            }
            Collection exists = new ArrayList(p);
            Collection notexists = new ArrayList(p);
            exists.removeAll(userqs);
            System.out.println(username1 + "中不存在于用户中的：" + exists);
            notexists.removeAll(exists);
            System.out.println(username1 + "中存在于_set中的：" + notexists);
            System.out.println("数量是:" + notexists.size());
            System.out.println("用户名:" + arg.getKey() + "值:" + arg.getValue());
            Double thissism = notexists.size() / (Math.sqrt(userqs.size() * p.size()));
            simi.put(arg.getKey(), thissism);
        }
        userunfinish.removeAll(userqs);
        HashMap<Integer, Double> unfi = new HashMap<Integer, Double>();
        for (int i = 0; i < userunfinish.size(); i++) {
            Double resultinput = 0.0;
            for (Map.Entry<String, List<Integer>> arg : Sites.entrySet()) {
                if (arg.getValue().contains(userunfinish.get(i))) {
                    QueryWrapper<Qsnum> sectionQueryWrapper4 = new QueryWrapper<>();
                    sectionQueryWrapper4.eq("userid", arg.getKey());
                    sectionQueryWrapper4.eq("qsid", userunfinish.get(i));
                    int num = qsnumService.list(sectionQueryWrapper4).get(0).getNum();
                    resultinput += simi.get(arg.getKey()) * num;
                }
            }
            unfi.put(Integer.valueOf(userunfinish.get(i).toString()), resultinput);
        }
        System.out.println(Sites);
        System.out.println(userunfinish);
        System.out.println(unfi);
        System.out.println(simi);
        List<Map.Entry<String, Double>> list = new ArrayList<>(simi.entrySet());
        Collections.sort(list, new Comparator<Map.Entry<String, Double>>() {
            @Override
            public int compare(Map.Entry<String, Double> o1, Map.Entry<String, Double> o2) {
                return o1.getValue().compareTo(o2.getValue());
            }
        });
        List usertijiao = new ArrayList();
        List qstijiao = new ArrayList();
        for (Map.Entry<String, Double> mapping : list) {
            System.out.println(mapping.getKey() + ":" + mapping.getValue());
            usertijiao.add(mapping.getKey());
        }
        Collections.reverse(usertijiao);
        List<Map.Entry<Integer, Double>> list2 = new ArrayList<>(unfi.entrySet());
        Collections.sort(list2, new Comparator<Map.Entry<Integer, Double>>() {
            @Override
            public int compare(Map.Entry<Integer, Double> o1, Map.Entry<Integer, Double> o2) {
                return o1.getValue().compareTo(o2.getValue());
            }
        });
        for (Map.Entry<Integer, Double> mapping : list2) {
            System.out.println(mapping.getKey() + ":" + mapping.getValue());
            qstijiao.add(mapping.getKey());
        }
        Collections.reverse(qstijiao);
        System.out.println(list2);
        List qsre = new ArrayList();
        qsre = qstijiao.subList(0,3);
        usertijiao = usertijiao.subList(0,3);
        List<Integer> favp = new ArrayList<>();
        for (int i=0;i<usertijiao.size();i++)
        {
            QueryWrapper<MQuestion> sectionQueryWrapper6 = new QueryWrapper<>();
            String userfav = "SELECT qsid from m_qsnum where userid = '"+username.get(i)+"' AND num = (SELECT max(num) from m_qsnum where userid = '"+username.get(i)+"')";
            List<Map<String,Object>> favrecord=jdbcTemplate.queryForList(userfav);
            for(int j= 0;j<favrecord.size();j++)
            {
                favp.add(Integer.valueOf(favrecord.get(j).get("qsid").toString()));
            }
        }
        for(int i=0;i<favp.size();i++)
        {
            if(!qsre.contains(favp.get(i))){
                qsre.add(favp.get(i));
            }
        }
        List<MQuestion> wholeque = new ArrayList<>();
        for(int i=0;i<qsre.size();i++)
        {
            QueryWrapper<MQuestion> sectionQueryWrapper5 = new QueryWrapper<>();
            sectionQueryWrapper5.eq("id", qsre.get(i));
            List<MQuestion> otherrecord = mQuestionService.list(sectionQueryWrapper5);
            wholeque.addAll(otherrecord);
        }
        System.out.println(wholeque);
        System.out.println(qsre);
        System.out.println(username);
        System.out.println(usertijiao);
        return Result.succ(MapUtil.builder()
                .put("user", simi)
                .put("qslist", qstijiao)
                .put("userlist", usertijiao)
                .put("qs", unfi)
                .put("qsre",wholeque)
                .map());
    }


}

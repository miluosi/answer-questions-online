package com.learn.service.impl;

import com.learn.entity.MBlog;
import com.learn.mapper.MBlogMapper;
import com.learn.service.MBlogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author mz
 * @since 2021-11-07
 */
@Service
public class MBlogServiceImpl extends ServiceImpl<MBlogMapper, MBlog> implements MBlogService {

}

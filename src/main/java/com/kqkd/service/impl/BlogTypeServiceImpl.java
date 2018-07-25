package com.kqkd.service.impl;

import com.kqkd.dao.BlogTypeDao;
import com.kqkd.pojo.Blog;
import com.kqkd.service.BlogService;
import com.kqkd.service.BlogTypeService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class BlogTypeServiceImpl implements BlogTypeService {

    @Autowired
    private BlogTypeDao blogTypeDaoDao;

    @Override
    public Blog getBlogById(Integer id) {
        return blogTypeDaoDao.getBlogById(id);
    }
}

package com.kqkd.service.impl;

import com.kqkd.dao.BlogDao;
import com.kqkd.pojo.Blog;
import com.kqkd.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class BlogServiceImpl implements BlogService {

    @Autowired
    private BlogDao blogDao;

    @Override
    public List<Blog> queryBlog(Blog blog) {
        return blogDao.queryBlog(blog);
    }
}

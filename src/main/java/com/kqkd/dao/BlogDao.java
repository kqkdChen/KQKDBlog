package com.kqkd.dao;

import com.kqkd.pojo.Blog;

import java.util.List;

public interface BlogDao {

    public List<Blog> queryBlog(Blog blog);

}

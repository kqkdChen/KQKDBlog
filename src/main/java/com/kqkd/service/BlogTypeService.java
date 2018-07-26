package com.kqkd.service;

import com.kqkd.pojo.BlogType;
import com.kqkd.pojo.BlogTypeExample;

import java.util.List;

public interface BlogTypeService {
    int deleteByPrimaryKey(Integer id);

    int insert(BlogType record);

    int insertSelective(BlogType record);

    List<BlogType> selectByExample(BlogTypeExample example);

    BlogType selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BlogType record);

    int updateByPrimaryKey(BlogType record);
}
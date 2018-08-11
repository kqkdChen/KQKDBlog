package com.kqkd.dao;

import com.kqkd.pojo.BlogType;
import com.kqkd.pojo.example.BlogTypeExample;

import java.util.List;

public interface BlogTypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BlogType record);

    int insertSelective(BlogType record);

    List<BlogType> selectByExample(BlogTypeExample example);

    BlogType selectByPrimaryKey(Integer id);

    List<BlogType> countList();

    int updateByPrimaryKeySelective(BlogType record);

    int updateByPrimaryKey(BlogType record);
}
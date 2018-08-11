package com.kqkd.service;

import com.kqkd.pojo.Comment;
import com.kqkd.pojo.example.CommentExample;

import java.util.List;

public interface CommentService {
    int deleteByPrimaryKey(Integer id);

    int insert(Comment record);

    int insertSelective(Comment record);

    List<Comment> selectByExample(CommentExample example);

    Comment selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKey(Comment record);
}
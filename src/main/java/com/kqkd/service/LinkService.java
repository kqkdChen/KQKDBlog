package com.kqkd.service;

import com.kqkd.pojo.Link;
import com.kqkd.pojo.example.LinkExample;

import java.util.List;

public interface LinkService {
    int deleteByPrimaryKey(Integer id);

    int insert(Link record);

    int insertSelective(Link record);

    List<Link> selectByExample(LinkExample example);

    Link selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Link record);

    int updateByPrimaryKey(Link record);
}
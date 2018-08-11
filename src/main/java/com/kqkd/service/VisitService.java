package com.kqkd.service;

import com.kqkd.pojo.Visit;
import com.kqkd.pojo.example.VisitExample;

import java.util.List;

public interface VisitService {
    int deleteByPrimaryKey(Integer id);

    int insert(Visit record);

    int insertSelective(Visit record);

    List<Visit> selectByExample(VisitExample example);

    Visit selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Visit record);

    int updateByPrimaryKey(Visit record);
}
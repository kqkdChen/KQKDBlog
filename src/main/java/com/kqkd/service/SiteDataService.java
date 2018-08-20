package com.kqkd.service;

import com.kqkd.pojo.SiteData;
import com.kqkd.pojo.example.SiteDataExample;

import java.util.List;

public interface SiteDataService {
    int deleteByPrimaryKey(Integer id);

    int insert(SiteData record);

    int insertSelective(SiteData record);

    SiteData findDvp();

    List<SiteData> selectByExample(SiteDataExample example);

    SiteData selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SiteData record);

    int updateByPrimaryKey(SiteData record);
}
package com.kqkd.service.impl;

import com.kqkd.dao.SiteDataMapper;
import com.kqkd.pojo.SiteData;
import com.kqkd.pojo.example.SiteDataExample;
import com.kqkd.service.SiteDataService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author kqkd
 * @date 2018/8/11 16:19
 */
@Service("siteDataService")
public class SiteDataServiceImpl implements SiteDataService {

    @Resource
    private SiteDataMapper siteDataMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return siteDataMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(SiteData record) {
        return siteDataMapper.insert(record);
    }

    @Override
    public int insertSelective(SiteData record) {
        return siteDataMapper.insertSelective(record);
    }

    @Override
    public List<SiteData> selectByExample(SiteDataExample example) {
        return siteDataMapper.selectByExample(example);
    }

    @Override
    public SiteData selectByPrimaryKey(Integer id) {
        return siteDataMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(SiteData record) {
        return siteDataMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public SiteData findDvp() {
        return siteDataMapper.findDvp();
    }

    @Override
    public int updateByPrimaryKey(SiteData record) {
        return siteDataMapper.updateByPrimaryKey(record);
    }
}

package com.kqkd.service.impl;

import com.kqkd.dao.VisitMapper;
import com.kqkd.pojo.Visit;
import com.kqkd.pojo.example.VisitExample;
import com.kqkd.service.VisitService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author kqkd
 * @date 2018/8/11 12:07
 */
@Service("visitService")
public class VisitServiceImpl  implements VisitService {


    @Resource
    private VisitMapper visitMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return visitMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Visit record) {
        return visitMapper.insert(record);
    }

    @Override
    public int insertSelective(Visit record) {
        return visitMapper.insertSelective(record);
    }

    @Override
    public List<Visit> selectByExample(VisitExample example) {
        return visitMapper.selectByExample(example);
    }

    @Override
    public Visit selectByPrimaryKey(Integer id) {
        return visitMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Visit record) {
        return visitMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Visit record) {
        return visitMapper.updateByPrimaryKey(record);
    }
}

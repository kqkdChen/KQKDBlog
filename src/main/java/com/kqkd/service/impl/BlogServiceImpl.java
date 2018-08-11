package com.kqkd.service.impl;

import com.kqkd.dao.BlogMapper;
import com.kqkd.pojo.Blog;
import com.kqkd.pojo.example.BlogExample;
import com.kqkd.service.BlogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author kqkd
 * @date 2018/7/30 15:50
 */
@Service("blogService")
public class BlogServiceImpl implements BlogService {

    @Resource
    private BlogMapper blogMapper;

    @Override
    public List<Blog> selectKeywords() {
        return blogMapper.selectKeywords();
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return blogMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Blog record) {
        return blogMapper.insert(record);
    }

    @Override
    public int insertSelective(Blog record) {
        return blogMapper.insertSelective(record);
    }

    @Override
    public List<Blog> selectByExampleWithBLOBs(BlogExample example) {
        return blogMapper.selectByExampleWithBLOBs(example);
    }

    @Override
    public List<Blog> selectByExample(BlogExample example) {
        return blogMapper.selectByExample(example);
    }

    @Override
    public Blog selectByPrimaryKey(Integer id) {
        return blogMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Blog record) {
        return blogMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKeyWithBLOBs(Blog record) {
        return updateByPrimaryKeyWithBLOBs(record);
    }

    @Override
    public int updateByPrimaryKey(Blog record) {
        return blogMapper.updateByPrimaryKey(record);
    }
}

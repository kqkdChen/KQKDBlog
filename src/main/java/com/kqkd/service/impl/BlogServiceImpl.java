package com.kqkd.service.impl;

import com.kqkd.dao.BlogMapper;
import com.kqkd.pojo.Blog;
import com.kqkd.pojo.BlogExample;
import com.kqkd.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("blogService")
public class BlogServiceImpl implements BlogService {

	@Autowired
	private BlogMapper blogMapper;

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
		return blogMapper.updateByPrimaryKeyWithBLOBs(record);
	}

	@Override
	public int updateByPrimaryKey(Blog record) {
		return blogMapper.updateByPrimaryKey(record);
	}
}

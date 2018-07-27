package com.kqkd.service.impl;

import com.kqkd.dao.BlogTypeMapper;
import com.kqkd.pojo.BlogType;
import com.kqkd.pojo.BlogTypeExample;
import com.kqkd.service.BlogTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("blogTypeService")
public class BlogTypeServiceImpl implements BlogTypeService {

	@Autowired
	private BlogTypeMapper blogTypeMapper;


	@Override
	public int deleteByPrimaryKey(Integer id) {
		return blogTypeMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<BlogType> countList() {
		return blogTypeMapper.countList();
	}

	@Override
	public int insert(BlogType record) {
		return blogTypeMapper.insert(record);
	}

	@Override
	public int insertSelective(BlogType record) {
		return blogTypeMapper.insertSelective(record);
	}

	@Override
	public List<BlogType> selectByExample(BlogTypeExample example) {
		return blogTypeMapper.selectByExample(example);
	}

	@Override
	public BlogType selectByPrimaryKey(Integer id) {
		return blogTypeMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(BlogType record) {
		return blogTypeMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(BlogType record) {
		return blogTypeMapper.updateByPrimaryKey(record);
	}
}

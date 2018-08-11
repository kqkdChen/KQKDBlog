package com.kqkd.service.impl;

import com.kqkd.dao.LinkMapper;
import com.kqkd.pojo.Link;
import com.kqkd.pojo.example.LinkExample;
import com.kqkd.service.LinkService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("linkService")
public class LinkServiceImpl implements LinkService {

	@Resource
	private LinkMapper linkMapper;

	@Override
	public int deleteByPrimaryKey(Integer id) {
		return linkMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Link record) {
		return linkMapper.insert(record);
	}

	@Override
	public int insertSelective(Link record) {
		return linkMapper.insertSelective(record);
	}

	@Override
	public List<Link> selectByExample(LinkExample example) {
		return linkMapper.selectByExample(example);
	}

	@Override
	public Link selectByPrimaryKey(Integer id) {
		return linkMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(Link record) {
		return linkMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Link record) {
		return 0;
	}
}

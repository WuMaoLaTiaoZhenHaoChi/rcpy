package com.duant.rcpy.service.serviceImpl;

import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.duant.rcpy.domain.Text;
import com.duant.rcpy.mapper.TextMapper;
import com.duant.rcpy.service.TextService;

@Transactional
@Service
public class TextServiceImpl implements TextService{
	
	@Autowired
	private TextMapper textMapper;

	@Override
	public int insert(Text text) {
		return textMapper.insert(text);
	}

	@Override
	public int deleteByPrimaryKey(Integer infoid) {
		return textMapper.deleteByPrimaryKey(infoid);
	}

	@Override
	public int updateByPrimaryKey(Text text) {
		return textMapper.updateByPrimaryKey(text);
	}

	@Override
	public Text selectTextByPrimaryKey(Integer infoid) {
		return textMapper.selectTextByPrimaryKey(infoid);
	}

}

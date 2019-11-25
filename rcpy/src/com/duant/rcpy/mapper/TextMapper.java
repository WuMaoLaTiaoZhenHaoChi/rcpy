package com.duant.rcpy.mapper;

import com.duant.rcpy.domain.Text;

public interface TextMapper {
	
	int insert(Text text);
	
	int deleteByPrimaryKey(Integer infoid);
	
	int updateByPrimaryKey(Text text);
	
	Text selectTextByPrimaryKey(Integer infoid);
	
}

package com.duant.rcpy.service;

import com.duant.rcpy.domain.Text;

public interface TextService {

	//增加
	public int insert(Text text);
	
	//删除
	public int deleteByPrimaryKey(Integer infoid);
	
	//修改
	public int updateByPrimaryKey(Text text);
	
	//查询
	public Text selectTextByPrimaryKey(Integer infoid);
	
	
}

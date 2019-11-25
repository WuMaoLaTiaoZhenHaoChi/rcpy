package com.duant.rcpy.mapper;

import java.util.List;

import com.duant.rcpy.domain.Info;

public interface InfoMapper {
	public int replaceIntoInfo(Info info);
	
	Integer updateChangeByInfoid(Integer infoid);
	
	Integer updateSubmitByInfoid(Integer infoid);
	
	Integer updateInfoByInfoid(Integer infoid,Integer userid);
	
	Info selectByPrimaryKey(Integer infoid);
	
	List<Info> selectAllInfo();
	
	List<Info> selectInfoByPage(Integer start,Integer pageSize);
	
	List<Integer> selectAllGrade();
	
	List<String> selectAllCollegeByGrade(Integer grade);
	
	List<String> selectAllSpecialtyByCollege(Integer grade, String college);
	
	Info selectInfoByGCS(Integer grade,String college,String specialty);
	
}

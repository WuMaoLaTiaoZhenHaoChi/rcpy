package com.duant.rcpy.mapper;

import java.util.List;

import com.duant.rcpy.domain.Infotosubject;

public interface InfotosubjectMapper {
	
	int insert(Infotosubject its);
	
	int deleteByPrimaryKey(Integer infoid,Integer subjectid);
	
	int updateByPrimaryKey(Infotosubject its);
	
	List<Infotosubject> selectAllByPrimaryKey(Integer infoid);

	List<Integer> selectSubjectIdByPrimaryKey(Integer infoid,Integer semester);
	
	Infotosubject selectSubjectIdByIAndS(Integer infoid,Integer subjectid);
}

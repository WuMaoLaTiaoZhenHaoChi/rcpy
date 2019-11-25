package com.duant.rcpy.mapper;

import java.util.List;

import com.duant.rcpy.domain.Subject;

public interface SubjectMapper {
	public int replaceIntoSubject(Subject subject);
	
	Subject selectSubjectByName(String subjectname);
	
	Subject selectByPrimaryKey(Integer subjectid);
	
	List<Subject> selectAllSubject();
	
	List<Subject> selectSubjectByProperty(String property1,String property2);
	
}

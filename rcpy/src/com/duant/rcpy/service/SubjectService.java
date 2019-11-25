package com.duant.rcpy.service;

import java.util.List;

import com.duant.rcpy.domain.Subject;

public interface SubjectService {
	
	public int replaceIntoSubject(Subject subject);
	
	/**
	 * 通过学科名称查询subject
	 * @param subjectname
	 * @return
	 */
	
	Subject selectSubjectByName(String subjectname);
	
	/**
	 * 通过subjectid查询Subject
	 * @param subjectid
	 * @return
	 */
	Subject selectByPrimaryKey(Integer subjectid);
	
	/**
	 * 通过infoid查询所有科目
	 * @param infoid
	 * @return
	 */
	List<Subject> selectAllByInfoid(Integer infoid);
	
	/**
	 * 通过infoid和学期查询所有的学科
	 * @param infoid
	 * @param semester
	 * @return
	 */
	List<Subject> selectAllByPrimaryKey(Integer infoid, Integer semester);
	
	/**
	 * 查询所有学科
	 * @return Subject
	 */
	
	List<Subject> selectAllSubject();
	
}

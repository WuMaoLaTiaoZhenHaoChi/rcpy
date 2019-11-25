package com.duant.rcpy.service.serviceImpl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.duant.rcpy.domain.Infotosubject;
import com.duant.rcpy.domain.Subject;
import com.duant.rcpy.mapper.InfotosubjectMapper;
import com.duant.rcpy.mapper.SubjectMapper;
import com.duant.rcpy.service.SubjectService;

@Transactional
@Service
public class SubjectServiceImpl implements SubjectService {
	
	@Autowired
	private SubjectMapper subjectMapper;
	@Autowired
	private InfotosubjectMapper infotosubjectMapper;
	
	//管理员编辑subject
	public int replaceIntoSubject(Subject subject) {
		int i = 0;
		if(subject != null) {
			Subject subject1 = subjectMapper.selectSubjectByName(subject.getSubjectname());	
			if(subject1 != null) {
				subject.setSubjectid(subject1.getSubjectid());		
			}
			i = subjectMapper.replaceIntoSubject(subject);
		}
		return i;
	}
	
	@Override
	public Subject selectSubjectByName(String subjectname) {
		return subjectMapper.selectSubjectByName(subjectname);
	}
	

	@Override
	public Subject selectByPrimaryKey(Integer subjectid) {
		return subjectMapper.selectByPrimaryKey(subjectid);
	}

	@Override
	public List<Subject> selectAllByInfoid(Integer infoid) {
		List<Subject> subjectList = new ArrayList<Subject>(); 
		Subject subject = new Subject();
		List<Infotosubject> list = infotosubjectMapper.selectAllByPrimaryKey(infoid);
		Iterator<Infotosubject> iter = list.iterator();
		while(iter.hasNext()) {
			Integer subjectid = iter.next().getSubjectid();
			subject = subjectMapper.selectByPrimaryKey(subjectid);
			subjectList.add(subject);
		}
		return subjectList;
	}
	
	@Override
	public List<Subject> selectAllByPrimaryKey(Integer infoid, Integer semester) {
		List<Subject> subjectList = new ArrayList<Subject>(); 
		Subject subject = new Subject();
		List<Integer> subjectIdList = infotosubjectMapper.selectSubjectIdByPrimaryKey(infoid, semester);
		Iterator<Integer> iter = subjectIdList.iterator();
		while(iter.hasNext()) {
			Integer subjectid = iter.next();
			subject = subjectMapper.selectByPrimaryKey(subjectid);
			subjectList.add(subject);
		}
		return subjectList;
	}

	@Override
	public List<Subject> selectAllSubject() {
		return subjectMapper.selectAllSubject();
	}



}

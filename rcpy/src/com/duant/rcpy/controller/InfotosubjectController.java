package com.duant.rcpy.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.duant.rcpy.domain.Infotosubject;
import com.duant.rcpy.domain.Subject;
import com.duant.rcpy.service.InfotosubjectService;
import com.duant.rcpy.service.SubjectService;

@Controller
public class InfotosubjectController {
	
	@Autowired
	private SubjectService subjectService;
	@Autowired
	private InfotosubjectService infotosubjectService;

	//删除学科操作
	@RequestMapping("rcpy_index_input_infotosubjectDelete.do")
	@ResponseBody
	public Map<String, Object> rcpyIndexInputInfotosubjectDelete(Integer infoid,Subject subject,Infotosubject infotosubject) {
		Map<String, Object> resultMap = new HashMap<String,Object>();
		int i = 0;
		String subjectname = subject.getSubjectname();
		subject = subjectService.selectSubjectByName(subjectname);
		if(subject == null) {
			resultMap.put("result", 440);
			return resultMap;
		}
		Integer subjectid = subject.getSubjectid();
		Infotosubject its = infotosubjectService.selectSubjectIdByIAndS(infoid, subjectid);
		if(its == null) {
			i = 500;
		}else {
			i = infotosubjectService.deleteByPrimaryKey(infoid, subjectid);
		}
		resultMap.put("infotosubject", infotosubject);
		resultMap.put("result", i);
		return resultMap;
	}
	
	//添加和修改学科操作
	@RequestMapping("rcpy_index_input_infotosubjectInsert.do")
	@ResponseBody
	public Map<String, Object> rcpyIndexInputInfotosubjectInsert(Integer infoid,Subject subject,Infotosubject infotosubject) {
		Map<String, Object> resultMap = new HashMap<String,Object>();
		int i = 0;
		String subjectname = subject.getSubjectname();
		subject = subjectService.selectSubjectByName(subjectname);
		if(subject == null) {
			resultMap.put("result", 440);
			return resultMap;
		}
		Integer subjectid = subject.getSubjectid();
		Infotosubject its = infotosubjectService.selectSubjectIdByIAndS(infoid, subjectid);
		Integer infotosubjectid = infoid * 100 + infotosubject.getSemester();
		infotosubject.setSubjectid(subjectid);
		infotosubject.setInfotosubjectid(infotosubjectid);
		if(its == null) {
			i = infotosubjectService.insert(infotosubject) + 1;
		}else {
			i = infotosubjectService.updateByPrimaryKey(infotosubject);
		}
		resultMap.put("infotosubject", infotosubject);
		resultMap.put("result", i);
		return resultMap;
	}
	
}

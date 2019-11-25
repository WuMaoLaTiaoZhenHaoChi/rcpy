package com.duant.rcpy.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.duant.rcpy.domain.Subject;
import com.duant.rcpy.mapper.SubjectMapper;
import com.duant.rcpy.service.SubjectService;

@Controller
public class SubjectController {
	@Autowired
	private SubjectService subjectService;
	@Resource
	private SubjectMapper subjectMapper;
	
	//科目
		@RequestMapping("rcpy_index_input_showsubjectname.do")
		@ResponseBody
		public Map<String, Object> rcpyIndexInputShowsubjectname(Subject subject,
				HttpServletRequest req) {
			Map<String, Object> resultMap = new HashMap<>();
			List<Subject> subjectList = new ArrayList<>();
			//String subjectname = subject.getSubjectname();
			String property1 = subject.getProperty1();
			String property2 = subject.getProperty2();
			subjectList = subjectMapper.selectSubjectByProperty(property1, property2);
			if(subjectList != null) {
				//String property2 = subject.getProperty2();
				req.getSession().setAttribute("subjectAllList", subjectList);
				resultMap.put("msg", "success");
				resultMap.put("subjectList", subjectList);
			}
			else resultMap.put("msg", "error");
			return resultMap;
		}
	
	//获取学科属性2
	@RequestMapping("rcpy_index_input_insertproperty2.do")
	@ResponseBody
	public Map<String, String> rcpyIndexInputInsertproperty2(Subject subject,Map<Object,Object> map) {
		Map<String, String> resultMap = new HashMap<String,String>();
		String subjectname = subject.getSubjectname();
		subject = subjectService.selectSubjectByName(subjectname);
		if(subject != null) {
			String property2 = subject.getProperty2();
			resultMap.put("success", property2);
		}
		else resultMap.put("error", "error");
		return resultMap;
	}
	
	
	
	
	
	
}












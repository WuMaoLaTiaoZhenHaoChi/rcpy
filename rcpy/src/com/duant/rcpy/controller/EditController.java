package com.duant.rcpy.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.duant.rcpy.domain.Info;
import com.duant.rcpy.domain.Subject;
import com.duant.rcpy.domain.User;
import com.duant.rcpy.service.EditService;
import com.duant.rcpy.service.InfoService;
import com.duant.rcpy.service.SubjectService;
import com.duant.rcpy.service.UserService;

@Controller
public class EditController {
	
	@Resource
	private InfoService infoService;
	@Resource
	private SubjectService subjectService;
	@Resource
	private EditService editService;
	@Resource
	private UserService userService;
	
	@RequestMapping("edit.do")
	//@ResponseBody
	public String editProperty(int editType,Info info,Subject subject,User user,Map<String, Object> resultMap,
			HttpServletRequest req,HttpServletResponse resp,ModelAndView model) throws IOException {
		int i = 0;
		User userIs = (User) req.getSession().getAttribute("user");
		if(userIs == null || userIs.getIsadmin() != 1) {
			return "redirect:/index.jsp";
		}else {
			if(editType == 0) {
				if(info != null) 
					i = editService.editInfo(info);	
			}
			if(editType == 1) {
				if(subject != null)
					i = editService.editSubject(subject);
			}
			if(editType == 2) {
				if(user != null)
					i = editService.editUser(user);
			}	
		}		
		return "rcpy_index_edit";
	}

	@RequestMapping("rcpy_index_edit.do")
	public ModelAndView EditView(HttpSession session,ModelAndView model) {
		User user = (User) session.getAttribute("user");
		if(user == null || user.getIsadmin() != 1)
			model.setViewName("redirect:/index.jsp");
		else {
			model.setViewName("rcpy_index_edit");
		}	
		return model;
	}
	
	@RequestMapping("rcpy_index_edit_subject.do")
	@ResponseBody
	public Map<String,Object> rcpyIndexEditSubject(Subject subject,Info info,User user,
			HttpServletRequest req){
		Map<String,Object> maps = new HashMap<>();
		if(isTrue(req) == 0) {
			maps.put("msg","权限不足！");
		}else{
			if(subject != null) {
				Subject subjectR = subjectService.selectByPrimaryKey(subject.getSubjectid());
				maps.put("subject", subjectR);		
			}
			if(info != null) {
				Info infoR =infoService.selectByPrimaryKey(info.getInfoid());
				maps.put("info", infoR);
			}
			if(user != null) {
				User userR = userService.selectByPrimaryKey(user.getUserid());
				maps.put("user", userR);
			}
				
		}
		
		return maps;
	}
	
	static int isTrue(HttpServletRequest req) {
		User userIs = (User) req.getSession().getAttribute("user");
		if(userIs == null || userIs.getIsadmin() != 1) {
			return 0;
		}else {
			return 1;
		}
	}
	
}

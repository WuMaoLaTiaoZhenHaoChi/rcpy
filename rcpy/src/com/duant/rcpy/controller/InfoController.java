package com.duant.rcpy.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.jni.Thread;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.duant.rcpy.domain.Info;
import com.duant.rcpy.domain.Subject;
import com.duant.rcpy.domain.User;
import com.duant.rcpy.mapper.SubjectMapper;
import com.duant.rcpy.service.InfoService;
import com.duant.rcpy.service.InfotosubjectService;
import com.duant.rcpy.service.SubjectService;
import com.duant.rcpy.service.TipService;
import com.duant.rcpy.service.UserService;

@Controller
public class InfoController {

	@Autowired
	private UserService userService;
	@Autowired
	private InfoService infoService;
	@Autowired
	private SubjectService subjectService;
	@Resource
	private TipService tipService;
	@Resource
	private InfotosubjectService itsService;
	@Resource
	private SubjectMapper subjectMapper;
	
	private ModelAndView mav;
	private HttpSession session;
	
	//提交方案
	@RequestMapping("rcpy_index_input_submit.do")
	@ResponseBody
	public Map<String,Object> rcpyIndexInputSubmit(Integer userid,Integer infoid,ModelAndView model){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if (userid == null) {
			resultMap.put("url", "index.jsp");
		}else if(infoid != null){
			int i = infoService.updateInfoByInfoid(infoid, userid);
			resultMap.put("msg", i);
			return resultMap;
		}
		else {
			resultMap.put("msg", 0);
		}
		return resultMap;
	}
	
	//预览
	@RequestMapping("rcpy_index_preview.do")
	public ModelAndView rcpyIndexPreview(ModelAndView model,HttpServletRequest req,Integer infoid){
		session = req.getSession();
		User user = (User) session.getAttribute("user");
		Info info = (Info) session.getAttribute("info");
		if(user == null) {
			model.setViewName("redirect:/index.jsp");
		}else if(info == null && infoid == null){
			model.setViewName("rcpy_index_select");
		}else{
			try {
			if(infoid != null) {
				session.setAttribute("infoid", infoid);
				session.setAttribute("info", infoService.selectByPrimaryKey(infoid));
			}	
			} catch (Exception e) {
				new Exception("查询出错！");
			}
			model.setViewName("rcpy_index_preview");
		}
		return model;
	}
	
	//选择学科到录入界面
	@RequestMapping ("rcpy_select_bntSubmit.do")
	@ResponseBody
	public Map<String, Object> rcpySelectBntSubmit(Integer userid,Info info,HttpServletRequest req){
		Map<String,Object> result = new HashMap<String,Object>();
		User user = userService.selectByPrimaryKey(userid);
		//若没有正确选择 直接返回
		if(info.getGrade() == null || info.getCollege() == "" || info.getSpecialty() == "") {
			result.put("msg", "error");
			return result;
		}
		Info info1 = infoService.selectInfoByGCS(info.getGrade(), info.getCollege(), info.getSpecialty());
		req.getSession().setAttribute("info", info1);
		req.getSession().setAttribute("infoid", info1.getInfoid());
		//查询是否有驳回反馈
		int tipid = info1.getInfoid() % 1000000;
		String tipMsg = tipService.selectMsg(tipid);
		result.put("tipMsg", tipMsg);
		
		if(user.getIsadmin() == 0 && info1.getChange() == 1) {
			result.put("msg", "fail");
			return result;
		}else if(user.getIsadmin() == 0 && info1.getSubmit() == 1) {
			result.put("msg", "successfail");
			return result;
		}else {
			result.put("msg", "success");
			return result;
		}
	}
	
	//select界面点击登录，实现到input界面
		@RequestMapping("rcpy_index_selecttoinput.do")
		@ResponseBody
		public ModelAndView rcpyIndexSelectToInput(ModelAndView model,HttpServletRequest req,HttpServletResponse resp) {
			session = req.getSession();
			User user = (User) session.getAttribute("user");
			Info info = (Info) session.getAttribute("info");
			List<Subject> subjectAllList = subjectService.selectAllSubject();
			//List<Subject> subjectAllList = subjectMapper.selectSubjectByProperty(property1, property2);
			//若非法打开页面则返回主页
			if(user == null || info == null) {
				try {
					model.setViewName("redirect:/index.jsp");
					return model;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else {
				//若成功则将所有学科放入session
/*				if(info != null) {
					session.setAttribute("infoid", info.getInfoid());
				}*/
				session.setAttribute("subjectAllList", subjectAllList);
				//session.setAttribute("info", info1);
				model.addObject("info", info);
				model.setViewName("rcpy_index_input");	
			}
			return model;
		}
		
	//点击预览主体表格
	@RequestMapping("input_table_tbody.do")
	@ResponseBody
	public Map<String,Object> InputTableTbodyAdd(Integer infoid){
		//map = infoService.showTable(infoid);
		Map<String,Object> map = new HashMap<>();
		map = itsService.showTableForWeb(infoid);
		return map;
	}	
		
	//三级联动查询specialty
	@RequestMapping("rcpy_select_specialty.do")
	@ResponseBody
	public List<String> rcpySelectSpecialty(Integer grade,String college){
		List<String> specialtyList = infoService.selectAllSpecialtyByCollege(grade, college);
		return specialtyList;
	}
	
	//三级联动查询college
	@RequestMapping("rcpy_select_college.do")
	@ResponseBody
	public List<String> rcpySelectCollege(Integer grade,HttpServletRequest req){
		List<String> collegeList = infoService.selectAllCollegeByGrade(grade);
		req.getSession().setAttribute("grade", grade);
		//Map<String,Object> resultMap = new HashMap<String,Object>();
		return collegeList;
	}
	
	//select界面点击上方菜单input获得session中的user，info
	@RequestMapping("rcpy_index_input.do")
	public ModelAndView rcpyIndexInput(HttpServletRequest req,HttpServletResponse resp) {
		session = req.getSession(true);
		User user = (User) session.getAttribute("user");
		//Info info = (Info) session.getAttribute("info");
		mav = new ModelAndView();
		if((user == null)) {
			mav.setViewName("redirect:/index.jsp");
			return mav;
		}else {
//			List<Subject> subjectAllList = subjectService.selectAllSubject();
//			session.setAttribute("subjectAllList", subjectAllList);
			mav.setViewName("rcpy_index_input");
		}
		return mav;
	}
	


	
}

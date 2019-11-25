package com.duant.rcpy.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.duant.rcpy.domain.User;
import com.duant.rcpy.service.InfoService;
import com.duant.rcpy.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private InfoService infoService;
	
	//动态显示界面
	@RequestMapping("li_reviewChange.do")
	@ResponseBody
	public Map<String,Object> liReviewChange(Integer userid){
		Map<String,Object> resultMap = new HashMap<String,Object>();
		if(userid != null) {
			User user = userService.selectByPrimaryKey(userid);
			int isadmin= user.getIsadmin();
			resultMap.put("isadmin", isadmin);
			resultMap.put("msg", "success");
		}else {
			resultMap.put("msg", "fail");
		}	
		return resultMap;
	}
	
	//验证登录
	@RequestMapping(value="login_login.do")
	@ResponseBody
	public Map<String,Object> rcpyLogin(ModelAndView model,Integer userid,String password,HttpServletRequest req,HttpServletResponse resp) {
		User user = userService.selectByPrimaryKey(userid);			

		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(user != null ) {
			if(password.equals(user.getPassword())) {
				req.getSession().setAttribute("userid", userid);
				req.getSession().setAttribute("user", user);
				req.getSession().setAttribute("isadmin", user.getIsadmin());
				resultMap.put("msg", "success");
				resultMap.put("username", user.getUsername());
				resultMap.put("isadmin", user.getIsadmin());
			}else {
				resultMap.put("msg", "fail");
			}
		} else {
			 resultMap.put("msg", "404");
		}
		return resultMap;
	}
	
	//登录至选择界面
	@RequestMapping(value="rcpy_index_select.do")
	public ModelAndView rcpyIndexSelect(ModelAndView model,HttpServletRequest req,HttpServletResponse resp) {
		User user = (User) req.getSession(true).getAttribute("user");
		List<Integer> gradeList = infoService.selectAllGrade();	
		req.getSession().setAttribute("gradeList", gradeList);
		if(user == null) {
			try {
				resp.sendRedirect("rcpy_login.jsp");
				return null;
			} catch (IOException e) {
				e.printStackTrace();
			}
			//mav.setViewName("rcpy_login");
		}else {
			model.setViewName("rcpy_index_select");
		}
		return model;
	}
	
}

package com.duant.rcpy.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.duant.rcpy.domain.Info;
import com.duant.rcpy.domain.Page;
import com.duant.rcpy.domain.Tip;
import com.duant.rcpy.domain.User;
import com.duant.rcpy.service.InfoService;
import com.duant.rcpy.service.TipService;

@Controller
public class ReviewContraller {

	@Autowired
	private InfoService infoService;
	
	@Resource
	private TipService tipService;

	@Autowired
	private Page page;
	@Resource
	private Tip tip;
	
	//分页perview
	@RequestMapping(value="review.do")
	@ResponseBody
	public ModelAndView showPage(Integer currentPage,Integer type,
			Integer infoid,String textareaTip,ModelAndView model,HttpServletRequest req) {
		User user = (User) req.getSession().getAttribute("user");
		int i = 0;
		if(user == null || user.getIsadmin() != 1) {
			model.setViewName("redirect:/index.jsp");
		}else {
			try {
				int tipid = infoid % 1000000;
				tip.setTipid(tipid);
				tip.setInfoid(infoid);
				tip.setUserid(user.getUserid());
				//驳回
				if(type == 0) {
					if(user.getIsadmin() == 1) {
						//i =infoService.updateSubmitByInfoid(infoid);
						tip.setMsg(textareaTip);		
						i =infoService.updateSubmitByInfoid(infoid);
						try {
							i = tipService.replaceIntoTip(tip);
						} catch (Exception e) {
							System.out.println("log --->  replaceIntoTip");
						}
					}
				}
				if(type == 1) {
					//通过
					if(user.getIsadmin() == 1) {
						tip.setMsg("success");
						i = infoService.updateChangeByInfoid(infoid);
						try {
							i = tipService.replaceIntoTip(tip);
						} catch (Exception e) {
							System.out.println("已经为success！无需更改！");
						}
					}		
				}
			} catch (Exception e) {
				try {
					throw new RuntimeException("操作失败！");
				} catch (Exception e1) {
				}
			}
			
			if(currentPage == null) {
				currentPage = 1;
			}
			page.setTotalInfos(infoService.selectAllInfo().size());
			page.setCurrentPage(currentPage);	
			List<Info> infoList = infoService.selectInfoByPage( (currentPage - 1) * page.getPageSize(), page.getPageSize());
			
			model.addObject("list",infoList);
			model.addObject("page", page);
			model.setViewName("rcpy_index_review");
		}
		return model;
	}
	
	@RequestMapping(value="rcpy_index_review.do")
	public String rcpIndexReview(User user,Model model) {
			model.addAttribute("rcpy_index_review");
			return "rcpy_index_review";
	}
	
}

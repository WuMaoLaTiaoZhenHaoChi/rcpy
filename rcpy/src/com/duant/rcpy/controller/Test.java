package com.duant.rcpy.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.duant.rcpy.domain.Table;
import com.duant.rcpy.domain.Text;
import com.duant.rcpy.service.InfoService;
import com.duant.rcpy.service.InfotosubjectService;
import com.duant.rcpy.service.SubjectService;
import com.duant.rcpy.service.TextService;
import com.duant.rcpy.service.UserService;

import util.ExcelUntil;
import util.ExcleImpl;
import util.WordUntil;

@Controller
public class Test {
	
	@Autowired
	private UserService userService;
	@Autowired
	private InfoService infoService;
	@Autowired
	private InfotosubjectService infotosubjectService;
	@Autowired
	private SubjectService subjectService;
	@Autowired
	private TextService textService;
	@Resource
	private InfotosubjectService itsService;
	
	private ModelAndView mav;
	
	ExcleImpl excelImpl = new ExcleImpl();
	ExcelUntil excelUntil = new ExcelUntil();
	WordUntil wordUntil = new WordUntil();
	
	//test
	@RequestMapping(value="test.do")
	@ResponseBody
	public String test(HttpServletResponse response, int infoid) {
		List<Table> tableList = itsService.showTable(20151001);
		System.out.println(tableList);
		return null;
	}
	
/*	@RequestMapping(value="test.do")
	@ResponseBody
	public String test(HttpServletResponse response,@RequestParam("infoid") Integer infoid) {
		response.setContentType("application/binary;charset=UTF-8");
		//Map<Integer,Object> map = infoService.showTableBysemster2(20151001,1);
		//Map<String,Object> map = infoService.showTable(20151001);
		Map<String,Object> map = new HashMap<String, Object>();
		Text text = textService.selectTextByPrimaryKey(infoid);
		map.put("text", text);
		try {
			ServletOutputStream out = response.getOutputStream();
			//设置文件头：最后一个参数是设置下载文件名
            response.setHeader("Content-Disposition", "attachment;fileName=" + URLEncoder.encode( infoid +".doc", "UTF-8"));
            //excelImpl.export(titles,map, out);  
            wordUntil.export(map,out);
            out.close(); 
            return "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}
		 
	}*/
	
/*	@RequestMapping(value="test.do")
	@ResponseBody
	public String test(HttpServletResponse response,@RequestParam("infoid") Integer infoid) {
		response.setContentType("application/binary;charset=UTF-8");
		//Map<Integer,Object> map = infoService.showTableBysemster2(20151001,1);
		//Map<String,Object> map = infoService.showTable(20151001);
		Map<Integer,Object> map = infoService.showTableBysemster1(infoid);
		try {
			ServletOutputStream out = response.getOutputStream();

			//设置文件头：最后一个参数是设置下载文件名
            response.setHeader("Content-Disposition", "attachment;fileName=" + URLEncoder.encode( infoid +".xls", "UTF-8"));
            String[] titles = { "课程性质", "课程性质", "课程编码", "课程名称", "开课学期", "学分", "总学时","周学时", "考试方式" }; 
            //excelImpl.export(titles,map, out);  
            excelUntil.export(titles, map, out);
            out.close(); 
            return "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}
		 
	}*/
	
	
/*	@RequestMapping(value="test.do")
	public void test(Text text,HttpServletRequest req,HttpServletResponse res) {
		System.out.println(text);
		Text text1 = textService.selectTextByPrimaryKey(20151001);
		System.out.println(text1.getXuezhitext().toString());
		int i = textService.insert(text);
		System.out.println(i);
		int j = textService.updateByPrimaryKey(text);	
		System.out.println(j);
		
		int d = textService.deleteByPrimaryKey(text.getInfoid());	
		System.out.println(d);
		Text text1 = textService.selectTextByPrimaryKey(2);
		System.out.println("select:" + text1);
	
	}*/
	
/*	@RequestMapping(value="test.do")
	public void test(Infotosubject its,HttpServletRequest req,HttpServletResponse res) {
		System.out.println(its);
//		List<Subject> list = subjectService.selectAllByInfoid(its.getInfoid());
		Infotosubject list = infotosubjectService.selectSubjectIdByIAndS(20151001, 100101);
		System.out.println(list);
//		System.out.println(list.size());
//		Iterator<Infotosubject> iter = list.iterator();
//		while(iter.hasNext()) {
//			System.out.println(iter.next());
//		}

		
	}*/

 /*	//test  infotosubject
  * @RequestMapping(value="test.do")
	public void test(Infotosubject its,HttpServletRequest req,HttpServletResponse res) {
		System.out.println(its);
		
		int insert = infotosubjectService.insert(its);
		System.out.println("insert" + insert);
		
		int update =  infotosubjectService.updateByPrimaryKey(its);
		System.out.println("update" + update);

		int delete =  infotosubjectService.deleteByPrimaryKey(1);
		System.out.println("delete:" + delete);
		
//		List<Infotosubject> list = infotosubjectService.selectAllByPrimaryKey(20151001);
//		Iterator<Infotosubject> iter = list.iterator();
		
		List<Integer> list = infotosubjectService.selectSubjectIdByPrimaryKey(20151001, 2);
		Iterator<Integer> iter = list.iterator();
		
		while(iter.hasNext()) {
			System.out.println(iter.next());
		}

	}*/
	
}

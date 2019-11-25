package com.duant.rcpy.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.duant.rcpy.domain.Text;
import com.duant.rcpy.service.InfoService;
import com.duant.rcpy.service.InfotosubjectService;
import com.duant.rcpy.service.TextService;

import util.ExcelUntil;
import util.WordUntil;

@Controller
public class OutputController {
	
	@Autowired
	private InfoService infoService;
	@Autowired
	private TextService textService;
	@Autowired
	private InfotosubjectService itsService;
	
	ExcelUntil excelUntil = new ExcelUntil();
	WordUntil wordUntil = new WordUntil();
	
	//输出为Word
	@RequestMapping(value="rcpy_index_preview_outputWord.do")
	@ResponseBody
	public String test(Integer infoid,HttpServletResponse response) {
		response.setContentType("application/binary;charset=UTF-8");
		Map<String,Object> map = new HashMap<String, Object>();
		Text text = textService.selectTextByPrimaryKey(infoid);
		map.put("text", text);
		try {
			ServletOutputStream out = response.getOutputStream();
			//设置文件头：最后一个参数是设置下载文件名
            response.setHeader("Content-Disposition", "attachment;fileName=" + URLEncoder.encode( infoid +".doc", "UTF-8"));
            wordUntil.export(map,out);
            out.close(); 
            return "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}
		 
	}
	
	//输出为excel
	@RequestMapping(value="rcpy_index_preview_outputExcel.do")
	@ResponseBody
	public String rcpyIndexPreviewOutputExcel(Integer infoid,Integer semester,HttpServletResponse response) {
		response.setContentType("application/binary;charset=UTF-8");
		Map<Integer,Object> map = new HashMap<Integer,Object>();
		if(semester == 0 || semester == null) {
			map = itsService.showTableForExcel(infoid, semester);
		}else {
			map = itsService.showTableForExcel(infoid, semester);
		}
		try {
			ServletOutputStream out = response.getOutputStream();
			//设置文件头：最后一个参数是设置下载文件名
            response.setHeader("Content-Disposition", "attachment;fileName=" + URLEncoder.encode( infoid +".xls", "UTF-8"));
            String[] titles = { "课程性质", "课程性质", "课程编码", "课程名称", "开课学期", "学分", "总学时","周学时", "考试方式" };  
            excelUntil.export(titles, map, out); 
            return "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
            return "fail";
		}
		 
	}
	
	
/*	//输出为excel
	@RequestMapping(value="rcpy_index_preview_outputExcel.do")
	@ResponseBody
	public String rcpyIndexPreviewOutputExcel(Integer infoid,Integer semester,HttpServletResponse response) {
		response.setContentType("application/binary;charset=UTF-8");
		Map<Integer,Object> map = new HashMap<Integer,Object>();
		if(semester == 0 || semester == null) {
			map = infoService.showTableBysemster1(infoid);
		}else {
			map = infoService.showTableBysemster2(infoid,semester);
		}
		try {
			ServletOutputStream out = response.getOutputStream();
			//设置文件头：最后一个参数是设置下载文件名
            response.setHeader("Content-Disposition", "attachment;fileName=" + URLEncoder.encode( infoid +".xls", "UTF-8"));
            String[] titles = { "课程性质", "课程性质", "课程编码", "课程名称", "开课学期", "学分", "总学时","周学时", "考试方式" };  
            excelUntil.export(titles, map, out); 
            return "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
            return "fail";
		}
		 
	}*/


	
}

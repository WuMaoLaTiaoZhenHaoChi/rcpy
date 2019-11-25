package com.duant.rcpy.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.duant.rcpy.domain.Info;
import com.duant.rcpy.domain.Text;
import com.duant.rcpy.service.InfoService;
import com.duant.rcpy.service.TextService;


@Controller
public class TextController {


	@Autowired
	private TextService textService;
	@Autowired
	private InfoService infoService;
	
	//添加或者修改操作
	@RequestMapping("rcpy_index_input_insertText.do")
	@ResponseBody
	public Integer rcpyIndexInputInsertText(Integer infoid,String value,String textareaText) {
		Info info = infoService.selectByPrimaryKey(infoid);
		int i = 0;
		String title = info.getGrade() + "级" + info.getCollege() + "学院" + info.getSpecialty() +"专业人才培养方案 " ;
		Integer textid = infoid * 100 + 1;
		Text text1 = textService.selectTextByPrimaryKey(infoid);
		if(text1 == null) {
			i = 5;
			text1 = new Text(textid, title, "培养目标", "基本规格要求", "培养特色", "学制及学位", "主干学科", infoid);
		}
		if("target".equals(value)) {
			text1.setTargettext(textareaText);
		}else if("require".equals(value)) {
			text1.setRequiretext(textareaText);
		}else if("feature".equals(value)) {
			text1.setFeaturetext(textareaText);
		}else if("xuezhi".equals(value)) {
			text1.setXuezhitext(textareaText);
		}else if("subject".equals(value)) {
			text1.setSubjecttext(textareaText);
		}
		
		if(i == 5) {
			i = textService.insert(text1) + 1;
		}else {
			i = textService.updateByPrimaryKey(text1);
		}
		return i;
	}
	
	//自动获取数据
	@RequestMapping( value = "rcpy_index_input_text.do")
	@ResponseBody
	public Map<String, String> rcpyIndexInputText(Integer infoid,String value){
		Text text = textService.selectTextByPrimaryKey(infoid);
		Map<String, String> resultMap = new HashMap<String, String>();
		if(text == null)
			return resultMap;
		String textShow = "";
		if("target".equals(value)) {
			textShow = text.getTargettext();
		}else if("require".equals(value)) {
			textShow = text.getRequiretext();
		}else if("feature".equals(value)) {
			textShow = text.getFeaturetext();
		}else if("xuezhi".equals(value)) {
			textShow = text.getXuezhitext();
		}else if("subject".equals(value)) {
			textShow = text.getSubjecttext();
		}
		resultMap.put("textShow", textShow);
		return resultMap;
	}
	
}

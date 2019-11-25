package com.duant.rcpy.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.duant.rcpy.service.TipService;
import com.sun.javafx.collections.MappingChange.Map;

@Controller
public class TipController {

	@Resource
	private TipService tipService;
	
}

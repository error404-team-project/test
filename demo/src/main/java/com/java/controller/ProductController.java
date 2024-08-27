package com.java.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	
	@RequestMapping("/medical_list")
	public String medical_list() {
		return "/product/medical_list";
	}
	
	@RequestMapping("/list")
	public String list() {
		return "/product/list";
	}
	
}

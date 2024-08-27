package com.java.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomerController {
	
	@RequestMapping("/customer/inquiry_list")
	public String inquiry_list() {
		
		return "customer/inquiry_list";
	}
	
	@RequestMapping("/customer/inquiry_write")
	public String inquiry_write() {
		
		return "customer/inquiry_write";
	}
	
	@RequestMapping("/customer/notice_list")
	public String notice_list() {
		
		return "customer/notice_list";
	}
}

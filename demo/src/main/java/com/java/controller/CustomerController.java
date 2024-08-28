package com.java.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	@RequestMapping("/inquiry_list")
	public String inquiry_list() {
		
		return "customer/inquiry_list";
	}
	
	@RequestMapping("/inquiry_write")
	public String inquiry_write() {
		
		return "customer/inquiry_write";
	}
	
	@RequestMapping("/notice_list")
	public String notice_list() {
		
		return "customer/notice_list";
	}
	
	@RequestMapping("/faq")
	public String faq() {
		
		return "customer/faq";
	}
}

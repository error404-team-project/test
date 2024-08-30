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
	
	@RequestMapping("/household_list")
	public String household_list() {
		return "/product/household_list";
	}
	
	@RequestMapping("/em_delivery")
	public String em_delivery() {
		return "/product/em_delivery";
	}
	
	@RequestMapping("/medical_view")
	public String medical_view() {
		return "/product/medical_view";
	}
	
}

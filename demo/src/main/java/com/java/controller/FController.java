package com.java.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FController {

	
	@RequestMapping ("/index")
	public String index () {
		return "index";
	}
	
	@RequestMapping ("/ex_index")
	public String ex_index () {
		return "ex_index";
	}
	
	@RequestMapping ("/chartjs")
	public String chartjs () {
		return "chartjs";
	}
	
	
	@RequestMapping ("/brand")
	public String brand() {
		return "brand";
	}


}

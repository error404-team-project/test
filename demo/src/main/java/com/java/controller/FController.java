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
	
	@RequestMapping ("/admin_index")
	public String admin_index () {
		return "admin_index";
	}
	
	@RequestMapping ("/chartjs")
	public String chartjs () {
		return "chartjs";
	}

	@RequestMapping("/ex_f_board")
	public String ex_f_board() {
		return "ex_f_board";
	}

}

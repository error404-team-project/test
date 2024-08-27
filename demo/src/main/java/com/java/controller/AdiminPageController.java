package com.java.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/adminPage")
public class AdiminPageController {
	
	
	
	@RequestMapping ("/admin_index")
	public String admin_index () {
		return "/adminPage/admin_index";
	}
	
	@RequestMapping("/ex_f_board")
	public String ex_f_board() {
		return "/adminPage/ex_f_board";
	}
	
	@RequestMapping("/ex_member")
	public String ex_member() {
		return "/adminPage/ex_member";
	}
	
	@RequestMapping("/ex_event")
	public String ex_event(Model model) {
	//	HashMap<String,Object> map = adnservice.selectAll();
	//	model.addAttribute("list", map.get("list"));
		return "/adminPage/ex_event";
	}
	
	@RequestMapping("/ex_notice")
	public String ex_notice(Model model) {
	//	HashMap<String,Object> map = adnservice.selectAll();
	//	model.addAttribute("list", map.get("list"));
		return "/adminPage/ex_notice";
	}
	
	
}

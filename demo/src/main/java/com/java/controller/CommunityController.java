package com.java.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/community")
public class CommunityController {
	
	@RequestMapping("/ex_review_b_list")
	public String ex_review_b_list() {
		
		return "/community/ex_review_b_list";
	}

}

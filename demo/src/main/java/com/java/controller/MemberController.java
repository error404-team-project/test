package com.java.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@RequestMapping("/login")
	public String login() {
		return "/member/login";
	}
	
	@RequestMapping("/idsearch")
	public String idsearch() {
		return "/member/idsearch";
	}
	
	@RequestMapping("/join01")
	public String join01() {
		return "/member/join01";
	}
	
	@RequestMapping("/join02")
	public String join02() {
		return "/member/join02";
	}
	
	@RequestMapping("/join03")
	public String join03() {
		return "/member/join03";
	}
	
	
}

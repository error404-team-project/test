package com.java.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.dto.User;
import com.java.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired UserService uservice;
	@Autowired HttpSession session;
	
	@GetMapping("/login")
	public String login() {
		return "/member/login";
	}
	
	@PostMapping("/login")
	public String dologin(Model model,User user) {
	//	System.out.println(user.getUser_id());
	//	System.out.println(user.getUser_pw());
		User u = uservice.selectLogin(user);
		System.out.println(u);
		if(u == null) {
			model.addAttribute("result", 2);
			return "/member/login";
		} else {
			session.setAttribute("sessionId", u.getUser_id());
			session.setAttribute("sessionSeq", u.getUser_seq());
			session.setAttribute("sessionName", u.getUser_name());
			session.setAttribute("sessionAuth", u.getAuth_id());
			System.out.println(u.getUser_name());
			System.out.println(u.getUser_seq());
		return "redirect:../index";
		}
	}
	
	@RequestMapping("/logout")
	public String logout() {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/idsearch")
	public String idsearch() {
		return "/member/idsearch";
	}
	
	@PostMapping("/idcheck")
	@ResponseBody
	public String idcheck(String id) {
	//	System.out.println(id);
		String uid = uservice.selectId(id);
		if(uid == null) {
			return "1";
		} else {
			return "2";
		}
	}
	
	@RequestMapping("/join01")
	public String join01() {
		return "/member/join01";
	}
	
	@RequestMapping("/join02")
	public String join02(Model model,User user) {
		System.out.println(user.getSvc_agree());
		System.out.println(user.getPs_agree());
		model.addAttribute("svc_agree", user.getSvc_agree());
		model.addAttribute("ps_agree", user.getPs_agree());
		return "/member/join02";
	}
	
	@RequestMapping("/join03")
	public String join03(User user) {
	//	System.out.println(user.getUser_id());
		System.out.println(user.getUser_gender());
		uservice.joinOne(user);
		return "/member/join03";
	}
	
	
}

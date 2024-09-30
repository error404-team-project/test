package com.java.controller;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
			model.addAttribute("result", "2");
			return "/member/login";
		}else if (u.getApproval().equals("N")){
			model.addAttribute("result", "3");
			return "/member/login";
		} else {
			session.setAttribute("sessionId", u.getUser_id());
			session.setAttribute("sessionSeq", u.getUser_seq());
			session.setAttribute("sessionName", u.getUser_name());
			session.setAttribute("sessionAuth", u.getAuth_id());
		//	System.out.println(u.getUser_name());
		//	System.out.println(u.getUser_seq());
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
	
	@RequestMapping("/join")
	public String join() {
		return "/member/join";
	}
	
	@RequestMapping("/sjoin01")
	public String join01(Model model,String auth_id) {
		System.out.println(auth_id);
		model.addAttribute("auth_id", auth_id);
		return "/member/sjoin01";
	}
	
	@RequestMapping("/sjoin02")
	public String join02(Model model,User user) {
		System.out.println(user.getSvc_agree());
		System.out.println(user.getPs_agree());
		System.out.println(user.getAuth_id());
		model.addAttribute("svc_agree", user.getSvc_agree());
		model.addAttribute("ps_agree", user.getPs_agree());
		model.addAttribute("auth_id", user.getAuth_id());
		return "/member/sjoin02";
	}
	
	@RequestMapping("/sjoin03")
	public String join03(User user,@RequestPart MultipartFile bFile,
			@RequestPart MultipartFile pFile) {
	//	System.out.println(user.getUser_id());
	//	System.out.println(user.getUser_gender());
		String fileName="";
		// 파일이 있을경우 저장
		if(!bFile.isEmpty()) {
			String ori_fileName = bFile.getOriginalFilename();// 실제 파일이름
			UUID uuid = UUID.randomUUID(); // 랜덤숫자 생성
			fileName = uuid+"_"+ori_fileName; // 파일이름 변경(중복방지)
			System.out.println(fileName);
			String uploadUrl = "c:/upload/"; // 파일 업로드 위치
			File f = new File(uploadUrl+fileName);
			try {
				bFile.transferTo(f); // 파일 저장
				user.setB_l_image(fileName); // write일땐 if 밖에 modi일땐 if 안에
			} catch(Exception e) {e.printStackTrace();}
		}
		String fileName2="";
		// 파일이 있을경우 저장
		if(!pFile.isEmpty()) {
			String ori_fileName2 = pFile.getOriginalFilename();// 실제 파일이름
			UUID uuid = UUID.randomUUID(); // 랜덤숫자 생성
			fileName2 = uuid+"_"+ori_fileName2; // 파일이름 변경(중복방지)
			System.out.println(fileName2);
			String uploadUrl = "c:/upload/"; // 파일 업로드 위치
			File f = new File(uploadUrl+fileName2);
			try {
				pFile.transferTo(f); // 파일 저장
				user.setP_license(fileName2); // write일땐 if 밖에 modi일땐 if 안에
			} catch(Exception e) {e.printStackTrace();}
		}
		System.out.println("약사면허증"+user.getP_license());
		System.out.println("사업자등록증"+user.getB_license());
		uservice.joinOne(user);
		return "/member/join03";
	}
	
	
	@RequestMapping("/ujoin01")
	public String ujoin01(Model model,String auth_id) {
		System.out.println(auth_id);
		model.addAttribute("auth_id", auth_id);
		return "/member/ujoin01";
	}
	
	@RequestMapping("/ujoin02")
	public String ujoin02(Model model,User user) {
		System.out.println(user.getSvc_agree());
		System.out.println(user.getPs_agree());
		System.out.println(user.getAuth_id());
		model.addAttribute("svc_agree", user.getSvc_agree());
		model.addAttribute("ps_agree", user.getPs_agree());
		model.addAttribute("auth_id", user.getAuth_id());
		return "/member/ujoin02";
	}
	
	@RequestMapping("/ujoin03")
	public String ujoin03(User user) {
		
		uservice.joinOne(user);
		return "/member/join03";
	}
	
	@PostMapping("/findId")
	@ResponseBody
	public String findId(String user_name, String user_email) {
		System.out.println("이름 : "+user_name);
		System.out.println("이메일 : "+user_email);
		String fid = uservice.findId(user_name,user_email);
		if(fid == null || fid=="") {
			return "1";
		} else {
			return fid;
		}
	}
	
	@PostMapping("/findPw")
	@ResponseBody
	public String findPw(String user_id, String user_email) {
	//	System.out.println("이름 : "+user_id);
	//	System.out.println("이메일 : "+user_email);
		String result = uservice.findPw(user_id,user_email);
		if(result == null || result== "") {
			return "1";
		} else {
			return "입력하신 이메일로 메일이 발송되었습니다.";
		}
	}
	
}


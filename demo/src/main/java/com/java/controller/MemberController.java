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
	
	@GetMapping("/login") // 로그인페이지
	public String login() {
		return "/member/login";
	}
	
	@PostMapping("/login") // 로그인하기
	public String dologin(Model model,User user) {
	//	System.out.println(user.getUser_id());
	//	System.out.println(user.getUser_pw());
		User u = uservice.selectLogin(user); // 입력한 아이디, 비밀번호로 회원정보 가져오기
		System.out.println(u);
		if(u == null) { // 로그인 실패 시(아이디 혹은 비밀번호가 틀렸다면)
			model.addAttribute("result", "2"); //alert창 띄우기 위한 변수 보내기
			return "/member/login";
		}else if (u.getApproval().equals("N")){ // 약국 로그인 시 회원가입 승인이 나지 않았다면
			model.addAttribute("result", "3"); //alert창 띄우기 위한 변수 보내기
			return "/member/login";
		} else { // 로그인 성공 시
			session.setAttribute("sessionId", u.getUser_id()); // 세션에 회원 아이디 저장
			session.setAttribute("sessionSeq", u.getUser_seq()); // 세션에 회원 고유번호 저장
			session.setAttribute("sessionName", u.getUser_name()); // 세션에 회원 이름 저장
			session.setAttribute("sessionAuth", u.getAuth_id()); // 세션에 권한 아이디 저장
		//	System.out.println(u.getUser_name());
		//	System.out.println(u.getUser_seq());
		return "redirect:../index";
		}
	}
	
	@RequestMapping("/logout") // 로그아웃
	public String logout() {
		session.invalidate(); // 세션 정보 삭제
		return "redirect:/";
	}
	
	@RequestMapping("/idsearch") // 아이디 / 비밀번호 찾기 페이지
	public String idsearch() {
		return "/member/idsearch";
	}
	
	@PostMapping("/idcheck") // 아이디 중복확인 ajax
	@ResponseBody
	public String idcheck(String id) { 
	//	System.out.println(id);
		String uid = uservice.selectId(id); // 입력한 아이디로 회원정보 가져옴
		if(uid == null) {
			return "1"; // 아이디가 없으면(사용가능하면) alert창 띄우기 위한 변수 보냄
		} else {
			return "2"; // 아이디가 있으면(사용 불가능이면) alert창 띄우기 위한 변수 보냄
		}
	}
	
	@RequestMapping("/join") // 회원가입
	public String join() {
		return "/member/join";
	}
	
	@RequestMapping("/sjoin01") // 약국회원가입 클릭 시 필수이용동의 페이지로 이동
	public String join01(Model model,String auth_id) {
		System.out.println(auth_id);
		model.addAttribute("auth_id", auth_id); // 약국 회원의 권한아이디 보내기
		return "/member/sjoin01";
	}
	
	@RequestMapping("/sjoin02") // 동의 후 가입하기 클릭 시 상세정보 입력 페이지로 이동
	public String join02(Model model,User user) {
		System.out.println(user.getSvc_agree());
		System.out.println(user.getPs_agree());
		System.out.println(user.getAuth_id());
		model.addAttribute("svc_agree", user.getSvc_agree()); // 서비스 이용약관 동의 보내기
		model.addAttribute("ps_agree", user.getPs_agree()); // 개인정보 처리방침 동의 보내기
		model.addAttribute("auth_id", user.getAuth_id()); // 권한 아이디 보내기
		return "/member/sjoin02";
	}
	
	@RequestMapping("/sjoin03") // 상세정보 입력 후 가입하기 버튼 클릭 시 가입완료 페이지로 이동
	public String join03(User user,@RequestPart MultipartFile bFile,
			@RequestPart MultipartFile pFile) {
	//	System.out.println(user.getUser_id());
	//	System.out.println(user.getUser_gender());
		// 사업자등록증 저장
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
		// 약사면허증 저장
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
		uservice.joinOne(user); // 입력한 값 DB로 전송
		return "/member/join03";
	}
	
	
	@RequestMapping("/ujoin01") // 일반회원가입 클릭 시 이용동의 페이지로 이동
	public String ujoin01(Model model,String auth_id) {
		System.out.println(auth_id);
		model.addAttribute("auth_id", auth_id); // 일반회원 권한아이디 보내기
		return "/member/ujoin01";
	}
	
	@RequestMapping("/ujoin02") // 이용동의 후 상세정보 입력페이지로 이동
	public String ujoin02(Model model,User user) {
		System.out.println(user.getSvc_agree());
		System.out.println(user.getPs_agree());
		System.out.println(user.getAuth_id());
		model.addAttribute("svc_agree", user.getSvc_agree()); // 서비스이용약관 동의 보내기
		model.addAttribute("ps_agree", user.getPs_agree()); // 개인정보 처리방침 동의 보내기
		model.addAttribute("auth_id", user.getAuth_id()); // 권한 아이디 보내기
		return "/member/ujoin02";
	}
	
	@RequestMapping("/ujoin03") // 상세정보 입력 후 가입완료 페이지로 이동
	public String ujoin03(User user) {
		
		uservice.joinOne(user); // 입력한 값들 DB에 전송
		return "/member/join03";
	}
	
	@PostMapping("/findId") // 아이디찾기 ajax
	@ResponseBody
	public String findId(String user_name, String user_email) {
		System.out.println("이름 : "+user_name);
		System.out.println("이메일 : "+user_email);
		// 입력한 이름과 이메일로 아이디 찾기
		String fid = uservice.findId(user_name,user_email); 
		if(fid == null || fid=="") { // 회원정보가 없으면
			return "1"; //alert창 띄우기 위한 변수 보냄
		} else {
			return fid; // 찾은 아이디 보냄
		}
	}
	
	@PostMapping("/findPw") // 비밀번호 찾기 ajax
	@ResponseBody
	public String findPw(String user_id, String user_email) {
	//	System.out.println("이름 : "+user_id);
	//	System.out.println("이메일 : "+user_email);
		String result = uservice.findPw(user_id,user_email); // 입력한 아이디와 이메일이 DB와 일치하면 메일발송하기
		if(result == null || result== "") { // 값이 없을때(일치하지 않을때)
			return "1"; // alert창 띄우기 위한 변수 보냄
		} else {
			return "입력하신 이메일로 메일이 발송되었습니다."; // 해당 String alert창에 띄우기
		}
	}
	
}


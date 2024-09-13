package com.java.controller;

import java.io.File;
import java.util.HashMap;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.java.dto.Notice;
import com.java.dto.Page;
import com.java.service.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	@Autowired CustomerService cservice;
	
	@RequestMapping("/inquiry_list")
	public String inquiry_list() {
		
		return "customer/inquiry_list";
	}
	
	@RequestMapping("/inquiry_write")
	public String inquiry_write() {
		
		return "customer/inquiry_write";
	}
	
	@RequestMapping("/notice_list")
	public String notice_list(Model model,Page pageDto) {
		HashMap<String, Object> map = cservice.selectAllN(pageDto);
		model.addAttribute("nlist", map.get("nlist"));
		model.addAttribute("pageDto", map.get("pageDto"));
		return "customer/notice_list";
	}
	
	@GetMapping("/notice_write")
	public String notice_write() {
		return "customer/notice_write";
	}
	
	@PostMapping("/notice_write")
	public String donotice_write(Notice notice, @RequestPart MultipartFile file) {
	//	System.out.println("제목"+notice.getNotice_title());
	//	System.out.println("내용"+notice.getNotice_title());
		System.out.println("작성자seq "+notice.getUser_seq());
		String fileName="";
		// 파일이 있을경우 저장
		if(!file.isEmpty()) {
			String ori_fileName = file.getOriginalFilename();// 실제 파일이름
			UUID uuid = UUID.randomUUID(); // 랜덤숫자 생성
			fileName = uuid+"_"+ori_fileName; // 파일이름 변경(중복방지)
			String uploadUrl = "c:/upload/"; // 파일 업로드 위치
			File f = new File(uploadUrl+fileName);
			try {
				file.transferTo(f); // 파일 저장
			} catch(Exception e) {e.printStackTrace();}
		}
		notice.setNotice_image(fileName); // write일땐 if 밖에 modi일땐 if 안에
	//	System.out.println("이미지"+notice.getNotice_image());
		cservice.insertNotice(notice);
		return "redirect:/adminPage/ex_notice";
	}
	
	@GetMapping("/notice_modi")
	public String notice_modi(Model model, int notice_no) {
	//	System.out.println(notice_no);
		HashMap<String,Object> map = cservice.selectOneN(notice_no);
		model.addAttribute("n", map.get("n"));
		return "customer/notice_modi";
	}
	
	@PostMapping("/notice_modi")
	public String donotice_modi(Notice notice, @RequestPart MultipartFile file) {
		//	System.out.println("제목"+notice.getNotice_title());
		//	System.out.println("내용"+notice.getNotice_title());
		System.out.println("작성자seq "+notice.getUser_seq());
		String fileName="";
		// 파일이 있을경우 저장
		if(!file.isEmpty()) {
			String ori_fileName = file.getOriginalFilename();// 실제 파일이름
			UUID uuid = UUID.randomUUID(); // 랜덤숫자 생성
			fileName = uuid+"_"+ori_fileName; // 파일이름 변경(중복방지)
			String uploadUrl = "c:/upload/"; // 파일 업로드 위치
			File f = new File(uploadUrl+fileName);
			try {
				file.transferTo(f); // 파일 저장
			} catch(Exception e) {e.printStackTrace();}
			notice.setNotice_image(fileName); // write일땐 if 밖에 modi일땐 if 안에
		}
			System.out.println("이미지"+notice.getNotice_image());
		cservice.updateNotice(notice);
		return "redirect:/adminPage/ex_notice";
	}
	
	@RequestMapping("/notice_view")
	public String notice_view(int notice_no, Model model) {
	//	System.out.println(notice_no);
		HashMap<String,Object> map = cservice.selectOneN(notice_no);
		model.addAttribute("n", map.get("n"));
		model.addAttribute("next", map.get("next"));
		model.addAttribute("prev", map.get("prev"));
		return "customer/notice_view";
	}
	
	@RequestMapping("/faq")
	public String faq() {
		
		return "customer/faq";
	}
}

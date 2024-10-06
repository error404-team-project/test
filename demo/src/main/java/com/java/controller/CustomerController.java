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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.java.dto.Notice;
import com.java.dto.Page;
import com.java.dto.Prescription;
import com.java.service.CustomerService;
import com.java.service.myService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	@Autowired CustomerService cservice;
	@Autowired myService myservice;
	@Autowired HttpSession session;
	
	@RequestMapping("/inquiry_list")
	public String inquiry_list(Page pageDto,Model model) {
		int user_seq = (int) session.getAttribute("sessionSeq");
		HashMap<String, Object> InquiryMap = myservice.selectInquiry(pageDto,user_seq);
		model.addAttribute("list", InquiryMap.get("list"));
		model.addAttribute("pageDto", InquiryMap.get("pageDto"));
		return "customer/inquiry_list";
	}
	
	@RequestMapping("/inquiry_write")
	public String inquiry_write() {
		
		return "customer/inquiry_write";
	}
	
	@RequestMapping("/prescription_list")
	public String prescription_list(Model model,Page pageDto,@RequestParam(defaultValue = "0")int user_seq) {
	//	System.out.println("처방전 목록"+user_seq);
		if(session.getAttribute("sessionSeq") != null) {
			user_seq = (int)session.getAttribute("sessionSeq");
			HashMap<String, Object> map = cservice.selectMyPrescription(pageDto,user_seq);
			model.addAttribute("list", map.get("list"));
			model.addAttribute("pageDto", map.get("pageDto"));
			model.addAttribute("user_seq", user_seq);
		} else {
			model.addAttribute("user_seq", user_seq);
		}
		return "/customer/prescription_list";
	}
	
	@GetMapping("/prescription_write")
	public String prescription_write() {
		
		return "/customer/prescription_write";
	}
	
	@PostMapping("/prescription_write")
	public String doprescription_write(Prescription pre,@RequestPart MultipartFile file) {
	//	System.out.println(pre.getPrescription_content());
		String fileName="";
		// 파일이 있을경우 저장
		if(!file.isEmpty()) {
			String ori_fileName = file.getOriginalFilename();// 실제 파일이름
			UUID uuid = UUID.randomUUID(); // 랜덤숫자 생성
			fileName = uuid+"_"+ori_fileName; // 파일이름 변경(중복방지)
		//	System.out.println(fileName);
			String uploadUrl = "c:/upload/"; // 파일 업로드 위치
			File f = new File(uploadUrl+fileName);
			try {
				file.transferTo(f); // 파일 저장
			} catch(Exception e) {e.printStackTrace();}
		}	
		pre.setPrescription_image(fileName); // write일땐 트라이 밖에 modi일땐 안에
		cservice.insertPrescription(pre);
		System.out.println(pre.getUser_seq());
		return "redirect:/customer/prescription_list?user_seq="+pre.getUser_seq();
	}
	
	@RequestMapping("/prescription_view")
	public String prescription_view(Model model,int prescription_no) {
	//	System.out.println(prescription_no);
		Prescription pre = cservice.selectOnePre(prescription_no);
		model.addAttribute("pre", pre);
		return "/customer/prescription_view";
	}
	
	@GetMapping("/prescription_modi")
	public String prescription_modi(Model model, int prescription_no) {
	//	System.out.println(prescription_no);
		Prescription pre = cservice.selectOnePre(prescription_no);
		model.addAttribute("pre", pre);
		return "/customer/prescription_modi";
	}
	
	@PostMapping("/prescription_modi")
	public String doprescription_modi(Prescription pre,@RequestPart MultipartFile file) {
		String fileName="";
		// 파일이 있을경우 저장
		if(!file.isEmpty()) {
			String ori_fileName = file.getOriginalFilename();// 실제 파일이름
			UUID uuid = UUID.randomUUID(); // 랜덤숫자 생성
			fileName = uuid+"_"+ori_fileName; // 파일이름 변경(중복방지)
		//	System.out.println(fileName);
			String uploadUrl = "c:/upload/"; // 파일 업로드 위치
			File f = new File(uploadUrl+fileName);
			try {
				file.transferTo(f); // 파일 저장
			} catch(Exception e) {e.printStackTrace();}
			pre.setPrescription_image(fileName); // write일땐 트라이 밖에 modi일땐 안에
		}	
		cservice.updatePre(pre);
		return "redirect:/customer/prescription_list?user_seq="+pre.getUser_seq();
	}
	
	@RequestMapping("/notice_list")
	public String notice_list(Model model,Page pageDto) {
		HashMap<String, Object> map = cservice.selectAllN(pageDto);
		model.addAttribute("nlist", map.get("nlist"));
		model.addAttribute("pageDto", map.get("pageDto"));
		return "/customer/notice_list";
	}
	
	@GetMapping("/notice_write")
	public String notice_write() {
		return "/customer/notice_write";
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
		return "/customer/notice_modi";
	}
	
	@PostMapping("/notice_modi")
	public String donotice_modi(Notice notice, @RequestPart MultipartFile file) {
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
		return "/customer/notice_view";
	}
	
	@RequestMapping("/faq")
	public String faq() {
		
		return "/customer/faq";
	}
}

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
	
	@RequestMapping("/inquiry_list") // 1:1문의 리스트 가져오기
	public String inquiry_list(Page pageDto,Model model) {
		int user_seq = (int) session.getAttribute("sessionSeq"); // 로그인 한 회원의 고유번호
		HashMap<String, Object> InquiryMap = myservice.selectInquiry(pageDto,user_seq); // 로그인 한 회원의 1:1문의 리스트 가져와서 맵에 넣기
		model.addAttribute("list", InquiryMap.get("list")); // 1:1문의 리스트 보내기
		model.addAttribute("pageDto", InquiryMap.get("pageDto")); // 페이지넘버링 보내기
		return "customer/inquiry_list";
	}
	
	@RequestMapping("/inquiry_write")
	public String inquiry_write() {
		
		return "customer/inquiry_write";
	}
	
	@RequestMapping("/prescription_list") // 처방전 리스트 가져오기
	public String prescription_list(Model model,Page pageDto,@RequestParam(defaultValue = "0")int user_seq) {
	//	System.out.println("처방전 목록"+user_seq);
		if(session.getAttribute("sessionSeq") != null) { // 로그인 되어있다면
			user_seq = (int)session.getAttribute("sessionSeq"); // 회원 고유번호 변수저장
			HashMap<String, Object> map = cservice.selectMyPrescription(pageDto,user_seq); // 로그인 한 회원의 처방전 리스트 가져오기
			model.addAttribute("list", map.get("list")); // 가져온 처방전 리스트 보내기
			model.addAttribute("pageDto", map.get("pageDto")); // 처방전 리스트의 페이지넘버링
			model.addAttribute("user_seq", user_seq); // 해당 회원의 고유번호
		} else {
			model.addAttribute("user_seq", user_seq); // 디폴트값인 0 보내기
		}
		return "/customer/prescription_list";
	}
	
	@GetMapping("/prescription_write")
	public String prescription_write() { // 처방전 작성페이지
		
		return "/customer/prescription_write";
	}
	
	@PostMapping("/prescription_write")// 처방전 작성
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
		cservice.insertPrescription(pre); // 처방전 작성
		System.out.println(pre.getUser_seq());
		return "redirect:/customer/prescription_list?user_seq="+pre.getUser_seq();
	}
	
	@RequestMapping("/prescription_view") // 처방전 게시글보기
	public String prescription_view(Model model,int prescription_no) { 
	//	System.out.println(prescription_no);
		Prescription pre = cservice.selectOnePre(prescription_no); // 한 처방전 정보 가져오기
		model.addAttribute("pre", pre); // 처방전 정보 보냄
		return "/customer/prescription_view";
	}
	
	@GetMapping("/prescription_modi") // 처방전 수정페이지
	public String prescription_modi(Model model, int prescription_no) { 
	//	System.out.println(prescription_no);
		Prescription pre = cservice.selectOnePre(prescription_no); // 수정할 처방전 게시글 가져오기
		model.addAttribute("pre", pre); // 정보 보냄
		return "/customer/prescription_modi";
	}
	
	@PostMapping("/prescription_modi") // 처방전 수정하기
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
		cservice.updatePre(pre); // 처방전 수정하기
		return "redirect:/customer/prescription_list?user_seq="+pre.getUser_seq();
	}
	
	@RequestMapping("/notice_list") // 공지사항 리스트 페이지 및 정보가져오기
	public String notice_list(Model model,Page pageDto) {
		HashMap<String, Object> map = cservice.selectAllN(pageDto); // 공지사항 리스트, 페이지넘버링 맵에 넣어 가져오기
		model.addAttribute("nlist", map.get("nlist")); // 공지사항 리스트 보내기
		model.addAttribute("pageDto", map.get("pageDto")); // 페이지넘버링 보내기
		return "/customer/notice_list";
	}
	
	@GetMapping("/notice_write") // 공지사항 작성페이지
	public String notice_write() {
		return "/customer/notice_write";
	}
	
	@PostMapping("/notice_write") // 공지사항 작성하기
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
		cservice.insertNotice(notice); // 공지사항 작성
		return "redirect:/adminPage/ex_notice";
	}
	
	@GetMapping("/notice_modi") // 공지사항 수정페이지
	public String notice_modi(Model model, int notice_no) {
	//	System.out.println(notice_no);
		HashMap<String,Object> map = cservice.selectOneN(notice_no); // 수정할 공지사항 정보 가져오기
		model.addAttribute("n", map.get("n")); // 정보 보내기
		return "/customer/notice_modi";
	}
	
	@PostMapping("/notice_modi") // 공지사항 수정하기
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
		cservice.updateNotice(notice); // 공지사항 수정
		return "redirect:/adminPage/ex_notice";
	}
	
	@RequestMapping("/notice_view") // 공지사항 게시글 보기
	public String notice_view(int notice_no, Model model) {
	//	System.out.println(notice_no);
		HashMap<String,Object> map = cservice.selectOneN(notice_no); // 볼 공지사항 정보, 이전, 다음 공지사항 가져오기
		model.addAttribute("n", map.get("n")); // 공지사항 정보 보내기
		model.addAttribute("next", map.get("next")); // 다음 공지사항 정보 보내기
		model.addAttribute("prev", map.get("prev")); // 이전 공지사항 정보 보내기
		return "/customer/notice_view";
	}
	
	@RequestMapping("/faq")
	public String faq() {
		
		return "/customer/faq";
	}
}

package com.java.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.java.dto.Inquiry;
import com.java.dto.Member;
import com.java.dto.Page;
import com.java.dto.Porder;
import com.java.dto.Return_table;
import com.java.mapper.MyMapper;
import com.java.service.myService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/mypage")
public class MyController {
	@Autowired
	myService myservice;
	@Autowired
	MyMapper mymapper;
	@Autowired
	HttpSession session;

//---------------------------------------------------------------------------------------------
	@RequestMapping("/order")
	public String order(Model model, Page pageDto, Porder order) {
		Integer user_seq = (Integer)session.getAttribute("sessionSeq");
		System.out.println("왜안되냐이거어머라이럼아sfj"+user_seq);
		if(session.getAttribute("sessionSeq") != null) {
			user_seq = (Integer) session.getAttribute("sessionSeq");
		} else {
			user_seq = 0;
			model.addAttribute("user_seq", user_seq);
		}
	//	System.out.println("마이페이지"+user_seq);
		HashMap<String, Object> ordermap = myservice.selectOrder(pageDto,user_seq);
		// System.out.println(order.getP_num());
		int allcount = mymapper.selectListCount(user_seq);

		model.addAttribute("list", ordermap.get("list"));
		model.addAttribute("pageDto", ordermap.get("pageDto"));
		model.addAttribute("user_seq", user_seq);
		model.addAttribute("allcount", allcount);

		return "/mypage/order";
	}

//----------------------------------------------------------------------------------------------
	@GetMapping("/get_leave")
	public String get_leave(Model model) {
		Member mem = new Member();
		mem.setUser_id((String) session.getAttribute("sessionId"));
		Member member = myservice.selectone(mem);

		String pw = member.getUser_pw();
		model.addAttribute("chpw", pw);
		return "/mypage/get_leave";
	}

	@PostMapping("/leave")
	@ResponseBody
	public Member get_leave(Member mem, Model model) {
		Member member = myservice.selectone(mem);

		return member;
	}

//-----------------------------------------------------------------------------------------------	
	@GetMapping("/doleave")
	public String doleave() {
		return "/mypage/doleave";
	}

	@PostMapping("/doleave")
	@ResponseBody
	public String doleave(String user_id) {
		myservice.deletemember(user_id);
		session.invalidate();
		return "회원 탈퇴가 완료되었습니다.";
	}
//-------------------------------------------------------------------------------------------------

	@PostMapping("/change")
	public String change1() {

		return "/mypage/change";
	}

	@GetMapping("/change")
	public String change(Model model, String nwePw2) {
		model.addAttribute("user_pw", nwePw2);
		Member mem = new Member();
		mem.setUser_id((String) session.getAttribute("sessionId"));
		Member member = myservice.selectone(mem);

		String pw = member.getUser_pw();
		model.addAttribute("chpw", pw);

		String email = member.getUser_email();
		String[] emailParts = email.split("@");
		String mail1 = emailParts[0]; // '@' 앞부분
		String mail2 = emailParts[1]; // '@' 뒷부분

		member.setEmail1(mail1);
		member.setEmail2(mail2);

		if (member.getUser_phone() != null) {
			String phone = member.getUser_phone();
			String[] phoneParts = phone.split("-");
			String phone1 = phoneParts[0]; // '-' 첫부분
			String phone2 = phoneParts[1]; // '-' 중간부분
			String phone3 = phoneParts[2]; // '-' 뒷부분

			member.setPhone1(phone1);
			member.setPhone2(phone2);
			member.setPhone3(phone3);
		}
		if (member.getUser_birth() != null) {
			String birth = member.getUser_birth();
			String[] birthParts = birth.split("-");
			String birth1 = birthParts[0]; // '-' 년도 부분
			String birth2 = birthParts[1]; // '-' 월부분
			String birth3 = birthParts[2];
			String[] birthdd = birth3.split(" ");// '-' 일부분
			String birth4 = birthdd[0];// '-' 일부분

			member.setBirth1(birth1);
			member.setBirth2(birth2);
			member.setBirth3(birth4);
		}
	//	System.out.println(member.getUser_addr());
		
		if (member.getUser_addr() != null) {
			String addr33 = member.getUser_addr();
			String[] addrParts = addr33.split("/");
			String addr2 = addrParts[1]; // '-' 월부분
			
		
			member.setAddr3(addr2);
		}
		
		model.addAttribute("member", member);
		return "/mypage/change";
	}

	// ---------------------------------------
	@GetMapping("/updateM")
	public String updateM() {
		return "/mypage/updateM";
	}

	@PostMapping("/updateM")
	@ResponseBody
	public String doupdateM(Member mem) {

		//System.out.println(mem.getUser_id());
		//System.out.println(mem.getUser_name());
		//System.out.println(mem.getUser_pw());
		//System.out.println(mem.getUser_email());
		//System.out.println(mem.getMkt_agree());
		//System.out.println(mem.getUser_zip());
		//System.out.println(mem.getAddr1());
		//System.out.println(mem.getAddr2());
		//System.out.println(mem.getX());
		//System.out.println(mem.getY());
		//System.out.println(mem.getUser_phone());
		
		myservice.updateone(mem);
		return "/mypage/updateM";
	}
	// ----------------------------------------

	@RequestMapping("/inquiry")
	public String inquiry(Model model, Page pageDto) {
		int user_seq = (int) session.getAttribute("sessionSeq");
		HashMap<String, Object> InquiryMap = myservice.selectInquiry(pageDto,user_seq);

		int allcount = mymapper.select_InquiryListCount(user_seq);

		model.addAttribute("list", InquiryMap.get("list"));
		model.addAttribute("pageDto", InquiryMap.get("pageDto"));
		model.addAttribute("allcount", allcount);

		return "/mypage/inquiry";
	}
// ----------------------------------------------------

	@RequestMapping("/inquiry_view")
	public String inquiry_view(Model model, int inquiry_no, Page pageDto) {

		HashMap<String, Object> Imap = myservice.selectOne_inquiry(inquiry_no, pageDto);

		model.addAttribute("inquiry", Imap.get("inquiry")); // bno 게시글
		model.addAttribute("prev", Imap.get("prev")); // 이전글
		model.addAttribute("next", Imap.get("next")); // 다음글

		return "/mypage/inquiry_view";
	}

// -----------------------------------------------------
	@GetMapping("/inquiry_write")
	public String inquiry_write() {
		return "/mypage/inquiry_write";
	}

	@PostMapping("/Inqury_dowrite")
	public String Inqury_dowrite(Inquiry inquiry, @RequestPart MultipartFile file) {
		String fileName="";
		// 파일이 있을경우 저장
		if(!file.isEmpty()) {
			String ori_fileName = file.getOriginalFilename();// 실제 파일이름
			UUID uuid = UUID.randomUUID(); // 랜덤숫자 생성
			fileName = uuid+"_"+ori_fileName; // 파일이름 변경(중복방지)
			System.out.println(fileName);
			String uploadUrl = "c:/upload/"; // 파일 업로드 위치
			File f = new File(uploadUrl+fileName);
			try {
				file.transferTo(f); // 파일 저장
			} catch(Exception e) {e.printStackTrace();}
		}
		inquiry.setInquiry_image(fileName); // write일땐 if 밖에 modi일땐 if 안에
		myservice.insert_Inqury(inquiry);
		return "redirect:/mypage/inquiry";
	}

// -----------------------------------------------------
	@RequestMapping("/inquiry_modi")
	public String inquiry_modi(Model model, int inquiry_no, Page pageDto) {
		HashMap<String, Object> Imap = myservice.selectOne_inquiry(inquiry_no, pageDto);

		model.addAttribute("inquiry", Imap.get("inquiry")); // bno 게시글
		model.addAttribute("prev", Imap.get("prev")); // 이전글
		model.addAttribute("next", Imap.get("next")); // 다음글

		return "/mypage/inquiry_modi";
	}

	@RequestMapping("/Inqury_domodi")
	@ResponseBody
	public String Inquiry_domodi(Inquiry inquiry) {
		myservice.modi_inquiry(inquiry);
		return "/mypage/Inqury_domodi";
	}

// ------------------------------------------------------
	@RequestMapping("/Inqury_delete")
	@ResponseBody
	public String Inqury_delete(int inquiry_no) {
		myservice.Inquiry_deleteone(inquiry_no);
		return "/mypage/Inqury_delete";
	}

//-------------------------------------------------------
	@RequestMapping("return_state")
	public String takeback_state(Model model, Page pageDto) {
		
		int user_seq = (int)session.getAttribute("sessionSeq");
		 HashMap<String, Object> ReturnMap = myservice.selectReturn(pageDto,user_seq);
		  
		  int allcount = mymapper.select_returnListCount();
		  
		  model.addAttribute("list",ReturnMap.get("list"));
		  model.addAttribute("pageDto", ReturnMap.get("pageDto"));
		  model.addAttribute("allcount",allcount);
		  
		  return "/mypage/return_state";
	}
//-------------------------------------------------------

	@RequestMapping("return")
	public String rreturn() {
		return "/mypage/return";
	}

	@RequestMapping("reason")
	public String reason(String reno,Model model) {
		System.out.println();
		model.addAttribute("reno", reno);
		return "/mypage/reason";
	}

//--------------------------------------------------------
	@RequestMapping("/return_dv")
	public String return_dv(Model model, @RequestParam String order_list, @RequestParam String order_p_num,int user_seq) {
		System.out.println(order_p_num);
		HashMap<String, Object> map = myservice.select_order_return(order_list, order_p_num,user_seq);

		model.addAttribute("list", map.get("list"));
		return "/mypage/return_dv";
	}

	@RequestMapping("/return_dv_do")
	@ResponseBody
	public String return_dv_do(String p_num, String count, String order_no, String order_date, String status,String reason) {

		System.out.println(p_num);

		  int user_seq = (int) session.getAttribute("sessionSeq");
		  String id =(String)session.getAttribute("sessionId");
		  
		  Date now = new Date(); // 현재 날짜/시간 출력 
		  System.out.println(now); // Thu May 03		  14:43:32 KST 2022 // 포맷팅 정의 
		  SimpleDateFormat formatter = new SimpleDateFormat("yyMMddHHmm"); // 포맷팅 적용 
		  String formatedNow =	  formatter.format(now); // 포맷팅 현재 날짜/시간 출력 
	
		  
		  
		  
		  
		  String return_no = id+formatedNow;
		  String[] p_nums = p_num.split(","); 
		  System.out.println(p_nums);
		  String[] counts = count.split(",");
		  String[] order_nos = order_no.split(",");
		  String[] order_dates = order_date.split(",");
		  String[] statuss = status.split(",");
		  
		
		  for(int i=0; i<p_nums.length; i++) {
			  
			  Return_table r1 = new Return_table();
		  r1.setP_num(p_nums[i]);
		  
		  r1.setReturn_state(statuss[i]);
	  r1.setOrder_no(order_nos[i]);
		  r1.setReturn_reason(reason);
		  r1.setReturn_no(return_no+i);
		  r1.setReturn_count(counts[i]);
		  
		
		  
		  myservice.insert_return(r1,user_seq);
			  
	  }
		 
		return "ss";
	}
	



}

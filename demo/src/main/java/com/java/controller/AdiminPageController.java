package com.java.controller;

import java.io.File;
import java.util.ArrayList;
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

import com.java.dto.Drone;
import com.java.dto.Page;
import com.java.dto.Member;
import com.java.dto.Porder;
import com.java.dto.Prescription;
import com.java.dto.Product;
import com.java.dto.User;
import com.java.mapper.AdminMapper;
import com.java.dto.Return_table;
import com.java.mapper.MyMapper;
import com.java.service.AdminService;
import com.java.service.CustomerService;
import com.java.service.EventService;
import com.java.service.ProductService;
import com.java.service.UserService;
import com.java.service.myService;

import jakarta.servlet.http.HttpSession;


@Controller
@RequestMapping("/adminPage")
public class AdiminPageController {
	
	@Autowired AdminService adservice;
	@Autowired ProductService pservice;
	@Autowired CustomerService cservice;
	@Autowired EventService eservice;
	@Autowired myService myservice;
	@Autowired MyMapper mymapper;
	@Autowired AdminMapper adMapper;
	@Autowired UserService uservice;
	@Autowired HttpSession session;
	
	
	@RequestMapping("/return_check")
	public String return_check(String return_no,Model model) {
	Return_table re =  adservice.selectdoreturn(return_no);
	System.out.println(re.getP_num());
	System.out.println(re.getUser_seq());
	Member m = new Member();
	m.setUser_seq(re.getUser_seq());
	Member mem = myservice.selectdoreturn(m);
	String p_num=re.getP_num();
	Product product = pservice.selectdoreturn(p_num);
	System.out.println(product.getPrice());
	
	model.addAttribute("re",re);
	model.addAttribute("mem",mem);
	model.addAttribute("product",product);
		return"/adminPage/return_check";
	}
	
	@RequestMapping("/return_docheck")
	@ResponseBody
	public String return_docheck(int user_seq,String return_no ) {
		Member m = new Member();
		m.setUser_seq(user_seq);
		Member mem = myservice.selectdoreturn(m);
		uservice.sendEmail2(mem);
		myservice.updatereturn(return_no);
		

	return "성공";
	}
	
	@GetMapping("/drone_write")
	public String drone_write() {
		
		
		return"/adminPage/drone_write";
	}

	@PostMapping("/drone_write")
	public String drone_write1(@RequestPart MultipartFile image, Drone drone) {
		//	System.out.println(product.getCompany());
		String fileName="";
		// 파일이 있을경우 저장
		if(!image.isEmpty()) {
			String ori_fileName = image.getOriginalFilename();// 실제 파일이름
			UUID uuid = UUID.randomUUID(); // 랜덤숫자 생성
			fileName = uuid+"_"+ori_fileName; // 파일이름 변경(중복방지)
		//	System.out.println(fileName);
			String uploadUrl = "c:/upload/"; // 파일 업로드 위치
			File f = new File(uploadUrl+fileName);
			try {
				image.transferTo(f); // 파일 저장
			} catch(Exception e) {e.printStackTrace();}
			drone.setDrone_image(fileName); // write일땐 트라이 밖에 modi일땐 안에
		}	
	//	System.out.println(fileName);
		adservice.insertDrone(drone);
		
		return"/adminPage/drone_write";
	}
	
	@RequestMapping("ex_return")
	public String ex_return(Model model, Page pageDto) {
		
		int user_seq = (int)session.getAttribute("sessionSeq");
		 HashMap<String, Object> ReturnMap = myservice.selectReturn(pageDto,user_seq);
		  
		  int allcount = mymapper.select_returnListCount();
		  
		  model.addAttribute("list",ReturnMap.get("list"));
		  model.addAttribute("pageDto", ReturnMap.get("pageDto"));
		  model.addAttribute("allcount",allcount);
		
		return"/adminPage/ex_return";
	}
	@RequestMapping("ex_Porder")
	  public String ex_Porder(Model model, Page pageDto ) {
	
			
		   int user_seq = (int) session.getAttribute("sessionSeq");
			  if(session.getAttribute("sessionSeq") == null) { model.addAttribute("result",
			  2); } else { user_seq = (int) session.getAttribute("sessionSeq"); } 
			  //System.out.println("마이페이지"+user_seq); 
			  HashMap<String, Object> ordermap =myservice.selectOrder(pageDto,user_seq); 
			  //System.out.println(order.getP_num()); 
			  int allcount =mymapper.selectListCount(user_seq);
			  
			  model.addAttribute("list", ordermap.get("list"));
			  model.addAttribute("pageDto", ordermap.get("pageDto"));
			  model.addAttribute("allcount", allcount);
			 

		return"/adminPage/ex_Porder";
	}
	
	@RequestMapping("/deletedrone")
	@ResponseBody
	public String deletedrone (String drone_id) {
		
		adservice.deletedrone(drone_id);
		
		
		return"/adminPage/deletedrone";
	}
	
	@RequestMapping("/updatedrone")
	@ResponseBody
	public String updatedrone (@RequestParam String is_possible,String drone_id) {
	
		System.out.println(drone_id);
		adservice.updatedrone(is_possible,drone_id);

		
		return"/adminPage/updatedrone";
	}
	
	@RequestMapping("/ex_drone")
	public String ex_drone (Model model) {
		HashMap<String, Object> droneMap = adservice.selectdrone();
	//	int allcount = mymapper.select_InquiryListCount();
		model.addAttribute("list", droneMap.get("list"));
	//	model.addAttribute("pageDto", droneMap.get("pageDto"));
		//model.addAttribute("allcount", allcount);
		
		return"/adminPage/ex_drone";
	}
	
	@RequestMapping("/ex_inquiry")
	public String  ex_inquiry (Model model,Page pageDto) {
		
		HashMap<String, Object> InquiryMap = adservice.selectInquiry(pageDto);

		//int allcount = mymapper.select_InquiryListCount();
		
		model.addAttribute("list", InquiryMap.get("list"));
		model.addAttribute("pageDto", InquiryMap.get("pageDto"));
	//	model.addAttribute("allcount", allcount);
		return"/adminPage/ex_inquiry";
	}
	
	
//------------------------------------------------------------------------
	@GetMapping ("/product_write")
	public String product_write () { // 약국 로그인 시 상품등록 페이지 열리게
		return "/adminPage/product_write";
	}
	
	@PostMapping ("/product_write")
	public String doproduct_write (@RequestPart MultipartFile pimage, Product product) { // 상품등록 페이지에서 올린 이미지파일,    상품페이지에서 입력된 정보들
									
		int store_seq=(int)session.getAttribute("sessionSeq"); // 로그인 한 약국의 고유번호
		String fileName="";
		// 파일이 있을경우 저장
		if(!pimage.isEmpty()) {
			String ori_fileName = pimage.getOriginalFilename();// 실제 파일이름
			UUID uuid = UUID.randomUUID(); // 랜덤숫자 생성
			fileName = uuid+"_"+ori_fileName; // 파일이름 변경(중복방지)
		//	System.out.println(fileName);
			String uploadUrl = "c:/upload/"; // 파일 업로드 위치
			File f = new File(uploadUrl+fileName);
			try {
				pimage.transferTo(f); // 파일 저장
			} catch(Exception e) {e.printStackTrace();}
			product.setImage(fileName); // write일땐 트라이 밖에 modi일땐 안에
		}	
	//	System.out.println(fileName);
		adservice.insertP(product); // 서비스로 연결
		return "/adminPage/product_write";
	}
	
	@RequestMapping ("/ad_medical")
	public String ad_medical (Model model,Page pageDto,@RequestParam(defaultValue = "0")int medical_category,String sWord,@RequestParam(defaultValue= "0")int store_seq,@RequestParam(defaultValue= "0")int sorting) {// 상품정보관리 - 상품현황
		HashMap<String, Object> map = pservice.selectMList(medical_category,pageDto, sWord,store_seq,sorting);
		System.out.println(medical_category);
		model.addAttribute("mCList", map.get("mCList"));
		model.addAttribute("pageDto", map.get("pageDto"));
		model.addAttribute("medical_category", map.get("medical_category"));
		model.addAttribute("sWord", sWord);
		model.addAttribute("store_seq", store_seq);
		model.addAttribute("sorting", sorting);
		return "/adminPage/ad_medical";
	}
	
	@RequestMapping ("/ad_health")
	public String ad_health (Model model,Page pageDto,@RequestParam(defaultValue = "0")int health_category,String sWord,@RequestParam(defaultValue= "0")int store_seq,@RequestParam(defaultValue= "0")int sorting) {// 상품정보관리 - 상품현황
		HashMap<String, Object> map = pservice.selectDlist(health_category,pageDto,sWord,store_seq,sorting);
		model.addAttribute("mDList", map.get("mDList"));
		model.addAttribute("pageDto", map.get("pageDto"));
		model.addAttribute("health_category", map.get("health_category"));
		model.addAttribute("sWord", sWord);
		model.addAttribute("store_seq", store_seq);
		model.addAttribute("sorting", sorting);
		return "/adminPage/ad_health";
	}
	
	@PostMapping ("/modi_medi")
	@ResponseBody
	public Product modi_medi (Product product,Model model) {
	//	System.out.println(product.getP_num()+"  "+product.getPrice()+"   "+product.getStock());
		Product pr = adservice.updateP(product);
		return pr;
	}
	
	@PostMapping ("/modi_health")
	@ResponseBody
	public Product modi_health (Product product,Model model) {
		//	System.out.println(product.getP_num()+"  "+product.getPrice()+"   "+product.getStock());
		Product pr = adservice.updateHP(product);
		return pr;
	}
	
	@PostMapping ("/deleteP")
	@ResponseBody
	public String deleteP (Product product) {
	//	System.out.println(product.getP_num());
		adservice.deleteP(product.getP_num());
		return "삭제되었습니다.";
	}
	
	@GetMapping ("/product_modi")
	public String product_modi (int p_num,Model model) {
		return "/adminPage/product_modi";
	}
	
	@RequestMapping ("/admin_index")
	public String admin_index () {
		return "/adminPage/admin_index";
	}
	
	@RequestMapping("/ex_f_board")
	public String ex_f_board() {
		return "/adminPage/ex_f_board";
	}
	
	@RequestMapping("/ex_member")
	public String ex_member(Model model, Page pageDto) {
		HashMap<String,Object> map = adservice.allUser(pageDto);
		model.addAttribute("uList", map.get("uList"));
		model.addAttribute("sList", map.get("sList"));
		model.addAttribute("nList", map.get("nList"));
		model.addAttribute("upageDto", map.get("upageDto"));
		model.addAttribute("spageDto", map.get("spageDto"));
		model.addAttribute("npageDto", map.get("npageDto"));
		return "/adminPage/ex_member";
	}
	
	@RequestMapping("/ex_event")
	public String ex_event(Model model,Page pageDto) {
		HashMap<String,Object> mapE = eservice.selectAllE(pageDto);
		HashMap<String,Object> mapF = eservice.selectAllF(pageDto);
		
		model.addAttribute("elist", mapE.get("elist"));
		model.addAttribute("flist", mapF.get("flist"));
		model.addAttribute("epageDto", mapE.get("pageDto"));
		model.addAttribute("fpageDto", mapF.get("pageDto"));
		return "/adminPage/ex_event";
	}
	
	@RequestMapping("/ex_notice")
	public String ex_notice(Model model,Page pageDto) {
		HashMap<String,Object> map = adservice.selectN(pageDto);
		model.addAttribute("nlist", map.get("nlist"));
		model.addAttribute("pageDto", map.get("pageDto"));
		return "/adminPage/ex_notice";
	}
	
	@RequestMapping("/ad_prescription")
	public String ad_prescription(Model model,Page pageDto,@RequestParam(defaultValue = "0")int user_seq) {
		HashMap<String, Object> map = cservice.selectMyPrescription(pageDto,user_seq);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("pageDto", map.get("pageDto"));
		return "/adminPage/ad_prescription";
	}
	
	@PostMapping("/checkPre")
	@ResponseBody
	public Prescription checkPre(int prescription_no, int prescription_price) {
		Prescription pre = adservice.checkPre(prescription_no,prescription_price);
		return pre;
	}
	
	@PostMapping("/deleteU")
	@ResponseBody
	public String deleteU(int user_seq) {
	//	System.out.println("컨트롤러"+user_seq);
		adservice.deleteU(user_seq);
		return "탈퇴처리 되었습니다.";
	}
	
	@PostMapping("/deleteNotice")
	@ResponseBody
	public String deleteNotice(int notice_no) {
	//	System.out.println(notice_no);
		adservice.deleteNotice(notice_no);
		return "성공적으로 삭제되었습니다.";
	}
	
	@RequestMapping ("/ex_Order")
	public String ex_Order (Model model) {
//		HashMap<String,Object>map = adnservice.selectAll();
//		model.addAttribute("list",map.get("list"));
		return "/adminPage/ex_Order";
	}
	
	@GetMapping ("/store_approval")
	public String store_approval (Model model,int user_seq) {
		//System.out.println("컨트롤러"+user_seq);
		User user = adservice.checkApproval(user_seq);
		model.addAttribute("user", user);
		return "/adminPage/store_approval";
	}
	
	@PostMapping("/store_approval")
	public String store_approval(User user,Model model) {
	//	System.out.println(user.getUser_seq());
		adservice.updateApproval(user.getUser_seq());
		model.addAttribute("result", 2);
		return "redirect:/adminPage/ex_member";
	}
	

	
	
	
}

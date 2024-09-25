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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.java.dto.Page;
import com.java.dto.Prescription;
import com.java.dto.Product;
import com.java.dto.User;
import com.java.service.AdminService;
import com.java.service.CustomerService;
import com.java.service.EventService;
import com.java.service.ProductService;


@Controller
@RequestMapping("/adminPage")
public class AdiminPageController {
	
	@Autowired AdminService adservice;
	@Autowired ProductService pservice;
	@Autowired CustomerService cservice;
	@Autowired EventService eservice;
	
	@GetMapping ("/product_write")
	public String product_write () {
		return "/adminPage/product_write";
	}
	
	@PostMapping ("/product_write")
	public String doproduct_write (@RequestPart MultipartFile pimage, Product product) {
	//	System.out.println(product.getCompany());
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
		adservice.insertP(product);
		return "/adminPage/admin_index";
	}
	
	@RequestMapping ("/ad_medical")
	public String ad_medical (Model model,Page pageDto,@RequestParam(defaultValue = "0")int medical_category,String sWord,@RequestParam(defaultValue= "0")int store_seq) {// 상품정보관리 - 상품현황
		HashMap<String, Object> map = pservice.selectMList(medical_category,pageDto, sWord,store_seq);
		System.out.println(medical_category);
		model.addAttribute("mCList", map.get("mCList"));
		model.addAttribute("pageDto", map.get("pageDto"));
		model.addAttribute("medical_category", map.get("medical_category"));
		model.addAttribute("sWord", sWord);
		model.addAttribute("store_seq", store_seq);
		return "/adminPage/ad_medical";
	}
	
	@RequestMapping ("/ad_health")
	public String ad_health (Model model,Page pageDto,@RequestParam(defaultValue = "0")int health_category,String sWord,@RequestParam(defaultValue= "0")int store_seq) {// 상품정보관리 - 상품현황
		HashMap<String, Object> map = pservice.selectDlist(health_category,pageDto,sWord,store_seq);
		model.addAttribute("mDList", map.get("mDList"));
		model.addAttribute("pageDto", map.get("pageDto"));
		model.addAttribute("health_category", map.get("health_category"));
		model.addAttribute("sWord", sWord);
		model.addAttribute("store_seq", store_seq);
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

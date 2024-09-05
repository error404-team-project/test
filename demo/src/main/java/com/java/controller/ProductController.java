package com.java.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.dto.Page;
import com.java.dto.Product;
import com.java.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired ProductService pservice;
	
	@RequestMapping("/cart")
	public String cart(Model model) {
		HashMap<String, Object> map = pservice.seletCart();
	//	System.out.println(map.get("list"));
		model.addAttribute("list", map.get("list"));
		return "/product/cart";
	}
	
	@RequestMapping("/medical_list")
	public String medical_list(Model model,@RequestParam(defaultValue = "0")int medical_category, Page pageDto) {
		HashMap<String, Object> map = pservice.selectMList(medical_category,pageDto);
		
		model.addAttribute("mCList", map.get("mCList"));
		model.addAttribute("pageDto", map.get("pageDto"));
		model.addAttribute("medical_category", map.get("medical_category"));
		return "/product/medical_list";
	}
	
	@RequestMapping("/household_list")
	public String household_list() {
		return "/product/household_list";
	}
	
	@RequestMapping("/em_delivery")
	public String em_delivery() {
		return "/product/em_delivery";
	}
	
	@RequestMapping("/medical_view")
	public String medical_view(Model model,int p_num,int medical_category) {
	//	System.out.println(p_num);
	//	System.out.println(medical_category);
		HashMap<String,Object> map = pservice.mediView(p_num);
		model.addAttribute("p_num", p_num);
		model.addAttribute("medical_category", medical_category);
		model.addAttribute("medi", map.get("medi"));
		model.addAttribute("wp_num", map.get("wp_num"));
		model.addAttribute("cp_num", map.get("cp_num"));
		return "/product/medical_view";
	}
	
	@PostMapping("/insertWish")
	@ResponseBody
	public String insertWish(int user_seq, int p_num) {
		System.out.println("회원일련번호"+user_seq);
		System.out.println("제품고유번호"+p_num);
		pservice.insertWish(user_seq, p_num);
		return "위시리스트에 저장되었습니다.";
	}
	
	@PostMapping("/deletetWish")
	@ResponseBody
	public String deletetWish(int user_seq, int p_num) {
	//		System.out.println("회원일련번호"+user_seq);
	//		System.out.println("제품고유번호"+p_num);
		pservice.deletetWish(user_seq, p_num);
		return "위시리스트에서 삭제되었습니다.";
	}
	
	@PostMapping("/inCart")
	@ResponseBody
	public String inCart(int user_seq, int p_num, int count) {
		System.out.println("회원일련번호"+user_seq);
		System.out.println("제품고유번호"+p_num);
		System.out.println("몇개 담을건지"+count);
		pservice.inCart(user_seq, p_num,count);
		return "장바구니에 담겼습니다.";
	}
	
	
	@RequestMapping("/household_view")
	public String household_view() {
		return "/product/household_view";
	}
	
}

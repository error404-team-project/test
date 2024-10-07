package com.java.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	
	
	

	@PostMapping("/cartdelete")
	 public ResponseEntity<?> cartdelete(@RequestBody List<Long> ids) {
		
		//System.out.println(ids);
        try {
        	pservice.deleteCartItems(ids);
            return ResponseEntity.ok("삭제 성공");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("삭제 실패");
        }
    }	
	@RequestMapping("/onchange")
	@ResponseBody
	public String onchange(@RequestParam("p_num") int p_num, 
            @RequestParam("p_count") int count) {
		
		/*
		 * System.out.println(p_num); System.out.println(count);
		 */
try {
// 수량 업데이트 로직
	pservice.updateProductQuantity(p_num, count);
return "수량이 업데이트되었습니다.";
} catch (Exception e) {
e.printStackTrace();
return "수량 업데이트 실패";
}
	}
	
///////////////////////////////////////////////////////////////////////////////////////	
	
	
	@RequestMapping("/cart")
	public String cart(Model model) {
		HashMap<String, Object> map = pservice.seletCart();
	//	System.out.println(map.get("list"));
		model.addAttribute("list", map.get("list"));
		model.addAttribute("user_seq", map.get("user_seq"));
		return "/product/cart";
	}
	
	@RequestMapping("/medical_list")
	public String medical_list(@RequestParam(defaultValue= "0")int store_seq,Model model,@RequestParam(defaultValue = "0")int medical_category, Page pageDto, String sWord,@RequestParam(defaultValue= "0")int sorting) {
		HashMap<String, Object> map = pservice.selectMList(medical_category,pageDto,sWord,store_seq,sorting);
	//	System.out.println("컨트롤러 : "+sWord);
		model.addAttribute("mCList", map.get("mCList"));
		model.addAttribute("wList", map.get("wList"));
		model.addAttribute("pageDto", map.get("pageDto"));
		model.addAttribute("user_seq", map.get("user_seq"));
		model.addAttribute("medical_category", map.get("medical_category"));
		model.addAttribute("sWord", sWord);
		model.addAttribute("store_seq", store_seq);
		return "/product/medical_list";
	}
	
	@RequestMapping("/household_list")
	public String household_list(@RequestParam(defaultValue= "0")int store_seq, Model model,@RequestParam(defaultValue= "0")int health_category, Page pageDto, String sWord,@RequestParam(defaultValue= "0")int sorting) {
		HashMap<String, Object> map = pservice.selectDlist(health_category,pageDto,sWord,store_seq,sorting);
			System.out.println(store_seq);
		model.addAttribute("mDList", map.get("mDList"));
		model.addAttribute("wList", map.get("wList"));
		model.addAttribute("pageDto", map.get("pageDto"));
		model.addAttribute("user_seq", map.get("user_seq"));
		model.addAttribute("health_category", map.get("health_category"));
		model.addAttribute("sWord", sWord);
		model.addAttribute("store_seq", store_seq);

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
	
	@RequestMapping("/household_view")
	public String household_view(Model model,int p_num, int health_category) {
		HashMap<String,Object> map = pservice.dailyView(p_num);
		model.addAttribute("p_num", p_num);
		model.addAttribute("health_category", health_category);
		model.addAttribute("daily", map.get("daily"));
		model.addAttribute("wp_num", map.get("wp_num"));
		model.addAttribute("cp_num", map.get("cp_num"));
		return "/product/household_view";
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
	
	
}

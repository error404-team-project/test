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
	
	
	@RequestMapping("/cart") // 장바구니 페이지
	public String cart(Model model) {
		HashMap<String, Object> map = pservice.seletCart(); // 로그인 한 회원이 장바구니에 담은 상품 가져오기
	//	System.out.println(map.get("list"));
		model.addAttribute("list", map.get("list")); // 장바구니에 담은 상품 리스트
		model.addAttribute("user_seq", map.get("user_seq")); // 로그인 한 회원의 고유번호
		return "/product/cart";
	}
	
	@RequestMapping("/medical_list") // 의약품 리스트 페이지
	public String medical_list(@RequestParam(defaultValue= "0")int store_seq,Model model,@RequestParam(defaultValue = "0")int medical_category, Page pageDto, String sWord,@RequestParam(defaultValue= "0")int sorting) {
		HashMap<String, Object> map = pservice.selectMList(medical_category,pageDto,sWord,store_seq,sorting);
	//	System.out.println("컨트롤러 : "+sWord);
		model.addAttribute("mCList", map.get("mCList")); // 전체 의약품 리스트 보내기
		model.addAttribute("wList", map.get("wList")); // 로그인 한 회원의 위시리스트 보내기
		model.addAttribute("pageDto", map.get("pageDto")); // 의약품 페이지 넘버링 보내기
		model.addAttribute("user_seq", map.get("user_seq")); // 로그인 한 회원의 고유번호 보내기
		model.addAttribute("medical_category", map.get("medical_category")); // 선택한 의약품 카테고리 보내기
		model.addAttribute("sWord", sWord); // 검색한 단어 보내기
		model.addAttribute("store_seq", store_seq); // 선택한 약국의 고유번호 보내기
		return "/product/medical_list";
	}
	
	@RequestMapping("/household_list") // 건강기능식품 리스트 페이지
	public String household_list(@RequestParam(defaultValue= "0")int store_seq, Model model,@RequestParam(defaultValue= "0")int health_category, Page pageDto, String sWord,@RequestParam(defaultValue= "0")int sorting) {
		HashMap<String, Object> map = pservice.selectDlist(health_category,pageDto,sWord,store_seq,sorting);
			System.out.println(store_seq);
		model.addAttribute("mDList", map.get("mDList")); // 전체 건강기능식품 리스트 보내기
		model.addAttribute("wList", map.get("wList")); // 로그인 한 회원의 위시리스트 보내기
		model.addAttribute("pageDto", map.get("pageDto")); // 건강기능식품 페이지넘버링 보내기
		model.addAttribute("user_seq", map.get("user_seq")); // 로그인 한 회원의 고유번호 보내기
		model.addAttribute("health_category", map.get("health_category")); // 선택한 건강기능식품 카테고리 보내기
		model.addAttribute("sWord", sWord); // 검색한 단어 보내기
		model.addAttribute("store_seq", store_seq); // 선택한 약국의 고유번호 보내기

		return "/product/household_list";
	}
	
	@RequestMapping("/em_delivery")
	public String em_delivery() {
		return "/product/em_delivery";
	}
	
	@RequestMapping("/medical_view") // 선택한 의약품 상세정보 페이지
	public String medical_view(Model model,int p_num,int medical_category) {
	//	System.out.println(p_num);
	//	System.out.println(medical_category);
		HashMap<String,Object> map = pservice.mediView(p_num); // 선택한 의약품의 정보, 장바구니/위시리스트에 담긴 상품의 고유번호, 담겨있는지 정보 가져오기
		model.addAttribute("p_num", p_num); // 선택한 상품의 고유번호 보내기
		model.addAttribute("medical_category", medical_category); // 리스트 페이지에서 넘어온 의약품 카테고리 보내기
		model.addAttribute("medi", map.get("medi")); // 선택한 의약품 정보 보내기
		model.addAttribute("wp_num", map.get("wp_num")); // 로그인 한 회원의 장바구니에 담긴 상품고유번호 보내기
		model.addAttribute("cp_num", map.get("cp_num")); // 로그인 한 회원의 위시리스트에 담긴 상품 고유번호 보내기
		return "/product/medical_view";
	}
	
	@RequestMapping("/household_view") // 선택한 건강기능식품 상세정보 페이지
	public String household_view(Model model,int p_num, int health_category) {
		HashMap<String,Object> map = pservice.dailyView(p_num); // 선택한 건강기능식품의 정보, 장바구니/위시리스트에 담긴 상품의 고유번호, 담겨있는지 정보 가져오기
		model.addAttribute("p_num", p_num); // 선택한 상품의 고유번호 보내기
		model.addAttribute("health_category", health_category); // 리스트 페이지에서 넘어온 건강기능식품 카테고리 보내기
		model.addAttribute("daily", map.get("daily")); // 선택한 건강기능식품 정보 보내기
		model.addAttribute("wp_num", map.get("wp_num")); // 로그인 한 회원의 장바구니에 담긴 상품 고유번호 보내기
		model.addAttribute("cp_num", map.get("cp_num")); // 로그인 한 회원의 위시리시트에 담긴 상품 고유번호 보내기
		return "/product/household_view";
	}
	
	@PostMapping("/insertWish") // 위시리스트 추가하기 ajax
	@ResponseBody
	public String insertWish(int user_seq, int p_num) {
		System.out.println("회원일련번호"+user_seq);
		System.out.println("제품고유번호"+p_num);
		pservice.insertWish(user_seq, p_num); // 로그인 한 회원의 위시리스트 DB에 상품 추가
		return "위시리스트에 저장되었습니다.";
	}
	
	@PostMapping("/deletetWish") // 위시리스트 삭제하기 ajax
	@ResponseBody
	public String deletetWish(int user_seq, int p_num) {
	//		System.out.println("회원일련번호"+user_seq);
	//		System.out.println("제품고유번호"+p_num);
		pservice.deletetWish(user_seq, p_num); // 위시리스트에 담긴 상품 DB에서 삭제
		return "위시리스트에서 삭제되었습니다.";
	}
	
	@PostMapping("/inCart") // 장바구니에 담기 ajax
	@ResponseBody
	public String inCart(int user_seq, int p_num, int count) {
		System.out.println("회원일련번호"+user_seq);
		System.out.println("제품고유번호"+p_num);
		System.out.println("몇개 담을건지"+count);
		pservice.inCart(user_seq, p_num,count); // 로그인 한 회원의 장바구니 DB에 상품 고유번호, 수량 넣기
		return "장바구니에 담겼습니다.";
	}
	
	
}

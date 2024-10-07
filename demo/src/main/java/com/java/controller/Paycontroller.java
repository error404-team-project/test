package com.java.controller;

import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.dto.Cart;
import com.java.dto.Porder;
import com.java.dto.User;
import com.java.service.PayService;
import com.java.service.ProductService;
import com.java.service.UserService;
import com.java.service.myService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/payment")
public class Paycontroller {
	@Autowired
	ProductService pservice;
	@Autowired UserService uservice;
	@Autowired myService myservice;
	@Autowired HttpSession session;
	@Autowired PayService payService;
	
	
	@RequestMapping("/payment")
	public String payment (Model model,@RequestParam("p_num") int p_num, 
    @RequestParam(value = "p_count", defaultValue = "1") int p_count){
		
	//  이건 medi 쪽 정보
			  HashMap<String,Object> map = pservice.mediView(p_num);
			  model.addAttribute("p_num", p_num); 
			  model.addAttribute("medi", map.get("medi"));
			  model.addAttribute("wp_num", map.get("wp_num")); 
			  model.addAttribute("cp_num",map.get("cp_num"));
			  model.addAttribute("p_count", p_count);	
			  // 이건 household 쪽 정보
			  HashMap<String,Object> hmap = pservice.dailyView(p_num);
				model.addAttribute("p_num", p_num);
				model.addAttribute("daily", hmap.get("daily"));
				model.addAttribute("cp_num", hmap.get("cp_num"));
				model.addAttribute("wp_num", hmap.get("wp_num"));
				
				// 이건 주문자 정보
				
				String id=(String)session.getAttribute("sessionId");
				User user = uservice.userInfo(id);
				model.addAttribute("user",user);
				
				
				return "/payment/payment";
	}
	
	@RequestMapping("/payment2")
	public String payment2 (Model model){
		
		System.out.println("가나다라");
				String id=(String)session.getAttribute("sessionId");
				
			//	System.out.println(id);
				
				User user = uservice.userInfo(id);
				model.addAttribute("user",user);
				
				int user_seq = user.getUser_seq();
			//	System.out.println(user_seq);
				
				
				ArrayList<Cart> cartlist = payService.cartview(user_seq);
			//	System.out.println(cartlist.size());
				model.addAttribute("cartlist",cartlist);
				
				return "/payment/payment2";
	}
	
	@RequestMapping("/order_check2")
	public String medi_order_check2(
           @RequestParam("name") String name,
           @RequestParam("zip") String zip,
           @RequestParam("zip1") String zip1,
           @RequestParam("zip2") String zip2,
           @RequestParam("order_no") String order_no,
           String phone, String email,
           Model model,
           double x,
           double y) {
		
			
		String id=(String)session.getAttribute("sessionId");

		User user = uservice.userInfo(id);
		model.addAttribute("user",user);
		
       // 모델에 데이터 추가
       model.addAttribute("name", name);
       model.addAttribute("zip", zip);
       model.addAttribute("zip1", zip1);
       model.addAttribute("zip2", zip2);
       model.addAttribute("phone",phone);
       model.addAttribute("email",email);
       model.addAttribute("order_no",order_no);
       model.addAttribute("x",x);
       model.addAttribute("y",y);
       
    // split 메서드를 사용하여 영어와 숫자를 분리
       String[] parts = order_no.split("(?<=\\D)(?=\\d)|(?<=\\d)(?=\\D)");
   	//  2024913191214774
       String numbers = parts.length > 1 ? parts[1] : ""; // 숫자 부분
 
       String formattedDate = formatToDate(numbers);

       model.addAttribute("formattedDate", formattedDate);
       
		
       int user_seq = user.getUser_seq();
		ArrayList<Cart> cartlist = payService.cartview(user_seq);
		model.addAttribute("cartlist",cartlist);
		

		  return "/payment/order_check2";
	}
	
	@RequestMapping("/order_check")
	public String medi_order_check(
		   @RequestParam("p_num") int p_num,
           @RequestParam("p_count") int p_count,
           @RequestParam("name") String name,
           @RequestParam("zip") String zip,
           @RequestParam("zip1") String zip1,
           @RequestParam("zip2") String zip2,
           @RequestParam("order_no") String order_no,
           String phone, String email,
           Model model,
           double x,
           double y) {
		
		//  이건 medi 쪽 정보
		  HashMap<String,Object> map = pservice.mediView(p_num);
		  model.addAttribute("p_num", p_num); 
		  model.addAttribute("medi", map.get("medi"));
		  model.addAttribute("wp_num", map.get("wp_num")); 
		  model.addAttribute("cp_num",map.get("cp_num"));
		  model.addAttribute("p_count", p_count);	
		  // 이건 household 쪽 정보
		  HashMap<String,Object> hmap = pservice.dailyView(p_num);
			model.addAttribute("p_num", p_num);
			model.addAttribute("daily", hmap.get("daily"));
			model.addAttribute("cp_num", hmap.get("cp_num"));
			model.addAttribute("wp_num", hmap.get("wp_num"));
			
		String id=(String)session.getAttribute("sessionId");
		User user = uservice.userInfo(id);
		model.addAttribute("user",user);
		
       // 모델에 데이터 추가
       model.addAttribute("p_num", p_num);
       model.addAttribute("p_count", p_count);
       model.addAttribute("name", name);
       model.addAttribute("zip", zip);
       model.addAttribute("zip1", zip1);
       model.addAttribute("zip2", zip2);
       model.addAttribute("phone",phone);
       model.addAttribute("email",email);
       model.addAttribute("order_no",order_no);
       model.addAttribute("x",x);
       model.addAttribute("y",y);
       

    // split 메서드를 사용하여 영어와 숫자를 분리
       String[] parts = order_no.split("(?<=\\D)(?=\\d)|(?<=\\d)(?=\\D)");
   	//  2024913191214774
       String numbers = parts.length > 1 ? parts[1] : ""; // 숫자 부분
 
       String formattedDate = formatToDate(numbers);

       model.addAttribute("formattedDate", formattedDate);

		  return "/payment/order_check";
	}

	// 주문 날짜 만드는 메서드
	private String formatToDate(String numbers) {
	    if (numbers.length() >= 8) {
            String year = numbers.substring(0, 4);
            String month = numbers.substring(4, 5);
            String day = numbers.substring(5, 7);
            return year + " 년 " + month + " 월 " + day+" 일 ";
        }
        return ""; // 포맷이 잘못된 경우 빈 문자열 반환
	}
	
	// 고객이 주문한 정보들을 DB에 넣는 메서드
	@RequestMapping("/DBorder")
	@ResponseBody
	public String DBorder(Porder order, double x,double y, Model model){
		
		 payService.orderInsert(order);
			onejsonWrite(order,x,y);
			model.addAttribute("x",x);
			model.addAttribute("y",y);
		return "/payment/DBorder";	
	}
	// 고객이 주문한 정보들을 DB에 넣는 메서드
	@RequestMapping("/DBorderList")
	@ResponseBody
	public String DBorderList(Porder order, String pnums, String cnts, double x,double y,Model model){
		
		String[] p_nums = pnums.split(",");
		String[] cntss = cnts.split(",");
		// payService.orderInsert(order);
		//System.out.println(p_nums);
		//System.out.println(cntss);
		int n = cntss.length;
		//System.out.println(n);
		

		for( int i=0; i<n; i++) {
			order.setP_num( Integer.parseInt( p_nums[i]));
			order.setOrder_count(Integer.parseInt(cntss[i]));
		//	System.out.println(order.toString());
			payService.orderInsert(order);
		}
		onejsonWrite(order,x,y);
		model.addAttribute("x",x);
		model.addAttribute("y",y);
		
		return "/payment/DBorderList";	
	}
	
	 @PostMapping("/updatestate")
	    public ResponseEntity<?> updateState(@RequestParam List<Long> p_nums) {
	        try {
	            if (p_nums == null || p_nums.isEmpty()) {
	                return ResponseEntity.badRequest().body("상품 ID가 필요합니다.");
	            }

	            payService.updateState(p_nums); // 서비스 호출
	            return ResponseEntity.ok().body("상태 업데이트 완료");
	        } catch (Exception e) {
	            e.printStackTrace(); // 오류 로그 출력
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("상태 업데이트 중 오류가 발생했습니다.");
	        }
	    }
	
	@RequestMapping("/state_return")
	public String state_return () {
		payService.state_return();
		return "redirect:/index";
	}
	@RequestMapping("/defalt0")
	@ResponseBody
	public String defalt0 () {
		payService.state_return();
		return "성공";
	}
	
	
	
	
	
	  public void onejsonWrite(Porder order, double x, double y) { 
		  JSONObject obj = new JSONObject();
	  obj.put("name", order.getUser_seq()); 
	  obj.put("order_no",	 order.getOrder_no());
	  obj.put("x", x); 
	  obj.put("y", y); 
	  try { FileWriter
	  file = new FileWriter("c:/upload/drone.json");
	  file.write(obj.toJSONString()); file.flush(); file.close(); } catch
	  (IOException e) { e.printStackTrace(); } System.out.print(obj); }
	
}
	

	

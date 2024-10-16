package com.java.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
	private int user_seq, p_num,count ;
	//			회원 고유번호, 상품 고유번호, 수량
	private String state;
	private Product product; // 상품 객체
	
}

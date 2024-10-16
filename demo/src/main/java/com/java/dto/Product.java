package com.java.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
	private Integer p_num; // 상품 고유번호
	private Integer product_category; // 상품 카테고리(의약품인지 건강기능식품인지)
	private Integer medical_category; // 의약품 카테고리
	private Integer health_category; // 건강기능식품 카테고리
	private Integer price; // 가격
	private Integer stock; // 재고(수량)
	private Integer p_count; // 판매량
	private Integer user_seq; // 약국 고유번호
	private double weight; // 무게
	private String name; // 이름
	private String company; // 제조사
	private String image; // 이미지
	private String howuse; // 사용법
	private String description; // 상품설명
	private String precautions; // 주의사항
	private String side_effects; // 부작용
	private String storage; // 보관법
	private String becareful; // 주의할 약 / 음식
	private String row_material; // 원료
	
}

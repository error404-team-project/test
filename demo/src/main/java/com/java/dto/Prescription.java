package com.java.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Prescription {
	private Integer prescription_no; // 처방전 게시글 고유번호
	private Integer user_seq; // 작성자 고유번호
	private Integer prescription_price; // 가격
	private String prescription_title; // 제목
	private String prescription_content; // 내용
	private String prescription_image; // 처방전 이미지
	private Character store_check; // 약국 확인여부
	
}

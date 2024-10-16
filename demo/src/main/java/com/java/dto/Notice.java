package com.java.dto;


import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Notice {
	private int notice_no; // 공지 고유번호
	private int user_seq; // 작성자 고유번호
	private int notice_hit; // 조회수
	private String notice_title; // 제목
	private String notice_content; // 내용
	private String notice_image; // 이미지
	private Timestamp notice_date; // 작성일
	
	private User user; // 회원 객체
	
}

package com.java.dto;


import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Event {
	private Integer event_no; // 이벤트 번호
	private Integer user_seq; // 작성자 고유번호
	private Integer event_hit; // 조회수
	private String event_title; // 제목
	private String event_content; // 내용
	private String event_image; // 이미지
	private Timestamp event_start_date; // 시작일
	private Timestamp event_end_date; // 종료일
	
	private User user; // 회원 객체
}

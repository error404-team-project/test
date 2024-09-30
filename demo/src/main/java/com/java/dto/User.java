package com.java.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
	private int user_seq;     	// 시퀀스
	private String auth_id;   	// 권한아이디
	private String user_id;   	// 회원아이디
	private String user_pw;   	// 비밀번호
	private String user_name;	// 회원/약국 이름
	private String user_email;	// 이메일
	private String user_phone;	// 전화번호
	private String user_zip;	// 우편번호
	private String user_addr;	// 주소
	private String user_gender; // 회원 성별
	private String svc_agree;	// 서비스이용약관 동의
	private String ps_agree,mkt_agree; // 마케팅동의
	private String b_license; // 사업자등록번호
	private String b_l_image; // 사업자 등록증
	private String p_license; // 약사면허증
	private String approval; // 약국 가입승인여부
	private String x; // 경도
	private String y; // 위도
	private Timestamp user_birth, user_joindate, login_date;
					//    생년월일			가입일		로그인날짜
	
	private String mailH, mailT, addr1, addr2,
			phone1, phone2, phone3, year, month, day;
	
}

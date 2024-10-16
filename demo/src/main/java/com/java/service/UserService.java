package com.java.service;

import com.java.dto.Member;
import com.java.dto.User;

public interface UserService {

	String selectId(String id); // 아이디 중복확인 ajax

	void joinOne(User user); // 회원가입 정보 DB입력하기

	User selectLogin(User user); // 입력한 아이디와 비밀번호로 로그인하기

	String findPw(String user_id, String user_email); // 비밀번호 찾기 후 메일발송

	String findId(String user_name, String user_email); // 아이디 찾기

	User userInfo(String id);
	
	void sendEmail2(Member mem);

}

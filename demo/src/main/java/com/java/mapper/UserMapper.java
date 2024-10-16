package com.java.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.User;

@Mapper
public interface UserMapper {

	String selectId(String id); // 아이디 중복확인 ajax

	void joinOne(User user); // 회원가입

	User selectLogin(User user); // 로그인

	void lastLogin(User user); // 마지막 로그인 날짜 업데이트

	User findPw(String user_id, String user_email); // 비밀번호 찾기 이메일 발송

	void updatePw(String user_id, String user_email,String pwcode); // 비밀번호 임시비밀번호로 업데이트

	String findId(String user_name, String user_email); // 아이디찾기
	

	User userInfo(String id);

}

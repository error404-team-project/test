package com.java.service;

import com.java.dto.Member;
import com.java.dto.User;

public interface UserService {

	String selectId(String id);

	void joinOne(User user);

	User selectLogin(User user);

	String findPw(String user_id, String user_email);

	String findId(String user_name, String user_email);

	User userInfo(String id);
	
	void sendEmail2(Member mem);

}

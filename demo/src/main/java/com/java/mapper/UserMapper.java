package com.java.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.User;

@Mapper
public interface UserMapper {

	String selectId(String id);

	void joinOne(User user);

	User selectLogin(User user);

	void lastLogin(User user);

	User findPw(String user_id, String user_email);

	void updatePw(String user_id, String user_email,String pwcode);

	String findId(String user_name, String user_email);
	

	User userInfo(String id);

}

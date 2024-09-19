package com.java.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.User;

@Mapper
public interface UserMapper {

	String selectId(String id);

	void joinOne(User user);

	User selectLogin(User user);

	void lastLogin(User user);

}

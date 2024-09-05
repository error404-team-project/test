package com.java.service;

import com.java.dto.User;

public interface UserService {

	String selectId(String id);

	void joinOne(User user);

	User selectLogin(User user);

}

package com.java.service;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.User;
import com.java.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	@Autowired UserMapper uMapper;
	
	
	@Override
	public String selectId(String id) {
		String uid = uMapper.selectId(id);
		return uid;
	}


	@Override
	public void joinOne(User user) {
		String user_email = user.getMailH()+"@"+user.getMailT();
		String user_phone = user.getPhone1()+"-"+user.getPhone2()+"-"+user.getPhone3();
		String user_addr = user.getAddr1()+"/"+user.getAddr2();
		String birth = user.getYear()+"-"+user.getMonth()+"-"+user.getDay()+" 00:00:00";
//		System.out.println(birth);
//		System.out.println(user_email);
//		System.out.println(user_phone);
//		System.out.println(user_addr);
		Timestamp u_birth = Timestamp.valueOf(birth);
		user.setUser_addr(user_addr);
		user.setUser_email(user_email);
		user.setUser_phone(user_phone);
		user.setUser_birth(u_birth);
		uMapper.joinOne(user);
	}


	@Override
	public User selectLogin(User user) {
		User u = uMapper.selectLogin(user);
		//System.out.println(u.getUser_id());
		return u;
	}


}

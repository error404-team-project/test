package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.java.dto.Page;
import com.java.dto.Prescription;
import com.java.dto.Product;
import com.java.dto.User;

public interface AdminService {

	void insertP(Product product);

	Product updateP(Product product);

	void deleteP(Integer p_num);

	Product updateHP(Product product);

	HashMap<String, Object> selectN(Page pageDto);

	void deleteNotice(int notice_no);

	HashMap<String, Object> allUser(Page pageDto);

	User checkApproval(int user_seq);

	void updateApproval(int user_seq);

	Prescription checkPre(int prescription_no, int prescription_price);




}

package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.java.dto.Drone;
import com.java.dto.Page;
import com.java.dto.Porder;
import com.java.dto.Prescription;
import com.java.dto.Product;
import com.java.dto.Return_table;
import com.java.dto.User;

public interface AdminService {

	void insertP(Product product); // 상품등록

	Product updateP(Product product); // 의약품 상품 재고, 가격수량변경

	void deleteP(Integer p_num); // 상품 삭제

	Product updateHP(Product product); // 건강기능식품 재고, 가격수량 변경

	HashMap<String, Object> selectN(Page pageDto); // 공지사항 리스트 불러오기

	void deleteNotice(int notice_no); // 공지사항 삭제

	HashMap<String, Object> allUser(Page pageDto); // 회원 리스트 불러오기

	User checkApproval(int user_seq); // 약국 회원가입 시 올린 파일들 확인

	void updateApproval(int user_seq); // 약국 가입승인처리

	Prescription checkPre(int prescription_no, int prescription_price); // 처방전 확인 후 고객에게 메일발송 ajax

	HashMap<String, Object> selectInquiry(Page pageDto);

	HashMap<String, Object> selectdrone();

	void updatedrone(String is_possible,String drone_id);

	void deletedrone(String drone_id);
	
	
	
	//--------------------------------------------
	void deleteU(int user_seq);

	void insertDrone(Drone drone);

	ArrayList<Porder> selectYdrone();

	Return_table selectdoreturn(String return_no);








}

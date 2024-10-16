package com.java.service;

import java.util.HashMap;
import java.util.List;

import com.java.dto.Page;
import com.java.dto.Product;

public interface ProductService {
	
	// 의약품 전체 리스트 가져오기
	HashMap<String, Object> selectMList(int medical_category, Page pageDto, String sWord, int store_seq, int sorting);

	HashMap<String, Object> mediView(int p_num); // 선택한 의약품 정보 가져오기

	void insertWish(int user_seq, int p_num); // 위시리스트 추가

	void deletetWish(int user_seq, int p_num); // 위시리스트 삭제

	void inCart(int user_seq, int p_num, int count); // 장바구니 담기

	HashMap<String, Object> seletCart(); // 장바구니에 담긴 상품정보 가져오기

	// 건강기능식품 전체 리스트 가져오기
	HashMap<String, Object> selectDlist(int health_category, Page pageDto, String sWord, int store_seq, int sorting);

	HashMap<String, Object> dailyView(int p_num); // 선택한 건강기능식품 정보 가져오기

	void updateProductQuantity(int p_num, int count);

	void deleteCartItems(List<Long> ids);

	Product selectdoreturn(String p_num);


}

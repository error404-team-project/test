package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.Cart;
import com.java.dto.Page;
import com.java.dto.Product;
import com.java.dto.Wishlist;

@Mapper
public interface ProductMapper {

	// 건강기능식품 리스트 가져오기
	ArrayList<Product> selectDList(int health_category, Page pageDto, String sWord, int store_seq, int sorting);
	// 의약품 리스트 가져오기
	ArrayList<Product> selectMList(int medical_category,Page pageDto, String sWord, int store_seq, int sorting);

	int selectMListCountAll(int medical_category, String sWord, int store_seq); // 의약품 갯수 가져오기

	int selectDListCount(int health_category, String sWord, int store_seq); // 건강기능식품 갯수 가져오기

	Product mediView(int p_num); // 선택한 의약품 정보 가져오기

	void insertWish(int user_seq, int p_num); // 위시리스트 추가

	ArrayList<Wishlist> selectWish(int user_seq, int p_num); // 선택한 상품이 위시리스트에 있는지 정보 가져오기

	void deleteWish(int user_seq, int p_num); // 위시리스트 삭제

	void inCart(int user_seq, int p_num, int count); // 장바구니 담기

	ArrayList<Cart> selectCart(int user_seq); // 로그인 한 회원의 회원번호로 장바구니 리스트 가져오기

	ArrayList<Cart> seletMyCart(int user_seq); // 회원 고유번호로 장바구니 리스트 가져오기

	Product dailyView(int p_num); // 선택한 건강기능식품 정보 가져오기 

	ArrayList<Wishlist> selectAllWish(int user_seq); // 로그인 한 회원의 위시리스트 가져오기
	
	void updateQuantity(int user_seq, int p_num, int count);

	void deleteById(Long id);

	Product selectdoreturn(String p_num);





}

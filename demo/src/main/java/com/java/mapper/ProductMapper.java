package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.Cart;
import com.java.dto.Page;
import com.java.dto.Product;
import com.java.dto.Wishlist;

@Mapper
public interface ProductMapper {


	ArrayList<Product> selectDList(int health_category, Page pageDto, String sWord, int store_seq);

	ArrayList<Product> selectMList(int medical_category,Page pageDto, String sWord, int store_seq);

	int selectMListCountAll(int medical_category, String sWord, int store_seq);

	int selectDListCount(int health_category, String sWord, int store_seq);

	Product mediView(int p_num);

	void insertWish(int user_seq, int p_num);

	ArrayList<Wishlist> selectWish(int user_seq, int p_num);

	void deleteWish(int user_seq, int p_num);

	void inCart(int user_seq, int p_num, int count);

	ArrayList<Cart> selectCart(int user_seq);

	ArrayList<Cart> seletMyCart(int user_seq);

	Product dailyView(int p_num);

	ArrayList<Wishlist> selectAllWish(int user_seq);
	
	void updateQuantity(int user_seq, int p_num, int count);

	void deleteById(Long id);





}

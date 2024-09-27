package com.java.service;

import java.util.HashMap;
import java.util.List;

import com.java.dto.Page;
import com.java.dto.Product;

public interface ProductService {

	HashMap<String, Object> selectMList(int medical_category, Page pageDto, String sWord, int store_seq);

	HashMap<String, Object> mediView(int p_num);

	void insertWish(int user_seq, int p_num);

	void deletetWish(int user_seq, int p_num);

	void inCart(int user_seq, int p_num, int count);

	HashMap<String, Object> seletCart();

	HashMap<String, Object> selectDlist(int health_category, Page pageDto, String sWord, int store_seq);

	HashMap<String, Object> dailyView(int p_num);

	void updateProductQuantity(int p_num, int count);

	void deleteCartItems(List<Long> ids);


}

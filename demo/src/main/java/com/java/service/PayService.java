package com.java.service;

import java.util.ArrayList;
import java.util.List;

import com.java.dto.Cart;
import com.java.dto.Porder;

public interface PayService {

	void orderInsert(Porder order);

	void updateState(List<Long> p_nums) throws Exception;

	ArrayList<Cart> cartview(int user_seq);

	void state_return();

	

}

package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.java.dto.Cart;
import com.java.dto.Porder;

@Mapper
public interface PayMapper {

	void orderInsert(Porder order);

	void updatestate(int p_num);

	 int updateStateByPNum(@Param("p_num") Long p_num, @Param("state") String state);

	ArrayList<Cart> cartview(int user_seq);

	void state_return();

	void deletecart(Porder order);

}

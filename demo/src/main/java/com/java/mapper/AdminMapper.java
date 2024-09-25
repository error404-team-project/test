package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.Notice;
import com.java.dto.Page;
import com.java.dto.Product;
import com.java.dto.User;

@Mapper
public interface AdminMapper {

	void insertP(Product product);

	void updateP(Product product);

	void deleteP(Integer p_num);

	ArrayList<Notice> selectN(Page pageDto);

	void deleteNotice(int notice_no);

	ArrayList<User> allUser(Page pageDto);

	int selectUListCount();

	int selectSListCount();

	ArrayList<User> storeUser(Page pageDto);

	int selectNListCount();

	ArrayList<User> NomalUser(Page npageDto);

	User checkApproval(int user_seq);

	void updateApproval(int user_seq);

	void checkPre(int prescription_no, int prescription_price);

}

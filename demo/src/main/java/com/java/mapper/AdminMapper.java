package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.Notice;
import com.java.dto.Page;
import com.java.dto.Product;

@Mapper
public interface AdminMapper {

	void insertP(Product product);

	void updateP(Product product);

	void deleteP(Integer p_num);

	ArrayList<Notice> selectN(Page pageDto);

	void deleteNotice(int notice_no);

}

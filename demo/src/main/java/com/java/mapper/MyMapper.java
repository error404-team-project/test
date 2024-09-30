package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.Inquiry;
import com.java.dto.Member;
import com.java.dto.Page;
import com.java.dto.Porder;
import com.java.dto.Return_table;

@Mapper
public interface MyMapper {

	ArrayList<Porder> selectOrder(Page pageDto, int user_seq);

	int selectListCount(int user_seq);

	Member selectone(Member mem);

	void deletemember(String user_id);

	void updateone(Member mem);

	ArrayList<Inquiry> selectInquiry(Page pageDto, int user_seq);

	int select_InquiryListCount(int user_seq);

	Inquiry selectOne_inquiry(int inquiry_no);

	Inquiry selectPrev_inquiry(int inquiry_no);

	Inquiry selectNext_inquiry(int inquiry_no);

	void insert_Inqury(Inquiry inquiry);

	void modi_inquiry(Inquiry inquiry);

	void Inquiry_deleteone(int inquiry_no);

	ArrayList<Inquiry> selectReturn(Page pageDto);	

	int select_returnListCount();

	Porder selectoneReturn(String orderNos, String order_p_nums);

	void insert_return(Return_table r1);

	




	


	







}

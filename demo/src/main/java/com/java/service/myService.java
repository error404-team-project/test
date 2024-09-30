package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.java.dto.Inquiry;
import com.java.dto.Member;
import com.java.dto.Page;
import com.java.dto.Porder;
import com.java.dto.Return_table;

public interface myService {

	HashMap<String, Object> selectOrder(Page pageDto, int user_seq);

	Member selectone(Member mem);

	void deletemember(String user_id);

	void updateone(Member mem);

	HashMap<String, Object> selectInquiry(Page pageDto, int user_seq);

	HashMap<String, Object> selectOne_inquiry(int inquiry_no, Page pageDto);

	void insert_Inqury(Inquiry inquiry);

	void modi_inquiry( Inquiry inquiry);

	void Inquiry_deleteone(int inquiry_no);

	HashMap<String, Object> select_order_return(String order_list, String order_p_num);

	void insert_return(Return_table r1);


	

	
	HashMap<String, Object> selectReturn(Page pageDto);
	 




	

	







}

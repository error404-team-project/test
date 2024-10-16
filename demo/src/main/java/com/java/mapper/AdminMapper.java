package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.Drone;
import com.java.dto.Inquiry;
import com.java.dto.Notice;
import com.java.dto.Page;
import com.java.dto.Porder;
import com.java.dto.Product;
import com.java.dto.Return_table;
import com.java.dto.User;

@Mapper
public interface AdminMapper {

	void insertP(Product product); // 상품등록

	void updateP(Product product); // 상품 재고수량, 가격 업데이트

	void deleteP(Integer p_num); // 상품 삭제

	ArrayList<Notice> selectN(Page pageDto); // 공지사항 리스트 가져오기

	void deleteNotice(int notice_no); // 공지사항 삭제

	ArrayList<User> allUser(Page pageDto); // 전체 회원리스트 가져오기

	int selectUListCount(); // 전체 회원 수

	int selectSListCount(); // 약국 회원 수

	ArrayList<User> storeUser(Page pageDto); // 약국 회원 리스트 가져오기

	int selectNListCount(); // 공지사항 게시글 수

	ArrayList<User> NomalUser(Page npageDto); // 일반회원 리스트 가져오기

	User checkApproval(int user_seq); // 가입승인 확인할 회원정보 가져오기

	void updateApproval(int user_seq); // 약국 가입승인여부 변경

	void checkPre(int prescription_no, int prescription_price); // 약국이 처방전 확인 후 가격과 약국확인여부 변경

	ArrayList<Inquiry> selectInquiry(Page pageDto); 

	ArrayList<Inquiry> selectdrone();

	void updatedrone(String is_possible,String drone_id);

	void deletedrone(String drone_id);
	

	
	//-----------------------------
	void deleteU(int user_seq);

	void insertDrone(Drone drone);

	ArrayList<Porder> selectYdrone();

	Return_table selectdoreturn(String return_no);

}

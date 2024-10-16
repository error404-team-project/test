package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.Notice;
import com.java.dto.Page;
import com.java.dto.Prescription;

@Mapper
public interface CustomerMapper {

	ArrayList<Notice> selectAllN(Page pageDto); // 공지사항 페이지 넘버링

	int selectNListCountAll(); // 공지사항 게시글 수 

	Notice selectOneN(int notice_no); // 선택한 공지사항 정보 가져오기

	Notice selectPrev(int notice_no); // 선택한 공지사항의 이전 공지 게시글 정보 가져오기 

	Notice selectNext(int notice_no); // 선택한 공지사항의 다음 공지 게시글 정보 가져오기

	void insertNotice(Notice notice); // 공지사항 작성

	void updateNotice(Notice notice); // 공지사항 수정

	void NHitUp(int notice_no); // 선택한 공지사항 조회수 증가

	void insertPrescription(Prescription pre); // 처방전 게시글 작성

	int selectPListCountAll(int user_seq, String auth_id); // 처방전 게시글 수 가져오기

	ArrayList<Prescription> selectPre(int user_seq, String auth_id, Page pageDto); // 처방전 리스트 가져오기

	Prescription selectOnePre(int prescription_no); // 선택한 처방전 게시글정보 가져오기

	void updatePre(Prescription pre); // 처방전 게시글 수정하기


}

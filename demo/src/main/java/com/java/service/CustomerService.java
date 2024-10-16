package com.java.service;

import java.util.HashMap;

import com.java.dto.Notice;
import com.java.dto.Page;
import com.java.dto.Prescription;

public interface CustomerService {

	HashMap<String, Object> selectAllN(Page pageDto); // 전체 공지사항 리스트 가져오기

	HashMap<String, Object> selectOneN(int notice_no); // 선택한 공지사항 정보 가져오기

	void insertNotice(Notice notice); // 공지사항 작성

	void updateNotice(Notice notice); // 공지사항 수정

	void insertPrescription(Prescription pre); // 처방전 게시글 작성

	HashMap<String, Object> selectMyPrescription(Page pageDto, int user_seq); // 처방전 리스트 가져오기

	Prescription selectOnePre(int prescription_no); // 처방전 게시글 보기

	void updatePre(Prescription pre); // 처방전 게시글 수정하기



}

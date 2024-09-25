package com.java.service;

import java.util.HashMap;

import com.java.dto.Notice;
import com.java.dto.Page;
import com.java.dto.Prescription;

public interface CustomerService {

	HashMap<String, Object> selectAllN(Page pageDto);

	HashMap<String, Object> selectOneN(int notice_no);

	void insertNotice(Notice notice);

	void updateNotice(Notice notice);

	void insertPrescription(Prescription pre);

	HashMap<String, Object> selectMyPrescription(Page pageDto, int user_seq);

	Prescription selectOnePre(int prescription_no);

	void updatePre(Prescription pre);



}

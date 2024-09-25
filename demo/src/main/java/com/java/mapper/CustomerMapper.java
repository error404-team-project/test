package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.Notice;
import com.java.dto.Page;
import com.java.dto.Prescription;

@Mapper
public interface CustomerMapper {

	ArrayList<Notice> selectAllN(Page pageDto);

	int selectNListCountAll();

	Notice selectOneN(int notice_no);

	Notice selectPrev(int notice_no);

	Notice selectNext(int notice_no);

	void insertNotice(Notice notice);

	void updateNotice(Notice notice);

	void NHitUp(int notice_no);

	void insertPrescription(Prescription pre);

	int selectPListCountAll(int user_seq, String auth_id);

	ArrayList<Prescription> selectPre(int user_seq, String auth_id, Page pageDto);

	Prescription selectOnePre(int prescription_no);

	void updatePre(Prescription pre);


}

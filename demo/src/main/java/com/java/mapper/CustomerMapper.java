package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.Notice;
import com.java.dto.Page;

@Mapper
public interface CustomerMapper {

	ArrayList<Notice> selectAllN(Page pageDto);

	int selectNListCountAll();

	Notice selectOneN(int notice_no);

	Notice selectPrev(int notice_no);

	Notice selectNext(int notice_no);

	void insertNotice(Notice notice);

	void updateNotice(Notice notice);

}

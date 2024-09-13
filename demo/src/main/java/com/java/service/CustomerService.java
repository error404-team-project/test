package com.java.service;

import java.util.HashMap;

import com.java.dto.Notice;
import com.java.dto.Page;

public interface CustomerService {

	HashMap<String, Object> selectAllN(Page pageDto);

	HashMap<String, Object> selectOneN(int notice_no);

	void insertNotice(Notice notice);

	void updateNotice(Notice notice);

}

package com.java.service;

import java.util.HashMap;

import com.java.dto.Event;
import com.java.dto.Page;

public interface EventService {

	HashMap<String, Object> selectAllE(Page pageDto);

	HashMap<String, Object> selectOneE(int event_no);

	HashMap<String, Object> selectAllF(Page pageDto);

	void deleteE(int event_no);

	void insertE(Event event);

	void modiE(Event event);

}

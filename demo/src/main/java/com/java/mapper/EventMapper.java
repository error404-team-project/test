package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.Event;
import com.java.dto.Page;

@Mapper
public interface EventMapper {

	int selectEListCountAll();

	int selectfListCountAll();

	ArrayList<Event> selectAllE(Page pageDto);

	Event selectOneE(int event_no);

	Event selectNextE(int event_no);

	Event selectPrevE(int event_no);

	ArrayList<Event> selectAllF(Page pageDto);

	void deleteE(int event_no);

	void insertE(Event event);

	void modiE(Event event);

}

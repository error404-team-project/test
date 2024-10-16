package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.Event;
import com.java.dto.Page;

@Mapper
public interface EventMapper {

	int selectEListCountAll(); // 진행중인 이벤트 게시글 수

	int selectfListCountAll(); // 종료된 이벤트 게시글 수

	ArrayList<Event> selectAllE(Page pageDto); // 진행중인 이벤트 리스트 가져오기

	Event selectOneE(int event_no); // 선택한 이벤트 게시글 가져오기

	Event selectNextE(int event_no); // 다음 이벤트 게시글

	Event selectPrevE(int event_no); // 이전 이벤트 게시글

	ArrayList<Event> selectAllF(Page pageDto); // 종료된 이벤트 리스트 가져오기

	void deleteE(int event_no); // 이벤트 삭제하기

	void insertE(Event event); // 이벤트 작성

	void modiE(Event event); // 이벤트 수정

	void EHitUp(int event_no); // 이벤트 조회수 증가

}

package com.java.service;

import java.util.HashMap;

import com.java.dto.Event;
import com.java.dto.Page;

public interface EventService {

	HashMap<String, Object> selectAllE(Page pageDto); // 진행중인 이벤트 리스트, 페이지넘버링 가져오기

	HashMap<String, Object> selectOneE(int event_no); // 선택한 이벤트,이전, 다음 게시글 가져오기

	HashMap<String, Object> selectAllF(Page pageDto); // 종료된 이벤트 리스트, 페이지넘버링 가져오기

	void deleteE(int event_no); // 이벤트 삭제

	void insertE(Event event); // 이벤트 등록

	void modiE(Event event); // 이벤트 수정

}

package com.java.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.Event;
import com.java.dto.Page;
import com.java.mapper.EventMapper;

@Service
public class EventServiceImpl implements EventService {

	@Autowired EventMapper eMapper;
	
	@Override // 진행중인 이벤트 리스트 가져오기
	public HashMap<String, Object> selectAllE(Page pageDto) { 
		HashMap<String, Object> map = new HashMap<>(); // 진행중인 이벤트 리스트, 페이지넘버링 담을 해쉬맵
		pageDto = ePageMethod(pageDto); // 페이지넘버링
		ArrayList<Event> elist = eMapper.selectAllE(pageDto); // 진행중인 이벤트 리스트 가져오기
		map.put("pageDto",pageDto); // 페이지넘버링 맵에 넣기
		map.put("elist",elist); // 이벤트 리스트 맵에 넣기
		return map;
	}

	@Override // 종료된 이벤트 리스트 가져오기
	public HashMap<String, Object> selectAllF(Page pageDto) {
		HashMap<String, Object> map = new HashMap<>(); // 종료된 이벤트 리스트, 페이지넘버링 담을 해쉬맵
		pageDto = fPageMethod(pageDto); // 페이지넘버링
		ArrayList<Event> flist = eMapper.selectAllF(pageDto); // 종료된 이벤트 리스트 가져오기
		map.put("flist", flist); // 이벤트 리스트 맵에 넣기
		map.put("pageDto", pageDto); // 페이지넘버링 맵에 넣기
		return map;
	}
	
	public Page ePageMethod(Page pageDto) { // 진행중인 이벤트 페이지넘버링
		// 전체 게시글 수 저장 
		pageDto.setListCount(   eMapper.selectEListCountAll()   );
		// 최대 넘버링 페이지 
		pageDto.setMaxPage( (int)Math.ceil( (double)pageDto.getListCount()/10  ));
		// 시작 넘버링페이지
		pageDto.setStartPage(  (int)((pageDto.getPage()-1)/10)*10 +1     );
		// 끝 넘버링 페이지 
		pageDto.setEndPage(  pageDto.getStartPage() + 10 - 1   );
		if(pageDto.getEndPage() > pageDto.getMaxPage()) {
			pageDto.setEndPage(pageDto.getMaxPage());
		} else	if(pageDto.getEndPage() < pageDto.getNumberingPerPage()) {
			pageDto.setNumberingPerPage(pageDto.getEndPage());
		}
		// 게시글 시작번호 
		pageDto.setStartRow( (pageDto.getPage() - 1 ) * 10 + 1   );
		// 게시글 끝나는 번호
		pageDto.setEndRow( pageDto.getStartRow() + 10 - 1 );
		return pageDto;
	}
	
	public Page fPageMethod(Page pageDto) { // 종료된 이벤트 페이지넘버링
		// 전체 게시글 수 저장 
		pageDto.setListCount(   eMapper.selectfListCountAll()   );
		// 최대 넘버링 페이지 
		pageDto.setMaxPage( (int)Math.ceil( (double)pageDto.getListCount()/10  ));
		// 시작 넘버링페이지
		pageDto.setStartPage(  (int)((pageDto.getPage()-1)/10)*10 +1     );
		// 끝 넘버링 페이지 
		pageDto.setEndPage(  pageDto.getStartPage() + 10 - 1   );
		if(pageDto.getEndPage() > pageDto.getMaxPage()) {
			pageDto.setEndPage(pageDto.getMaxPage());
		} else	if(pageDto.getEndPage() < pageDto.getNumberingPerPage()) {
			pageDto.setNumberingPerPage(pageDto.getEndPage());
		}
		// 게시글 시작번호 
		pageDto.setStartRow( (pageDto.getPage() - 1 ) * 10 + 1   );
		// 게시글 끝나는 번호
		pageDto.setEndRow( pageDto.getStartRow() + 10 - 1 );
		return pageDto;
	}

	@Override // 선택한 이벤트, 이전, 다음 이벤트 가져오기
	public HashMap<String, Object> selectOneE(int event_no) {
		HashMap<String, Object> map = new HashMap<>(); // 정보들 담을 해쉬맵
		Event eve = eMapper.selectOneE(event_no); // 선택한 이벤트
		Event next = eMapper.selectNextE(event_no); // 다음 이벤트
		Event prev = eMapper.selectPrevE(event_no); // 이전 이벤트
		eMapper.EHitUp(event_no); // 이벤트 조회수 증가
	//	System.out.println("이전게시글번호"+eve.getEvent_no());
		//System.out.println("ee"+eve.getEvent_start_date());
		Timestamp s_date = eve.getEvent_start_date(); // 선택한 이벤트 시작일 변수저장
		Timestamp e_date = eve.getEvent_end_date(); // 선택한 이벤트 종료일 변수저장
		// 사용자에게 보여지려면 String 타입으로 변환해야함
		// 변환하기위한 변수
		String start_date = "";
		String end_date = "";
		if (s_date != null) {
			// Timestamp 타입의 시작일을 날짜형식으로 포맷한 스트링타입으로 변환
		        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		        start_date = format.format(s_date);
		}
		if (e_date != null) {
			// Timestamp 타입의 종료일을 날짜형식으로 포맷한 스트링타입으로 변환
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			end_date = format.format(e_date);
		}
		//System.out.println("스트링으로 바꾼거"+end_date);
		map.put("start_date", start_date); // 선택한 이벤트 시작일 맵에 넣음
		map.put("end_date", end_date); // 선택한 이벤트 종료일 맵에 넣음
		map.put("eve", eve); // 선택한 이벤트정보 맵에 넣음
		map.put("next", next); // 다음 이벤트 정보 맵에 넣음
		map.put("prev", prev); // 이전 이벤트 정보 맵에 넣음
		return map;
	}

	@Override // 이벤트 삭제
	public void deleteE(int event_no) {
		eMapper.deleteE(event_no);
		
	}

	@Override // 이벤트 작성
	public void insertE(Event event) {
		eMapper.insertE(event);
		
	}

	@Override // 이벤트 수정
	public void modiE(Event event) {
		eMapper.modiE(event);
		
	}

}

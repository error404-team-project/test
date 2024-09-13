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
	
	@Override
	public HashMap<String, Object> selectAllE(Page pageDto) {
		HashMap<String, Object> map = new HashMap<>();
		pageDto = ePageMethod(pageDto);
		ArrayList<Event> elist = eMapper.selectAllE(pageDto);
		map.put("pageDto",pageDto);
		map.put("elist",elist);
		return map;
	}

	@Override
	public HashMap<String, Object> selectAllF(Page pageDto) {
		HashMap<String, Object> map = new HashMap<>();
		pageDto = fPageMethod(pageDto);
		ArrayList<Event> flist = eMapper.selectAllF(pageDto);
		map.put("flist", flist);
		map.put("pageDto", pageDto);
		return map;
	}
	
	public Page ePageMethod(Page pageDto) {
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
	
	public Page fPageMethod(Page pageDto) {
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

	@Override
	public HashMap<String, Object> selectOneE(int event_no) {
		HashMap<String, Object> map = new HashMap<>();
		Event eve = eMapper.selectOneE(event_no);
		Event next = eMapper.selectNextE(event_no);
		Event prev = eMapper.selectPrevE(event_no);
	//	System.out.println("이전게시글번호"+eve.getEvent_no());
		//System.out.println("ee"+eve.getEvent_start_date());
		Timestamp s_date = eve.getEvent_start_date();
		Timestamp e_date = eve.getEvent_end_date();
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
		map.put("start_date", start_date);
		map.put("end_date", end_date);
		map.put("eve", eve);
		map.put("next", next);
		map.put("prev", prev);
		return map;
	}

	@Override
	public void deleteE(int event_no) {
		eMapper.deleteE(event_no);
		
	}

	@Override
	public void insertE(Event event) {
		eMapper.insertE(event);
		
	}

	@Override
	public void modiE(Event event) {
		eMapper.modiE(event);
		
	}

}

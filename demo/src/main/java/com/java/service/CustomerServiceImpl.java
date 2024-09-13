package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.Notice;
import com.java.dto.Page;
import com.java.mapper.CustomerMapper;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired CustomerMapper cMapper;
	
	@Override
	public HashMap<String, Object> selectAllN(Page pageDto) {
		HashMap<String, Object> map = new HashMap<>();
		pageDto = nPageMethod(pageDto);
		ArrayList<Notice> nlist = cMapper.selectAllN(pageDto);
	//	System.out.println(nlist.get(0).getNotice_title());
		
		map.put("nlist", nlist);
		map.put("pageDto", pageDto);
		return map;
	}
	
	public Page nPageMethod(Page pageDto) {
		// 전체 게시글 수 저장 
		pageDto.setListCount(   cMapper.selectNListCountAll()   );
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
		
		
		
//		System.out.println(pageDto.getStartPage());
//		System.out.println(pageDto.getEndPage());
//		System.out.println(pageDto.getMaxPage());
		return pageDto;
	}

	@Override
	public HashMap<String, Object> selectOneN(int notice_no) {
		HashMap<String, Object> map = new HashMap<>();
		Notice n = cMapper.selectOneN(notice_no);
		Notice prev = cMapper.selectPrev(notice_no);
		Notice next = cMapper.selectNext(notice_no);
	//	System.out.println("ㅁㅁ"+n.getNotice_title());
	//	System.out.println("ㅁㅁ"+prev.getNotice_title());
	//	System.out.println("ㅁㅁ"+next.getNotice_title());
		map.put("n", n);
		map.put("prev", prev);
		map.put("next", next);
		return map;
	}

	@Override
	public void insertNotice(Notice notice) {
		cMapper.insertNotice(notice);
		
	}

	@Override
	public void updateNotice(Notice notice) {
		cMapper.updateNotice(notice);
		
	}

	
	
}

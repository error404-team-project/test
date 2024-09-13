package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.Event;
import com.java.dto.Notice;
import com.java.dto.Page;
import com.java.dto.Product;
import com.java.mapper.AdminMapper;
import com.java.mapper.ProductMapper;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired AdminMapper adMapper;
	@Autowired ProductMapper pMapper;
	@Autowired CustomerServiceImpl cserviceImpl;

	@Override
	public void insertP(Product product) {
		System.out.println("서비스임플");
		adMapper.insertP(product);
	}

	@Override
	public Product updateP(Product product) {
		adMapper.updateP(product);
		Product pr = pMapper.mediView(product.getP_num());
		return pr;
	}
	@Override
	public Product updateHP(Product product) {
		adMapper.updateP(product);
		Product pr = pMapper.dailyView(product.getP_num());
		return pr;
	}

	@Override
	public void deleteP(Integer p_num) {
		adMapper.deleteP(p_num);
	}

	@Override
	public HashMap<String, Object> selectN(Page pageDto) {
		HashMap<String, Object> map = new HashMap<>();
		pageDto = cserviceImpl.nPageMethod(pageDto);
		ArrayList<Notice> nlist = adMapper.selectN(pageDto);
		System.out.println("페이지 "+pageDto.getPage());
		System.out.println("시작게시글 "+pageDto.getStartRow());
		System.out.println("끝게시글 "+pageDto.getEndRow());
		System.out.println(nlist.get(0).getNotice_title());
		
		map.put("nlist", nlist);
		map.put("pageDto", pageDto);
		return map;
	}

	@Override
	public void deleteNotice(int notice_no) {
		adMapper.deleteNotice(notice_no);
		
	}




	
	
}

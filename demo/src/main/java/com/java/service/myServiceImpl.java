package com.java.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.Inquiry;
import com.java.dto.Member;
import com.java.dto.Page;
import com.java.dto.Porder;
import com.java.dto.Return_table;
import com.java.mapper.MyMapper;

@Service
public class myServiceImpl implements myService {

	@Autowired
	MyMapper mymapper;

	@Override
	public HashMap<String, Object> selectOrder(Page pageDto, int user_seq) {
		
		pageDto = pageMethod(pageDto,user_seq);
		
		HashMap<String, Object> ordermap = new HashMap<>();
		ArrayList<Porder> orderlist = mymapper.selectOrder(pageDto,user_seq);
		
		ordermap.put("list", orderlist);
		ordermap.put("pageDto", pageDto);
	//	System.out.println(pageDto.getStartRow());
	//	System.out.println(orderlist.get(0).getOrder_no());
		
		return ordermap;
	}
	
	private Page pageMethod(Page pageDto, int user_seq) {
		// 전체 게시글 수 저장 
		pageDto.setListCount(   mymapper.selectListCount(user_seq)   );
		// 최대 넘버링 페이지 
		pageDto.setMaxPage( (int)Math.ceil( (double)pageDto.getListCount()/10  ));
		// 시작 넘버링페이지
		pageDto.setStartPage(  (int)((pageDto.getPage()-1)/10)*10 +1     );
		// 끝 넘버링 페이지 
		pageDto.setEndPage(  pageDto.getStartPage() + 10 - 1   );
		// 게시글 시작번호 
		pageDto.setStartRow( (pageDto.getPage() - 1 ) * 10 + 1   );
		// 게시글 끝나는 번호
		pageDto.setEndRow( pageDto.getStartRow() + 10 - 1 );
		
	
		return pageDto;
	}

	@Override
	public Member selectone(Member mem) {
	Member member = mymapper.selectone(mem);
		return member;
	}

	@Override
	public void deletemember(String user_id) {
		mymapper.deletemember(user_id);
		
	}

	@Override
	public void updateone(Member mem) {
		mymapper.updateone(mem);
		
	}

	@Override
	public HashMap<String, Object> selectInquiry(Page pageDto,int user_seq) {
		
		pageDto = pageMethod1(pageDto,user_seq);
		
		HashMap<String, Object> InquiryMap = new HashMap<>();
		ArrayList<Inquiry> Inquirylist = mymapper.selectInquiry(pageDto,user_seq);
		
		InquiryMap.put("list", Inquirylist);
		InquiryMap.put("pageDto", pageDto);
		return InquiryMap;
	}
	private Page pageMethod1(Page pageDto, int user_seq) {
		// 전체 게시글 수 저장 
		pageDto.setListCount(   mymapper.select_InquiryListCount(user_seq)   );
		// 최대 넘버링 페이지 
		pageDto.setMaxPage( (int)Math.ceil( (double)pageDto.getListCount()/10  ));
		// 시작 넘버링페이지
		pageDto.setStartPage(  (int)((pageDto.getPage()-1)/10)*10 +1     );
		// 끝 넘버링 페이지 
		pageDto.setEndPage(  pageDto.getStartPage() + 10 - 1   );
		// 게시글 시작번호 
		pageDto.setStartRow( (pageDto.getPage() - 1 ) * 10 + 1   );
		// 게시글 끝나는 번호
		pageDto.setEndRow( pageDto.getStartRow() + 10 - 1 );
		
	
		return pageDto;
	}

	@Override
	public HashMap<String, Object> selectOne_inquiry(int inquiry_no, Page pageDto) {
			HashMap<String, Object> Imap = new HashMap<>();
			
			Inquiry inquiry = mymapper.selectOne_inquiry(inquiry_no);
			Inquiry prev = mymapper.selectPrev_inquiry(inquiry_no);
			Inquiry next = mymapper.selectNext_inquiry(inquiry_no);
			
			Imap.put("inquiry", inquiry);
			Imap.put("prev", prev);
			Imap.put("next", next);
			return Imap;
	}

	@Override
	public void insert_Inqury(Inquiry inquiry) {
//		System.out.println("");
		mymapper.insert_Inqury(inquiry);
	}

	@Override
	public void modi_inquiry(Inquiry inquiry) {
	//	System.out.println(inquiry.getInquiry_title());
	//	System.out.println(inquiry.getInquiry_image());
	//	System.out.println(inquiry.getInquiry_content());
	//	System.out.println(inquiry.getInquiry_category());
		 mymapper.modi_inquiry(inquiry);
		
	}

	@Override
	public void Inquiry_deleteone(int inquiry_no) {
		mymapper.Inquiry_deleteone(inquiry_no);
		
	}

	@Override
	public HashMap<String, Object> select_order_return(String order_list, String order_p_num) {
		
		 HashMap<String, Object> map = new HashMap<>();	 
		 //System.out.println(order_list);
		 //System.out.println(order_p_num);	
		  String[] orderNos =
		  order_list.split("/"); String[] order_p_nums = order_p_num.split("/");
	
		  //System.out.println(Arrays.toString(orderNos));
		  //System.out.println(Arrays.toString(order_p_nums));
		  
		  ArrayList<Porder> orderlist = new ArrayList<>();
		  
		  for(int i=0; i<orderNos.length; i++) {
			  Porder p1  =  mymapper.selectoneReturn(orderNos[i],order_p_nums[i]);
			  
			  orderlist.add(p1);		  
		  }
		  
		  for(int i=0; i<orderNos.length; i++) {		  
			  System.out.println(orderlist.get(i).toString());	  
		  }
		  
		  map.put("list", orderlist);
		  
		return map;
	}

	@Override
	public void insert_return(Return_table r1) {
		
		mymapper.insert_return(r1);
	}

	



	

	
	  @Override 
	  public HashMap<String, Object> selectReturn(Page pageDto) {
	  
	  pageDto = pageMethod2(pageDto);
	  
	  HashMap<String, Object> ReturnMap = new HashMap<>(); 
	  ArrayList<Inquiry> Returnlist = mymapper.selectReturn(pageDto);
	  
	  ReturnMap.put("list", Returnlist); ReturnMap.put("pageDto", pageDto);
	  
	  return ReturnMap; 
	  } 
	  
	  private Page pageMethod2(Page pageDto) { // 전체 게시글 수 저장
	  pageDto.setListCount( mymapper.select_returnListCount() ); // 최대 넘버링 페이지
	  pageDto.setMaxPage( (int)Math.ceil( (double)pageDto.getListCount()/10 )); // 시작 넘버링페이지
	  pageDto.setStartPage( (int)((pageDto.getPage()-1)/10)*10 +1 ); // 끝넘버링 페이지 
	  pageDto.setEndPage( pageDto.getStartPage() + 10 - 1 ); // 게시글 시작번호
	  pageDto.setStartRow( (pageDto.getPage() - 1 ) * 10 + 1 ); // 게시글 끝나는 번호
	  pageDto.setEndRow( pageDto.getStartRow() + 10 - 1 );
	  return pageDto; 
	  }
	 
	





	

	

	

	


}

package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.Cart;
import com.java.dto.Page;
import com.java.dto.Product;
import com.java.dto.Wishlist;
import com.java.mapper.ProductMapper;

import jakarta.servlet.http.HttpSession;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired ProductMapper pMapper;
	@Autowired HttpSession session;

	// 의약품
	@Override
	public HashMap<String, Object> selectMList(int medical_category,Page pageDto, String sWord,int store_seq,int sorting) {
	//	System.out.println("카테고리"+ medical_category);
		HashMap<String, Object> map = new HashMap<>();
		int user_seq;
		if(session.getAttribute("sessionSeq") == null) {
			user_seq = 0;
			map.put("user_seq", user_seq);
		} else {
			user_seq = (int) session.getAttribute("sessionSeq");
			map.put("user_seq", user_seq);
		}
		pageDto = mPageMethod(pageDto,medical_category,sWord,store_seq);
		ArrayList<Product> mCList = pMapper.selectMList(medical_category,pageDto,sWord,store_seq,sorting);
		ArrayList<Wishlist> wList = pMapper.selectAllWish(user_seq);
		System.out.println("검색된 단어"+sWord);
	//	System.out.println("엔드페이지"+pageDto.getEndPage());
	//	System.out.println("맥스페이지"+pageDto.getMaxPage());
	//	System.out.println("리스트카운트"+pageDto.getListCount());
		map.put("mCList", mCList);
		map.put("wList", wList);
		map.put("pageDto", pageDto);
		map.put("medical_category", medical_category);
		map.put("sWord", sWord);
		
		return map;
	}
	
	@Override
	public HashMap<String,Object> mediView(int p_num) {
		int user_seq;
		if(session.getAttribute("sessionSeq") == null) {
			user_seq = 0;
		} else {
			user_seq = (int) session.getAttribute("sessionSeq");
		}
		int wp_num = 0;
		//System.out.println("회원번호"+user_seq);
		HashMap<String,Object> map = new HashMap<>();
		Product medi = pMapper.mediView(p_num);
		ArrayList<Wishlist> wish = pMapper.selectWish(user_seq,p_num);
		for(int i = 0; i<wish.size(); i++) {
			// 한 회원이 위시리스트에 여러개 담았을 경우
			// 현재 상품페이지의 p_num과 일치하면 wp_num에 값 넣기
			if(wish.get(i).getP_num() == p_num) {
				wp_num = wish.get(i).getP_num();
			}
		}
		int cp_num = 0;
		ArrayList<Cart> cart = pMapper.selectCart(user_seq);
		for(int i = 0; i<cart.size(); i++) {
			// 한 회원이 장바구니에 여러개 담았을 경우
			if(cart.get(i).getP_num() == p_num) {
				cp_num = cart.get(i).getP_num();
			}
		}
	//	System.out.println(wp_num);
	//	System.out.println("가져온 위시리스트"+wish.get(0).getP_num() +", "+wish.get(0).getUser_seq());
		map.put("medi", medi);
		map.put("wp_num", wp_num);
		map.put("cp_num", cp_num);
	//	System.out.println(medi.getName());
		return map;
	} // mediView
	
	@Override
	public HashMap<String, Object> dailyView(int p_num) {
		int user_seq;
		if(session.getAttribute("sessionSeq") == null) {
			user_seq = 0;
		} else {
			user_seq = (int) session.getAttribute("sessionSeq");
		}
		int wp_num = 0;
		//System.out.println("회원번호"+user_seq);
		HashMap<String,Object> map = new HashMap<>();
		Product daily = pMapper.dailyView(p_num);
		ArrayList<Wishlist> wish = pMapper.selectWish(user_seq,p_num);
		for(int i = 0; i<wish.size(); i++) {
			// 한 회원이 위시리스트에 여러개 담았을 경우
			// 현재 상품페이지의 p_num과 일치하면 wp_num에 값 넣기
			if(wish.get(i).getP_num() == p_num) {
				wp_num = wish.get(i).getP_num();
			}
		}
		int cp_num = 0;
		ArrayList<Cart> cart = pMapper.selectCart(user_seq);
		for(int i = 0; i<cart.size(); i++) {
			// 한 회원이 장바구니에 여러개 담았을 경우
			if(cart.get(i).getP_num() == p_num) {
				cp_num = cart.get(i).getP_num();
			}
		}
		
		map.put("daily", daily);
		map.put("wp_num", wp_num);
		map.put("cp_num", cp_num);
		return map;
	}
	
	@Override
	public void insertWish(int user_seq, int p_num) {
	//	System.out.println("회원일련번호"+user_seq);
	//	System.out.println("제품고유번호"+p_num);
		pMapper.insertWish(user_seq,p_num);
	}
	
	@Override
	public void deletetWish(int user_seq, int p_num) {
	//	System.out.println("회원일련번호"+user_seq);
	//	System.out.println("회원일련번호"+p_num);
		pMapper.deleteWish(user_seq,p_num);
	}
	
	@Override
	public void inCart(int user_seq, int p_num, int count) {
	//	System.out.println(user_seq+", "+p_num+", "+count);
		pMapper.inCart(user_seq,p_num,count);
	}
	
	public Page mPageMethod(Page pageDto, int medical_category, String sWord, int store_seq) {
		// 전체 게시글 수 저장 
		pageDto.setListCount(   pMapper.selectMListCountAll(medical_category,sWord,store_seq)   );
		// 최대 넘버링 페이지 
		pageDto.setMaxPage( (int)Math.ceil( (double)pageDto.getListCount()/15  ));
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
		pageDto.setStartRow( (pageDto.getPage() - 1 ) * 15 + 1   );
		// 게시글 끝나는 번호
		pageDto.setEndRow( pageDto.getStartRow() + 15 - 1 );
		
		
		
//		System.out.println(pageDto.getStartPage());
//		System.out.println(pageDto.getEndPage());
//		System.out.println(pageDto.getMaxPage());
		return pageDto;
	}
	
	@Override
	public HashMap<String, Object> selectDlist(int health_category, Page pageDto, String sWord,int store_seq,int sorting) {
		HashMap<String,Object> map = new HashMap<>();
		int user_seq;
		if(session.getAttribute("sessionSeq") == null) {
			user_seq = 0;
		} else {
			user_seq = (int) session.getAttribute("sessionSeq");
		}
		pageDto = dPageMethod(pageDto,health_category,sWord, store_seq);
		ArrayList<Product> mDList = pMapper.selectDList(health_category,pageDto,sWord, store_seq,sorting);
		ArrayList<Wishlist> wList = pMapper.selectAllWish(user_seq);
		map.put("mDList", mDList);
		map.put("wList", wList);
		map.put("pageDto", pageDto);
		map.put("user_seq", user_seq);
		map.put("health_category", health_category);
		return map;
	}
	
	public Page dPageMethod(Page pageDto,int health_category,String sWord, int store_seq) {
		// 전체 게시글 수 저장 
		pageDto.setListCount(   pMapper.selectDListCount(health_category,sWord,store_seq)   );
		// 최대 넘버링 페이지 
		pageDto.setMaxPage( (int)Math.ceil( (double)pageDto.getListCount()/15  ));
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
		pageDto.setStartRow( (pageDto.getPage() - 1 ) * 15 + 1   );
		// 게시글 끝나는 번호
		pageDto.setEndRow( pageDto.getStartRow() + 15 - 1 );
		
//		System.out.println(pageDto.getStartPage());
//		System.out.println(pageDto.getEndPage());
//		System.out.println(pageDto.getMaxPage());
		return pageDto;
	}

	@Override
	public HashMap<String, Object> seletCart() {
		HashMap<String, Object> map = new HashMap<>();
		int user_seq;
		if(session.getAttribute("sessionSeq") == null) {
			user_seq = 0;
		} else {
			user_seq = (int) session.getAttribute("sessionSeq");
		}
		ArrayList<Cart> list = pMapper.seletMyCart(user_seq);
	//	System.out.println(list.get(0).getUser_seq());
		map.put("list", list);
		map.put("user_seq", user_seq);
		return map;
	}

	@Override
	public void updateProductQuantity(int p_num, int count) {
		System.out.println(count);
		int user_seq;
		if(session.getAttribute("sessionSeq") == null) {
			user_seq = 0;
		} else {
			user_seq = (int) session.getAttribute("sessionSeq");
		}
	     // 데이터베이스에서 상품 수량 업데이트 로직
		pMapper.updateQuantity(user_seq,p_num, count);
	}

	@Override
	public void deleteCartItems(List<Long> ids) {
		 for (Long id : ids) {
			 pMapper.deleteById(id); // 매퍼를 통해 데이터베이스에서 삭제
	        }
	}





	
}

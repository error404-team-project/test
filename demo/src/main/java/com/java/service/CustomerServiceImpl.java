package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.Notice;
import com.java.dto.Page;
import com.java.dto.Prescription;
import com.java.dto.User;
import com.java.mapper.AdminMapper;
import com.java.mapper.CustomerMapper;

import jakarta.servlet.http.HttpSession;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired CustomerMapper cMapper;
	@Autowired AdminMapper adMapper;
	@Autowired HttpSession session;
	
	@Override // 공지사항 리스트 가져오기
	public HashMap<String, Object> selectAllN(Page pageDto) { 
		HashMap<String, Object> map = new HashMap<>(); // 공지사항 리스트, 페이지넘버링 담을 Hash Map
		pageDto = nPageMethod(pageDto); // 페이지넘버링
		ArrayList<Notice> nlist = cMapper.selectAllN(pageDto); // 공지사항 리스트
	//	System.out.println(nlist.get(0).getNotice_title());
		
		map.put("nlist", nlist); // 공지리스트 맵에 넣기
		map.put("pageDto", pageDto); // 페이지넘버링 맵에 넣기
		return map;
	}
	
	public Page nPageMethod(Page pageDto) { // 공지사항 페이지넘버링
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

	@Override // 볼 공지사항 정보,이전, 다음 공지사항 가져오기
	public HashMap<String, Object> selectOneN(int notice_no) {
		HashMap<String, Object> map = new HashMap<>(); // 선택한 공지사항, 이전, 다음 공지사항 정보 담을 Hash Map
		Notice n = cMapper.selectOneN(notice_no); // 선택한 공지사항 정보 가져오기
		Notice prev = cMapper.selectPrev(notice_no); // 이전 공지사항 정보 가져오기
		Notice next = cMapper.selectNext(notice_no); // 다음 공지사항 정보 가져오기
		cMapper.NHitUp(notice_no); 					// 선택한 공지사항 조회수 증가
	//	System.out.println("ㅁㅁ"+n.getNotice_title());
	//	System.out.println("ㅁㅁ"+prev.getNotice_title());
	//	System.out.println("ㅁㅁ"+next.getNotice_title());
		map.put("n", n); // 선택한 공지사항 맵에 넣기
		map.put("prev", prev); // 이전 공지사항 맵에 넣기
		map.put("next", next); // 다음 공지사항 맵에 넣기
		return map;
	}

	@Override // 공지사항 작성
	public void insertNotice(Notice notice) { 
		cMapper.insertNotice(notice);
	}

	@Override // 공지사항 수정
	public void updateNotice(Notice notice) {
		cMapper.updateNotice(notice);
		
	}

	@Override // 처방전 게시글 작성
	public void insertPrescription(Prescription pre) {
		User user = adMapper.checkApproval(pre.getUser_seq()); // 작성자 정보 가져오기
		String title =user.getUser_name()+" / "+user.getUser_addr()+" 처방전입니다."; // 이름 / 주소 처방전입니다 로 제목설정
		pre.setPrescription_title(title); // 설정한 제목 넣기
		cMapper.insertPrescription(pre); // 처방전 게시글 작성하기
	}

	@Override // 처방전 리스트 가져오기
	public HashMap<String, Object> selectMyPrescription(Page pageDto, int user_seq) {
		HashMap<String, Object> map = new HashMap<>(); // 처방전 리스트, 페이지넘버링 담을 Hash Map
		String auth_id = (String) session.getAttribute("sessionAuth"); // 로그인 한 사람의 권한아이디
		pageDto = pPageMethod(pageDto,user_seq,auth_id); // 처방전 리스트 페이지 넘버링
		ArrayList<Prescription> list = cMapper.selectPre(user_seq,auth_id,pageDto); // 처방전 리스트 가져오기
		map.put("pageDto", pageDto); // 페이지 넘버링 맵에 넣기
		map.put("list", list); // 처방전 리스트 맵에 넣기
		return map;
	}

	// 처방전 리스트 페이지 넘버링
	private Page pPageMethod(Page pageDto, int user_seq, String auth_id) {
		// 전체 게시글 수 저장 
		pageDto.setListCount(   cMapper.selectPListCountAll(user_seq,auth_id)   );
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

	@Override // 선택한 처방전 정보 가져오기
	public Prescription selectOnePre(int prescription_no) {
		Prescription pre = cMapper.selectOnePre(prescription_no); // 선택한 처방전 정보 가져오기
		return pre;
	}

	@Override // 처방전 게시글 업데이트하기
	public void updatePre(Prescription pre) {
		cMapper.updatePre(pre);
		
	}


	
	
}

package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.java.dto.Drone;
import com.java.dto.Inquiry;
import com.java.dto.Notice;
import com.java.dto.Page;
import com.java.dto.Porder;
import com.java.dto.Prescription;
import com.java.dto.Product;
import com.java.dto.Return_table;
import com.java.dto.User;
import com.java.mapper.AdminMapper;
import com.java.mapper.CustomerMapper;
import com.java.mapper.ProductMapper;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired AdminMapper adMapper;
	@Autowired ProductMapper pMapper;
	@Autowired CustomerMapper cMapper;
	@Autowired CustomerServiceImpl cserviceImpl;
	@Autowired JavaMailSender mailSender;

	@Override
	public void insertP(Product product) { // 상품등록
		System.out.println("서비스임플");
		adMapper.insertP(product); // mapper로 연결
	}

	@Override
	public Product updateP(Product product) { // 의약품 가격, 재고수량 업데이트 ajax
		adMapper.updateP(product); // mapper로 연결
		Product pr = pMapper.mediView(product.getP_num()); // 업데이트할 상품 정보 가져오기
		return pr;
	}
	@Override
	public Product updateHP(Product product) { // 건강기능식품 가격, 재고수량 업데이트 ajax
		adMapper.updateP(product); // mapper로 연결
		Product pr = pMapper.dailyView(product.getP_num()); // 업데이트 할 상품 정보 가져오기
		return pr;
	}

	@Override
	public void deleteP(Integer p_num) { // 상품 삭제
		adMapper.deleteP(p_num); // mapper로 연결
	}

	@Override
	public HashMap<String, Object> selectN(Page pageDto) { // 공지사항 가져오기
		HashMap<String, Object> map = new HashMap<>(); // 공지사항 정보들 저장할 Hash Map
		pageDto = cserviceImpl.nPageMethod(pageDto); // 공지사항 페이지설정
		ArrayList<Notice> nlist = adMapper.selectN(pageDto); // 공지사항 가져오기
		System.out.println("페이지 "+pageDto.getPage());
		System.out.println("시작게시글 "+pageDto.getStartRow());
		System.out.println("끝게시글 "+pageDto.getEndRow());
		System.out.println(nlist.get(0).getNotice_title());
		
		map.put("nlist", nlist); // 공지사항 리스트 맵에 넣기
		map.put("pageDto", pageDto); // 공지사항 페이지정보 맵에 넣기
		return map;
	}

	@Override
	public void deleteNotice(int notice_no) { // 공지사항 삭제
		adMapper.deleteNotice(notice_no); // mapper로 연결
		
	}

	@Override
	public HashMap<String, Object> allUser(Page pageDto) { // 회원정보 가져오기
		HashMap<String, Object> map = new HashMap<>(); // 회원정보들 담을 Hash Map
		Page upageDto = uPageMethod(pageDto);						// 전체 회원 페이지 넘버링
		Page spageDto = sPageMethod(pageDto); 						// 약국 회원 페이지 넘버링
		Page npageDto = nPageMethod(pageDto); 						// 일반 회원 페이지 넘버링
		ArrayList<User> uList = adMapper.allUser(upageDto); 		// 전체 회원
		ArrayList<User> sList = adMapper.storeUser(spageDto); 		// 약국 회원
		ArrayList<User> nList = adMapper.NomalUser(npageDto); 		// 일반 회원
		map.put("upageDto", upageDto);								// 전체 회원 페이지정보 맵에 넣기
		map.put("spageDto", spageDto);								// 약국 회원 페이지정보 맵에 넣기
		map.put("npageDto", npageDto);								// 일반회원 페이지정보 맵에 넣기
		map.put("uList", uList);									// 전체 회원리스트 맵에 넣기
		map.put("sList", sList);									// 약국 회원리스트 맵에 넣기
		map.put("nList", nList);									// 일반회원 리스트 맵에 넣기
		return map;
	}

	public Page uPageMethod(Page pageDto) { // 전체 회원 페이지 넘버링
		// 전체 회원 수 저장 
		pageDto.setListCount(   adMapper.selectUListCount()   );
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
	
	public Page sPageMethod(Page pageDto) { // 약국 회원 페이지 넘버링
		// 약국 회원 수 저장 
		pageDto.setListCount(   adMapper.selectSListCount()   );
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

	public Page nPageMethod(Page pageDto) { // 일반회원 페이지 넘버링
		// 일반회원 수 저장 
		pageDto.setListCount(   adMapper.selectNListCount()   );
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
	public User checkApproval(int user_seq) {
		User user = adMapper.checkApproval(user_seq); // 회원seq로 한명 정보 전체 가져오기
		//System.out.println(user.getUser_name());
		return user;
	}

	
////////////////////////////////////가입승인 메일 ////////////////////////////////
	@Override
	public void updateApproval(int user_seq) { // 약국회원 가입승인
		adMapper.updateApproval(user_seq);     // 가입승인여부 업데이트
		User user = adMapper.checkApproval(user_seq); // 가입승인 메일 보낼 회원 정보 가져오기
		sendEmail(user);
	}

	private void sendEmail(User user) { // 메일보내기
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(user.getUser_email()); // -에게
		message.setFrom("Medison@medison.com"); // -로부터
		message.setSubject("[Medison.] "+user.getUser_name()+"님에게 Medison. 가입승인 안내드립니다"); // 제목
		message.setText("안녕하세요 Medison입니다.\n"+
			"["+user.getUser_name()+"]님의 \n"
					+ "회원가입 승인이 완료되어 메일 보내드립니다.\n" 
					+ "본 이메일은 발신 전용 이메일이므로 수신 불가합니다."
					);
		mailSender.send(message);
		System.out.println("메일이 발송되었습니다.");
	}
////////////////////////////////////가입승인 메일 ////////////////////////////////
////////////////////////////////처방전 결제확인 메일 //////////////////////////////
	@Override
	public Prescription checkPre(int prescription_no, int prescription_price) { // 처방전 결제확인 메일
		adMapper.checkPre(prescription_no,prescription_price); // 처방전의 약국 확인여부 Y로 업데이트
		Prescription pre = cMapper.selectOnePre(prescription_no); // 해당 처방전 정보 가져오기
		User user = adMapper.checkApproval(pre.getUser_seq()); // 처방전 작성자 정보 가져오기
		sendPEmail(user); // 메일발송
		return pre;
	}
	
	private void sendPEmail(User user) { // 처방전 결제확인 메일발송
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(user.getUser_email()); // -에게
		message.setFrom("Medison@medison.com"); // -로부터
		message.setSubject("[Medison.] "+user.getUser_name()+"님에게 Medison. 결제확인 안내드립니다"); // 제목
		message.setText("안녕하세요 Medison입니다.\n"+
			"["+user.getUser_name()+"]님께서 올리신 \n"
					+ "처방전 확인이 완료되어 결제확인 메일 보내드립니다.\n"
					+ "사이트에 방문해주시어 결제완료 해주시면 최대한 빠르게 해당 약품을 배송해드리겠습니다.\n" 
					+ "본 이메일은 발신 전용 이메일이므로 수신 불가합니다."
					);
		mailSender.send(message);
		System.out.println("메일이 발송되었습니다.");
	}

	@Override
	public HashMap<String, Object> selectInquiry(Page pageDto) {
		HashMap<String, Object> map = new HashMap<>();
		pageDto = PageMethod5(pageDto);
		ArrayList<Inquiry> list = adMapper.selectInquiry(pageDto);
	
		map.put("list", list);
		map.put("pageDto", pageDto);
		return map;
	}
	
	public Page PageMethod5(Page pageDto) {
		// 전체 게시글 수 저장 
		pageDto.setListCount(   adMapper.selectNListCount()   );
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
	public HashMap<String, Object> selectdrone() {

		HashMap<String, Object> dronemap = new HashMap<>();
	
		ArrayList<Inquiry> list = adMapper.selectdrone();
		dronemap.put("list", list);
		return dronemap;
	}

	@Override
	public void updatedrone(String is_possible,String drone_id) {
		adMapper.updatedrone(is_possible,drone_id);
		
	}

	@Override
	public void deletedrone(String drone_id) {
		
		adMapper.deletedrone(drone_id);
	}
	
	//-----------------------------------------------------------
	@Override
	public void deleteU(int user_seq) {
		adMapper.deleteU(user_seq);
		
	}

	@Override
	public void insertDrone(Drone drone) {
		adMapper.insertDrone(drone);
	}

	@Override
	public ArrayList<Porder> selectYdrone() {
		  ArrayList<Porder> dronelist = adMapper.selectYdrone();
		return dronelist;
	}

	@Override
	public Return_table selectdoreturn(String return_no) {
		Return_table re =  adMapper.selectdoreturn(return_no);
		return re;
	}
	
}

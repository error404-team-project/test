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

	@Override
	public HashMap<String, Object> allUser(Page pageDto) {
		HashMap<String, Object> map = new HashMap<>();
		Page upageDto = uPageMethod(pageDto);						// 전체 회원 페이지 넘버링
		Page spageDto = sPageMethod(pageDto); 						// 사업자 회원 페이지 넘버링
		Page npageDto = nPageMethod(pageDto); 						// 일반 회원 페이지 넘버링
		ArrayList<User> uList = adMapper.allUser(upageDto); 		// 전체 회원
		ArrayList<User> sList = adMapper.storeUser(spageDto); 		// 사업자 회원
		ArrayList<User> nList = adMapper.NomalUser(npageDto); 		// 일반 회원
		map.put("upageDto", upageDto);
		map.put("spageDto", spageDto);
		map.put("npageDto", npageDto);
		map.put("uList", uList);
		map.put("sList", sList);
		map.put("nList", nList);
		return map;
	}

	public Page uPageMethod(Page pageDto) {
		// 전체 게시글 수 저장 
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
	
	public Page sPageMethod(Page pageDto) {
		// 전체 게시글 수 저장 
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

	public Page nPageMethod(Page pageDto) {
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
	public User checkApproval(int user_seq) {
		User user = adMapper.checkApproval(user_seq);
		// 회원seq로 한명 정보 전체 가져오기
		//System.out.println(user.getUser_name());
		return user;
	}

	
////////////////////////////////////가입승인 메일 ////////////////////////////////
	@Override
	public void updateApproval(int user_seq) {
		adMapper.updateApproval(user_seq);
		User user = adMapper.checkApproval(user_seq);
		sendEmail(user);
	}

	private void sendEmail(User user) {
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
	public Prescription checkPre(int prescription_no, int prescription_price) {
		adMapper.checkPre(prescription_no,prescription_price);
		Prescription pre = cMapper.selectOnePre(prescription_no);
		User user = adMapper.checkApproval(pre.getUser_seq());
		sendPEmail(user);
		return pre;
	}
	
	private void sendPEmail(User user) {
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

package com.java.service;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.java.dto.Member;
import com.java.dto.User;
import com.java.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	@Autowired UserMapper uMapper;
	@Autowired JavaMailSender mailSender;
	
	
	
	

	@Override
	public User userInfo(String id) {
		User user =uMapper.userInfo(id);
		/*
		 * String user_addr = user.getUser_addr(); String[] addrParts =
		 * user_addr.split("/"); user.setAddr1(addrParts[0]);
		 * user.setAddr2(addrParts[1]);
		 * 
		 * String user_phone =user.getUser_phone(); String[] phoneParts =
		 * user_phone.split("-"); user.setPhone1(phoneParts[0]);
		 * user.setPhone2(phoneParts[1]); user.setPhone3(phoneParts[2]);
		 * 
		 * 
		 */
		
		System.out.println(user.getUser_seq());
		return user;
	}
		
	///////////////////////////////////////////////////////////////////////////
	@Override
	public String selectId(String id) {
		String uid = uMapper.selectId(id);
		return uid;
	}

	@Override
	public void joinOne(User user) {
		String user_email = user.getMailH()+"@"+user.getMailT();
		String user_phone = user.getPhone1()+"-"+user.getPhone2()+"-"+user.getPhone3();
		String user_addr = user.getAddr1()+"/"+user.getAddr2();
		String birth = user.getYear()+"-"+user.getMonth()+"-"+user.getDay()+" 00:00:00";
//		System.out.println(birth);
//		System.out.println(user_email);
//		System.out.println(user_phone);
//		System.out.println(user_addr);
		if(user.getAuth_id().equals("user")) {
			Timestamp u_birth = Timestamp.valueOf(birth);
			user.setUser_birth(u_birth);
		}
		user.setUser_addr(user_addr);
		user.setUser_email(user_email);
		user.setUser_phone(user_phone);
		System.out.println("서비스임플"+user.getAuth_id());
		uMapper.joinOne(user);
	}


	@Override
	public User selectLogin(User user) {
		User u = uMapper.selectLogin(user);
		if(u != null) {
			uMapper.lastLogin(user);
		}
		//System.out.println(u.getUser_id());
		return u;
	}

////////////////////////////// 비밀번호찾기 이메일 발송 //////////////////////////////////////////
	@Override
	public String findPw(String user_id, String user_email) {
		User user = uMapper.findPw(user_id,user_email);
		if(user == null) {
			return null;
		} else {
			// 1. 임시 비밀번호 생성
			String pwcode = createPwCode();
			System.out.println("생성된 임시코드 : " + pwcode);
			// 2-1 단순 이메일 발송
			sendEmail(user,pwcode);
			uMapper.updatePw(user_id,user_email,pwcode);
			return "성공";
		}
	}

	private void sendEmail(User user, String pwcode) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(user.getUser_email()); // -에게
		message.setFrom("Medison@medison.com"); // -로부터
		message.setSubject("[Medison.] "+user.getUser_name()+"님에게 이메일 인증 임시번호 발송합니다."); // 제목
		message.setText("안녕하세요 아이디를 찾기 위한 임시번호를 안내해드립니다.\n"+
			"["+user.getUser_name()+"]님의 임시번호 : "+ pwcode +"]\n"
					+ "비밀번호가 임시 비밀번호로 변경되오니 추후 필히 비밀번호를 수정해주시길 바랍니다.\n" 
					+ "본 이메일은 발신 전용 이메일이므로 수신 불가합니다."
					);
		mailSender.send(message);
		System.out.println("메일이 발송되었습니다.");
	}

	private String createPwCode() {
		char[] charset = {'0','1','2','3','4','5','6','7','8','9',
				'a','b','c','d','e','f','g','h','i','j','k','l','m','n',
				'o','p','q','r','s','t','u','v','w','x','y','z'};
		String pwcode="";
		int idx = 0;
		
		for(int i = 0; i < 10; i++) {
			idx = (int)(Math.random()*36);
			pwcode += charset[idx];
		}
		return pwcode;
	}
////////////////////////////// 비밀번호찾기 이메일 발송 //////////////////////////////////////////


////////////////////////////// 아이디찾기 //////////////////////////////////////////
	@Override
	public String findId(String user_name, String user_email) {
	//	System.out.println("아이디찾기 "+ user_name);
	//	System.out.println("아이디찾기 "+ user_email);
		String fid = uMapper.findId(user_name,user_email);
		return fid;
	}


////////////////////////////// 아이디찾기 //////////////////////////////////////////

	
	public void sendEmail2(Member user) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(user.getUser_email()); // -에게
		message.setFrom("Medison@medison.com"); // -로부터
		message.setSubject("[Medison.] "+user.getUser_name()+"님에게 알림을 발송합니다."); // 제목
		message.setText("안녕하세요 반품신청을 요청받아 연락드립니다\n"+
					 "반품 요청하신 상품을 해당 약국으로 보내주시기 바랍니다. (택배 가능)\n" 
					+ "본 이메일은 발신 전용 이메일이므로 수신 불가합니다."
					);
		mailSender.send(message);
		System.out.println("메일이 발송되었습니다.");
	}

}

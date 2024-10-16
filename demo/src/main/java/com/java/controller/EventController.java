package com.java.controller;

import java.io.File;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.java.dto.Event;
import com.java.dto.Page;
import com.java.service.EventService;

@Controller
public class EventController {
	
	@Autowired EventService eservice;
	
	@RequestMapping("/event/event_list") // 이벤트 리스트 가져오기
	public String event_list(Model model,Page pageDto) {
		HashMap<String, Object> map = eservice.selectAllE(pageDto); // 이벤트 리스트, 페이지넘버링 가져오기
		model.addAttribute("elist", map.get("elist")); // 이벤트 리스트 보내기
		model.addAttribute("pageDto", map.get("pageDto")); // 페이지넘버링 보내기
		return "event/event_list";
	}
	
	@RequestMapping("/event/event_view") // 선택한 이벤트 게시글 보기
	public String event_view(int event_no, Model model) {
	//	System.out.println(event_no);
		HashMap<String, Object> map = eservice.selectOneE(event_no); // 선택한, 이전, 다음 이벤트 정보 가져오기
		
		model.addAttribute("eve", map.get("eve")); // 선택한 이벤트 정보 보냄
		model.addAttribute("prev", map.get("prev")); // 이전 이벤트 정보 보냄
		model.addAttribute("next", map.get("next")); // 다음 이벤트 정보 보냄
		return "event/event_view";
	}
	
	@GetMapping("/event/event_write") // 이벤트 작성페이지
	public String event_write() {
		return "event/event_write";
	}
	
	@PostMapping("/event/event_write") // 이벤트 작성하기
	public String doevent_write(@RequestPart MultipartFile file, Event event,
					String event_end,String event_start) {
		String fileName="";
		// 파일이 있을경우 저장
		if(!file.isEmpty()) {
			String ori_fileName = file.getOriginalFilename();// 실제 파일이름
			UUID uuid = UUID.randomUUID(); // 랜덤숫자 생성
			fileName = uuid+"_"+ori_fileName; // 파일이름 변경(중복방지)
			String uploadUrl = "c:/upload/"; // 파일 업로드 위치
			File f = new File(uploadUrl+fileName);
			try {
				file.transferTo(f); // 파일 저장
			} catch(Exception e) {e.printStackTrace();}
		}
		event.setEvent_image(fileName); // write일땐 if 밖에 modi일땐 if 안에
		event_start = event_start+" 00:00:00"; // 시작일 Timestamp 타입으로 변환하기 위한 변수
		event_end = event_end+" 00:00:00"; // 종료일 Timestamp 타입으로 변환하기 위한 변수
		Timestamp event_start_date = Timestamp.valueOf(event_start); // 시작일 Timestamp 타입으로 변환
		Timestamp event_end_date = Timestamp.valueOf(event_end);  // 종료일 Timestamp 타입으로 변환
		event.setEvent_start_date(event_start_date); // 이벤트 객체에 시작일 저장
		event.setEvent_end_date(event_end_date); // 이벤트 객체에 종료일 저장
		eservice.insertE(event); // 이벤트 게시글 작성
		return "redirect:/adminPage/ex_event";
	}
	
	@GetMapping("/event/event_modi") // 이벤트 수정페이지
	public String event_modi(int event_no,Model model) {
	//	System.out.println(event_no);
		HashMap<String, Object> map = eservice.selectOneE(event_no); // 수정할 이벤트 정보 가져오기
		model.addAttribute("e", map.get("eve")); // 게시글 정보 보내기
		model.addAttribute("end_date", map.get("end_date")); // 종료일 보내기
		model.addAttribute("start_date", map.get("start_date")); // 시작일 보내기
		return "event/event_modi";
	}
	
	@PostMapping("/event/event_modi") // 이벤트 수정하기
	public String doevent_modi(@RequestPart MultipartFile file, Event event,
			String event_end,String event_start) {
		String fileName="";
		// 파일이 있을경우 저장
		if(!file.isEmpty()) {
			String ori_fileName = file.getOriginalFilename();// 실제 파일이름
			UUID uuid = UUID.randomUUID(); // 랜덤숫자 생성
			fileName = uuid+"_"+ori_fileName; // 파일이름 변경(중복방지)
			String uploadUrl = "c:/upload/"; // 파일 업로드 위치
			File f = new File(uploadUrl+fileName);
			try {
				file.transferTo(f); // 파일 저장
			} catch(Exception e) {e.printStackTrace();}
			event.setEvent_image(fileName); // write일땐 if 밖에 modi일땐 if 안에
		}
		event_start = event_start+" 00:00:00"; // 시작일 Timestamp 타입으로 변환하기 위한 변수
		event_end = event_end+" 00:00:00"; // 종료일 Timestamp 타입으로 변환하기 위한 변수
		Timestamp event_start_date = Timestamp.valueOf(event_start); // 시작일 Timestamp 타입으로 변환
		Timestamp event_end_date = Timestamp.valueOf(event_end);  // 종료일 Timestamp 타입으로 변환
		event.setEvent_start_date(event_start_date); // 이벤트 객체에 시작일 저장
		event.setEvent_end_date(event_end_date); // 이벤트 객체에 종료일 저장
		eservice.modiE(event);
		return "redirect:/adminPage/ex_event";
	}
	@RequestMapping("/event/fin_event") // 종료된 이벤트 리스트 가져오기
	public String fin_event(Model model, Page pageDto) {
		HashMap<String,Object>map = eservice.selectAllF(pageDto); // 종료된 이벤트 리스트, 페이지넘버링 가져오기
		model.addAttribute("flist", map.get("flist"));  // 종료된 이벤트 리스트 보내기
		model.addAttribute("pageDto", map.get("pageDto")); // 페이지넘버링 보내기
		return "event/fin_event";
	}
	
	@PostMapping("/event/deleteE") // 이벤트 삭제
	@ResponseBody
	public String deleteE(int event_no) {
	//	System.out.println("asdfsadf"+event_no);
		eservice.deleteE(event_no); // 선택한 이벤트 게시글 삭제
		return "삭제되었습니다.";
	}
	
}

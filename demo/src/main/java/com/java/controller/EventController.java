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
	
	@RequestMapping("/event/event_list")
	public String event_list(Model model,Page pageDto) {
		HashMap<String, Object> map = eservice.selectAllE(pageDto);
		model.addAttribute("elist", map.get("elist"));
		model.addAttribute("pageDto", map.get("pageDto"));
		return "event/event_list";
	}
	
	@RequestMapping("/event/event_view")
	public String event_view(int event_no, Model model) {
	//	System.out.println(event_no);
		HashMap<String, Object> map = eservice.selectOneE(event_no);
		
		model.addAttribute("eve", map.get("eve"));
		model.addAttribute("prev", map.get("prev"));
		model.addAttribute("next", map.get("next"));
		return "event/event_view";
	}
	
	@GetMapping("/event/event_write")
	public String event_write() {
		return "event/event_write";
	}
	
	@PostMapping("/event/event_write")
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
		event_start = event_start+" 00:00:00";
		event_end = event_end+" 00:00:00";
		Timestamp event_start_date = Timestamp.valueOf(event_start);
		Timestamp event_end_date = Timestamp.valueOf(event_end);
		event.setEvent_start_date(event_start_date);
		event.setEvent_end_date(event_end_date);
		eservice.insertE(event);
		return "redirect:/adminPage/ex_event";
	}
	
	@GetMapping("/event/event_modi")
	public String event_modi(int event_no,Model model) {
	//	System.out.println(event_no);
		HashMap<String, Object> map = eservice.selectOneE(event_no);
		model.addAttribute("e", map.get("eve"));
		model.addAttribute("end_date", map.get("end_date"));
		model.addAttribute("start_date", map.get("start_date"));
		return "event/event_modi";
	}
	
	@PostMapping("/event/event_modi")
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
		event_start = event_start+" 00:00:00";
		event_end = event_end+" 00:00:00";
		Timestamp event_start_date = Timestamp.valueOf(event_start);
		Timestamp event_end_date = Timestamp.valueOf(event_end);
		event.setEvent_start_date(event_start_date);
		event.setEvent_end_date(event_end_date);
		eservice.modiE(event);
		return "redirect:/adminPage/ex_event";
	}
	@RequestMapping("/event/fin_event")
	public String fin_event(Model model, Page pageDto) {
		HashMap<String,Object>map = eservice.selectAllF(pageDto); 
		model.addAttribute("flist", map.get("flist"));
		model.addAttribute("pageDto", map.get("pageDto"));
		return "event/fin_event";
	}
	
	@PostMapping("/event/deleteE")
	@ResponseBody
	public String deleteE(int event_no) {
	//	System.out.println("asdfsadf"+event_no);
		eservice.deleteE(event_no);
		return "삭제되었습니다.";
	}
	
}

package com.java.dto;


import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Notice {
	private int notice_no, user_seq, notice_hit;
	private String notice_title, notice_content,notice_image;
	private Timestamp notice_date;
	
	private int remainDate;
	private User user;
	
}

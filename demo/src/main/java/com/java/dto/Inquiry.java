package com.java.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Inquiry {
	

	private  int inquiry_no;
	/* private int user_seq; */
	private  String inquiry_title;
	private  String inquiry_pw;
	private Timestamp inquiry_date;	 
	private String inquiry_category;	 
	private String answer_content;
	private String inquiry_content;
	private String inquiry_image;
	


}

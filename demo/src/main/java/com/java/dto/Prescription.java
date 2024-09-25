package com.java.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Prescription {
	private Integer prescription_no;
	private Integer user_seq;
	private Integer prescription_price;
	private String prescription_title;
	private String prescription_content;
	private String prescription_image;
	private Character store_check;
	
}

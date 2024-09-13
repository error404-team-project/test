package com.java.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
	private int user_seq;
	private String auth_id,user_id,user_pw,user_name,user_email,
			user_phone,user_zip,user_addr,user_gender,svc_agree,
			ps_agree,mkt_agree;
	private Timestamp user_birth, user_joindate, last_login;
	
	private String mailH, mailT, addr1, addr2,
			phone1, phone2, phone3, year, month, day;
	
}

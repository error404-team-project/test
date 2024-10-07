package com.java.dto;

import java.sql.Timestamp;
import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	
	 private  int  user_seq    ;
	 private  String  user_auth_id  ;
	 private  String   user_id;
	 private  String  user_pw;
	 private   String user_name   ;
	  private  String  user_email          ;
	  private	  String   user_birth   ;
	  private	 String   user_phone   ;
	  private  String user_zip   ;
	  private String user_addr      ;
	  private String x; // 경도
	  private String y; // 위도
	  private  Timestamp user_joindate  ;     
	  private char user_gender        ;
	  private char svc_agree  ;
	  private char ps_agree ; 
	  private String mkt_agree ;
	  private char user_dormant      ; 
	  
	  
	  private String addr1;
	  private String addr2;
	  private String addr3;
	  
	  private String email1 ;
	  private String email2 ;

	  private String phone1 ;
	  private String phone2 ;
	  private String phone3 ;
	  
	  private String birth1 ;
	  private String birth2 ;
	  private String birth3 ;
	  private String birth4 ;
	  
	
}
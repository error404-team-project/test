package com.java.dto;

import java.security.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Porder {
	
    private int user_seq;
    private String drone_id;
    private String order_date;
    private String order_status;  // 주문상태 
    private String carry_zip;   //  받는 사람 주소
    private String order_request;
    private String emergency;
    private String order_no;
    private int p_num;
    private int order_count;
    
    Product product;
    
    

}




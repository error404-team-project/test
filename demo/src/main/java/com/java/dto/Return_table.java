package com.java.dto;

import java.security.Timestamp;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Return_table {


	private String p_num;
    private String order_no;
    private String return_reason;
    private String  return_state;
    private String request_date;
    private Timestamp doreturn_date;
    private String return_no;
    
	

	
		
}

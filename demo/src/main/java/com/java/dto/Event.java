package com.java.dto;


import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Event {
	private Integer event_no, user_seq, event_hit, event_remainDate;
	private String event_title, event_content, event_image;
	private Timestamp event_start_date, event_end_date;
	
	private User user;
}

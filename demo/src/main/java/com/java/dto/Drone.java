package com.java.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Drone {
	private int drone_weight, drone_distance,drone_speed,drone_time;
	private String drone_id,drone_image,is_possible;
	
}

package com.java.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
	private Integer p_num, product_category, medical_category, health_category, price, stock, p_count;
	private String name, company, image, howuse, description, precautions,side_effects, storage, becareful, row_material;
	
}

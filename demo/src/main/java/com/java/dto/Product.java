package com.java.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
	private int p_num, product_category, medical_category, daily_category, price, stock, bookmark, basket, p_count;
	private String name, company, image, howuse, description, medical_precautions,side_effects, storage, medical_becareful, row_material;
	private Page page;
	
}

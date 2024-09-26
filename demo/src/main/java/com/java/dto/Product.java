package com.java.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
	private Integer p_num;
	private Integer product_category;
	private Integer medical_category;
	private Integer health_category;
	private Integer price;
	private Integer stock;
	private Integer p_count;
	private Integer user_seq;
	private double weight;
	private String name;
	private String company;
	private String image;
	private String howuse;
	private String description;
	private String precautions;
	private String side_effects;
	private String storage;
	private String becareful;
	private String row_material;
	
}

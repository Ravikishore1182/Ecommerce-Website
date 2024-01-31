package com.jsp.intime.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;
import lombok.ToString;

@Entity
@Data
@ToString
public class WomenProduct {

	@Id
	private Integer id;
	
	private String filepath;
	
	private String companyName;
	
	private double price;
	
	private String typeOfCloth;
}

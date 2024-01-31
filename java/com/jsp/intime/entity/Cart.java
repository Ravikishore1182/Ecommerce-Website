package com.jsp.intime.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Data;
import lombok.ToString;

@Data
@Entity
@Table(name="cart")
@ToString
public class Cart {

	@Id
	private Integer id;
	
	private String filepath;
	
	@Column(name = "company_name")
	private String companyName;
	
	private double price;
	
	@Column(name = "type_of_cloth")
	private String typeOfCloth;
	
	@OneToOne
	private User user;
}

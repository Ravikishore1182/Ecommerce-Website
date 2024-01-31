package com.jsp.intime.entity;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import lombok.Data;
import lombok.ToString;

@Entity
@Data
@ToString
public class OrderDetails {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer orderId;
	
	private String name;
	
	private String mobile;
	
	private String mail;
	
	private String address;
	
	private String city;
	
	private String dob;
	
	private String gender;
	
	private String cvv;
	
	private String cno;
	
	private String edate;
	
	@OneToOne
	//@JoinColumn(name = "user_mobile")
	private User user;
	
	@OneToOne
	@JoinColumn(name = "productid")
	private Cart cart;
}

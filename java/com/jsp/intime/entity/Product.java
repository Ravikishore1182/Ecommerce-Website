package com.jsp.intime.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name="product")
@Data
@NamedQuery(name = "Product.findAll",query = "SELECT p FROM Product p")
public class Product implements Serializable{
private static final long serialVersionUID = 1L;
	
	@Id
	private Integer id;
	
	private String companyname;
	
	private String filepath;
	
	private double price;
	
	private String typeofcloth;
	
}

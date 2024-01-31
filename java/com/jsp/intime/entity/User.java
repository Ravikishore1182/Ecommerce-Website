package com.jsp.intime.entity;

import java.io.Serializable;
import javax.persistence.*;

import lombok.ToString;


/**
 * The persistent class for the user database table.
 * 
 */
@Entity
@ToString
@NamedQuery(name="User.findAll", query="SELECT u FROM User u")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Column(name="user_email")
	private String userEmail;

	@Id
	@Column(name="user_mobile")
	private String userMobile;

	@Column(name="user_name")
	private String userName;

	@Column(name="user_password")
	private String userPassword;

	public User() {
	}

	public String getUserEmail() {
		return this.userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserMobile() {
		return this.userMobile;
	}

	public void setUserMobile(String userMobile) {
		this.userMobile = userMobile;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return this.userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

}
package com.jsp.intime.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jsp.intime.entity.User;

public interface UserRepository extends JpaRepository<User, String>{

}

package com.jsp.intime.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jsp.intime.entity.Cart;
import com.jsp.intime.entity.User;

public interface CartRepository extends JpaRepository<Cart, Integer>{

	List<Cart> findByUser(User u);
	
	@Transactional
	void deleteByIdAndUser(Integer id, User user);

}

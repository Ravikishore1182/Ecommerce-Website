package com.jsp.intime.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jsp.intime.entity.Cart;
import com.jsp.intime.entity.OrderDetails;
import com.jsp.intime.entity.User;

public interface OrderDetailsReository extends JpaRepository<OrderDetails, Integer> {

	@Transactional
	 List<OrderDetails> findByUser(User u);
	
}

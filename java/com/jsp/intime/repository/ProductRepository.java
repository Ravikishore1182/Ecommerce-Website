package com.jsp.intime.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jsp.intime.entity.Product;

public interface ProductRepository extends JpaRepository<Product, Integer>{

}

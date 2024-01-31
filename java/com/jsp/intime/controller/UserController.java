package com.jsp.intime.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.intime.entity.User;
import com.jsp.intime.repository.UserRepository;

@Controller
public class UserController {

	@Autowired
	private UserRepository repo;
	
//	@GetMapping("/allUsers")
//	public List<User> getUser(Model model){
//		return repo.findAll();
//	}
	
	@RequestMapping("/User")
	public String addUser(User user,Model model) {
		repo.save(user);
		return "Login";
	}
	
	@GetMapping("/allUsers")
	public ModelAndView testUser(String mobile,String password,HttpServletRequest request) {
		ModelAndView mv=new ModelAndView("Login"); 
		try {
			User u = repo.findById(mobile).get();
			if (u.getUserPassword().equals(password)) 
				{
				HttpSession s3=request.getSession();
				s3.setAttribute("user", u);
				mv.addObject("status", "true");
			}
			else {
				mv.addObject("status", "false");
			}
			return mv;
		} catch (Exception e) {
			mv.addObject("status", "false");
			return mv;
		}
	}
	
}

package com.jsp.intime.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jsp.intime.entity.Cart;
import com.jsp.intime.entity.MenProduct;
import com.jsp.intime.entity.Product;
import com.jsp.intime.entity.User;
import com.jsp.intime.repository.CartRepository;
import com.jsp.intime.repository.MenRepository;

@Controller
public class MenController {

	@Autowired
	private MenRepository menrepo;
	
	@Autowired
	private CartRepository cartrepo;
	
	@RequestMapping("/men")
	public String displayMen(Model model)
	{
		List<MenProduct> ls = menrepo.findAll();
		model.addAttribute("menProducts", ls);
		return "MEN";
	}
	
	@RequestMapping("/menadd")
	public String addCart(Integer path,HttpServletRequest req) {
		HttpSession s2=req.getSession();
		String data = (String)s2.getAttribute("login");
		if (data!=null) {
			boolean sData = Boolean.parseBoolean(data);
			if (sData) {
				try {
					MenProduct mp = menrepo.findById(path).get();
					Cart c=new Cart();
					c.setId(mp.getId());
					c.setCompanyName(mp.getCompanyname());
					c.setFilepath(mp.getFilepath());
					c.setPrice(mp.getPrice());
					c.setTypeOfCloth(mp.getTypeOfCloth());
					c.setUser((User)s2.getAttribute("user"));
					cartrepo.save(c);
					return "redirect:/men";
				}
				catch (Exception e) {
					
				}
			}
		}
		return "login";
	}
}

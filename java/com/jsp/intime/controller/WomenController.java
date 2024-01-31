package com.jsp.intime.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jsp.intime.entity.Cart;
import com.jsp.intime.entity.User;
import com.jsp.intime.entity.WomenProduct;
import com.jsp.intime.repository.CartRepository;
import com.jsp.intime.repository.WomenRepository;

@Controller
public class WomenController {

	@Autowired
	private WomenRepository womenrepo;
	
	@Autowired
	private CartRepository cartrepo;
	
	@RequestMapping("/women")
	public String displayMen(Model model)
	{
		List<WomenProduct> ls = womenrepo.findAll();
		model.addAttribute("womenProducts", ls);
		return "Women";
	}
	
	@RequestMapping("/womenadd")
	public String addCart(Integer path,HttpServletRequest req) {
		HttpSession s2=req.getSession();
		String data = (String)s2.getAttribute("login");
		if (data!=null) {
			boolean sData = Boolean.parseBoolean(data);
			if (sData) {
				try {
					WomenProduct wp = womenrepo.findById(path).get();
					Cart c=new Cart();
					c.setId(wp.getId());
					c.setCompanyName(wp.getCompanyName());
					c.setFilepath(wp.getFilepath());
					c.setPrice(wp.getPrice());
					c.setTypeOfCloth(wp.getTypeOfCloth());
					c.setUser((User)s2.getAttribute("user"));
					cartrepo.save(c);
					return "redirect:/women";
				}
				catch (Exception e) {
					
				}
			}
		}
		return "login";
	}
}

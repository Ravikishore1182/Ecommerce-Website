package com.jsp.intime.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jsp.intime.entity.Cart;
import com.jsp.intime.entity.OrderDetails;
import com.jsp.intime.entity.Product;
import com.jsp.intime.entity.User;
import com.jsp.intime.repository.CartRepository;
import com.jsp.intime.repository.OrderDetailsReository;
import com.jsp.intime.repository.ProductRepository;

@Controller
public class AppController {

	@Autowired
	private CartRepository cartrepo;
	@Autowired
	private ProductRepository prodrepo;
	
	
	@RequestMapping("/home")
	public String firstPage(Model model)
	{
		List<Product> list = prodrepo.findAll();
		model.addAttribute("products",list);
		return "Home";
	}
	
	@RequestMapping("/add")
	public String addCart(Integer path,HttpServletRequest req) {
		HttpSession s2=req.getSession();
		String data = (String)s2.getAttribute("login");
		if (data!=null) {
			boolean sData = Boolean.parseBoolean(data);
			if (sData) {
				try {
					Product hp = prodrepo.findById(path).get();
					Cart c=new Cart();
					c.setId(hp.getId());
					c.setCompanyName(hp.getCompanyname());
					c.setFilepath(hp.getFilepath());
					c.setPrice(hp.getPrice());
					c.setTypeOfCloth(hp.getTypeofcloth());
					c.setUser((User)s2.getAttribute("user"));
					cartrepo.save(c);
					
					return "redirect:/home";
				}
				catch (Exception e) {
					
				}
			}
		}
		return "Login";
	}
	
	@GetMapping("/displayCarts")
	public String displaycart(HttpServletRequest req,Model model)
	{
		HttpSession s2 = req.getSession();
		String data = (String) s2.getAttribute("login");
		if (data!=null) {
			boolean aData = Boolean.parseBoolean(data);
			if (aData) {
				User u = (User)s2.getAttribute("user");
				List<Cart> list = cartrepo.findByUser(u);
				model.addAttribute("carts", list);
				return "Cart";
			}
			else {
				return "Login";
			}
			
		}
		else
			return "Login";
	}
	
	
	@RequestMapping("/deleteCart")
	public String deleteItem(Integer id,HttpServletRequest req)
	{
		HttpSession s3=req.getSession();
		User user = (User)s3.getAttribute("user");
		cartrepo.deleteByIdAndUser(id, user);
		return "redirect:/displayCarts";
	}
	
	@RequestMapping("/checkInfo")
	public String checkLogin(HttpServletRequest req,Model model)
	{
		HttpSession s4=req.getSession();
		String data=(String) s4.getAttribute("login");
		//System.out.println(data);
		boolean check = Boolean.parseBoolean(data);
		if (check) {
			User u = (User)s4.getAttribute("user");
			model.addAttribute("presentUser",u);
			return "ProfileInfo";
		}
		else {
			return "Login";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest req)
	{
		HttpSession s5 = req.getSession();
		s5.setAttribute("login", "false");
		return "redirect:/home";
	}
	
	@RequestMapping("/place")
	public String order(Integer id,Model model)
	{
		Cart c = cartrepo.findById(id).get();
		model.addAttribute("orderCart",c);
		return "OrderConfirmation";
	}
	@RequestMapping("/pay")
	public String payment(OrderDetails details,Model model,Integer cart)
	{
		model.addAttribute("id", cart);
		//System.out.println(cart+"cartappconoay");
		model.addAttribute("details", details);
		return "Payment";
	}
	@Autowired
	private OrderDetailsReository orderrepo;
	
	@RequestMapping("/payCheck")
	public String paymentChecking(OrderDetails completeDetails,HttpServletRequest req,Integer id)
	{
		//System.out.println(id+"okay");
		HttpSession s5=req.getSession();
		User u=(User)s5.getAttribute("user");
		Cart c=cartrepo.findById(id).get();
		completeDetails.setUser(u);
		completeDetails.setCart(c);
		orderrepo.save(completeDetails);
		return "Orderplaced";
	}
	
	@RequestMapping("/showorders")
	public String orderDetails(HttpServletRequest req,Model model)
	{
		HttpSession s6 = req.getSession();
		User u = (User)s6.getAttribute("user");
	    List<OrderDetails> list=orderrepo.findByUser(u);
	    model.addAttribute("orders", list);
		return "Orders";
	}
	
	@RequestMapping("/deletorder")
	public String deleteOrder(Integer id)
	{
		orderrepo.deleteById(id);
		return "redirect:/showorders";
	}
}
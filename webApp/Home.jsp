<%@page import="com.jsp.intime.entity.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet" href="Home.css"></link>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
<link>
<style>
	button {
	width: 40px;
	height: 40px;
	margin-left: 200px;
}
#box {
	height: 30px;
	display: flex;
	cursor: pointer;
	padding: 10px 10px;
	background-color: #E3E6F3;
	border-radius: 30px;
	align-items: center;
	box-shadow: 0 10px 25px rgb(0, 0, 0, 0.03);
}

#box:hover {
	box-shadow: 2px 2px 15px 4px rgba(0, 0, 0, 0.45), 25px 0px 20px -20px
		rgba(0, 0, 0, 0.45), 0px 25px 20px -20px rgba(0, 0, 0, 0.45), -25px
		0px 20px -20px rgba(0, 0, 0, 0.45);
}

#box:hover input {
	width: 200px;
}

#box input {
	width: 0;
	outline: none;
	border: none;
	font-weight: 500;
	transition: 0.8s;
	background: transparent;
}

#search {
	height: 25px;
	width: 27px;
}
</style>
</head>
<body>
	<section id="header">
		<a href="#"><img src="logoimg.png" class="logo"></a>
		<div>
			<ul id="navbar">
				<li><a href="/home">Home</a></li>
				<li><a href="/men">Men</a></li>
				<li><a href="/women">Women</a></li>
				<li><a href="/checkInfo"><img id="profile"
						src="profile.png"></a></li>
				<li><div id="box">
						<input type="text" placeholder="Search....."><img
							id="search" src="search.png">
					</div>
				        </li>
				<li><a href="/displayCarts"><img id="cart" src="cart-icon.png"></a></li>
			</ul>
		</div>
	</section>
	<section id=adv>
		<h4>Biggest Deals For You</h4>
		<h2>Super Value Deals</h2>
		<h1>On All Products</h1>
		<p>save more with coupons & up to 70% off!</p>
		<button>Shop Now</button>
	</section>
	<section id="feature">
		<div class="fe-box">
			<img alt="" src="\Feaatures\f1.png">
			<h6>Free Shipping</h6>
		</div>
		<div class="fe-box">
			<img alt="" src="\Feaatures\f2.png">
			<h6>Order Online</h6>
		</div>
		<div class="fe-box">
			<img alt="" src="\Feaatures\f3.png">
			<h6>Save Money</h6>
		</div>
		<div class="fe-box">
			<img alt="" src="\Feaatures\f4.png">
			<h6>Promotions</h6>
		</div>
		<div class="fe-box">
			<img alt="" src="\Feaatures\f5.png">
			<h6>Happy Sell</h6>
		</div>
		<div class="fe-box">
			<img alt="" src="\Feaatures\f6.png">
			<h6>F24/7 Support</h6>
		</div>
	</section>
	<section id="product1">
		<h2>Featured Products</h2>
		<p>Different Collecctions Of Different Models</p>
		<div id="pro-container">
		
			<%
			   HttpSession s1=request.getSession();
			      if(s1.getAttribute("login")==null)
			      {
			    	  s1.setAttribute("login","false");
			      }
			
			
			List<Product> list = (List)request.getAttribute("products");
		for(Product hp : list)
		{
		%>
			<div class="pro">
				<img src="<%=hp.getFilepath()%>" name="path">
				<div id="des">
					<span><%=hp.getCompanyname() %></span>
					<h5><%=hp.getTypeofcloth() %></h5>
					<h4><%=hp.getPrice() %>/-</h4>
					<form action="add">
					  <input hidden="true" value="<%=hp.getId()%>" name="path">
					    <button>
					       <img src="cart-icon.png"> 
					    </button>
					  </form>
					
				</div>
			</div>
			<%
		}
			%>
						
	</section>
	<section id="banner">
		<h4>Repair Services</h4>
		<h2>
			Up to<span>70% OFF</span>-All t-shirts & Accessories
		</h2>
		<button class="normal">Explore More</button>
	</section>
	<footer class="foot">
		<div class="col">
			<img src="logoimg.png">
			<h4>Contact Us</h4>
			<p>
				<strong>Address:</strong>Plot no 188,JNTU,Hyderabad
			</p>
			<p>
				<strong>Phone:</strong>+91 919133445566
			</p>
			<p>
				<strong>Hours:</strong>10:00 - 18:00, Mon - Sat
			</p>
		</div>
		<div class="follow">
			<h4>Follow Us</h4>
			<a href=""><img src="facebook.png"></a> <a href=""><img
				src="instagram.png"></a> <a href=""><img src="snap.png"></a>
			<a href=""><img src="youtube.png"></a> <a href=""><img
				src="twitter.png"></a>
		</div>
		<div class="col2">
			<h4>My Account</h4>
			<a href="#">Sing In</a> <a href="#">View Cart</a> <a href="#">My
				Wishlist</a> <a href="#">Track My Order</a> <a href="#">Help</a>
		</div>
		<div id="col3">
			<h4>Secured Payment Gateways</h4>
			<img src="pay.png">
		</div>
	</footer>
</body>
</html>
<%@page import="com.jsp.intime.entity.Cart"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.jsp.intime.entity.OrderDetails"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Orders</title>
<style>
	* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Spartan", sans-serif;
}
h1 {
  font-size: 50px;
  line-height: 64px;
  color: #222;
}

h2 {
  font-size: 46px;
  line-height: 54px;
  color: #222;
}

h4 {
  font-size: 20px;
  color: #222;
}

h6 {
  font-weight: 700;
  font-size: 12px;
}

p {
  font-size: 16px;
  color: #465b52;
  margin: 15px 0 20px 0;
}

.section-p1 {
  padding: 40px 80px;
}

.section-m1 {
  margin: 40px 0;
}

body {
  width: 100%;
}
.logo{
	padding-left: 0px;
	width: 100px;
	height: 60px;
}
#header{
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 20px 70px;
	background-color: #E3E6F3;
	box-shadow: 0 5px 15px rgba(0red,0 green,0 blue, 0.06);
	z-index: 999;
	position: sticky;
	top: 0;
	left: 0;
}
#navbar{
	display: flex;
	align-items: center;
	justify-content: center;
}
#navbar li{
	list-style:none ;
	padding: 0px 20px;
	position: relative;
}
#cart{
	width: 30px;
	height: 30px;
}
#profile{
	width: 27px;
	height: 27px
}
#search{
	height: 25px;
	width: 27px;
}
#navbar li a{
	text-decoration: none;
	font-size: 16px;
	font-weight: 600;
	color: black;
	transition: 0.3s ease;
}
#navbar li a:hover,
#navbar li a:active{
	color: blue;
}
#navbar li a:active::after,
#navbar li a:hover::after{
	content: "";
	width: 50%;
	height: 2px;
	background: blue ;
	position: absolute;
	bottom: -4px;
	left: 20px;
}
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

.mainbody{
 	display: flex;
	justify-content: space-around;
	align-items: center;
	flex-direction: row;
	position: relative;
	width: 95%;
	border-radius: 5px;
	box-shadow: 2px 2px 15px 4px rgba(0, 0, 0, 0.45), 25px 0px 20px -20px rgba(0, 0, 0, 0.45), 0px 25px 20px -20px rgba(0, 0, 0, 0.45), -25px  0px 20px -20px rgba(0, 0, 0, 0.45);
		margin:40px;
	}

.mainbody .image{
    
	height: 240px;
}
.mainbody .image .img{
	height: 95%;
	width: 100%;
	margin-top:5px;
	border-radius: 5px;
}
.main label{
	font-size: x-large;
	font-weight:500;
	padding: 40px 20px;
	font-family: cursive;
}
.main span{
	font-size: medium;
	font-family:cursive;
}
.main h1{
	font-size: x-large;
	font-family: sans-serif;
}
.main #cancel{
	padding: 5px;
	border-radius: 50px;
	font-weight:500;
	background-color: silver;
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
	
	<h1>My Orders</h1>
	<%
	List<OrderDetails> ls=(List)request.getAttribute("orders");
	for(OrderDetails od:ls)
	{
		Cart c=od.getCart();
	
	%>
	
	<section class="mainbody">
		<div class="image">
			<img class="img" src="<%=c.getFilepath()%>">
		</div>
		<div class="main details">
			<h1>Details</h1>
			<label>Brand Name:</label><span><%=c.getCompanyName() %></span><br>
			<label>Type of cloth:</label><span><%=c.getTypeOfCloth() %></span><br>
			<label>Price:</label><span>Rs <%=c.getPrice() %>/-</span>
		</div>
		<div class="main address">
			<h1>Delivery Address</h1>
			<label>Name :</label><span><%=od.getName() %></span><br>
			<label>Address :</label><span><%=od.getAddress() %></span><br>
			<label>Phone Number :</label><span>+91-<%=od.getMobile() %></span>
		</div>
		<form action="deletorder">
		<div class="main address">
			<input type="hidden" name="id" value="<%=od.getOrderId() %>">
			<input type="submit" value="Cancel Order" id="cancel">
		</div>
		</form>
	</section>
	<%
		
	}
	%>
</body>
</html>
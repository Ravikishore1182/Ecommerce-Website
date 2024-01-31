<!DOCTYPE html>
<%@page import="com.jsp.intime.entity.User"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>User Profile</title>
<link rel="stylesheet" href="profileinfo.css">
</head>
<body>
<img id="logo" src="logoimg.png" onclick="location.href='home'">
	<div class="container">
		<div class="left">
		<img src="profile.png">
			<input id="button" type="button" value="Home"
				onclick="location.href='home'"> <input id="button"
				type="button" value="Login" onclick="location.href='Login.jsp'">
			<input id="button" type="button" value="Men"
				onclick="location.href='/men'"> <input id="button"
				type="button" value="Women" onclick="location.href='/women'">
				<input id="button" type="button" value="Orders" onclick="location.href='/showorders'">
		</div>
		<div class="right">
			<div class="info">
			<%
				User udata = (User)request.getAttribute("presentUser");
			%>
				<h1>ABOUT</h1>
				<br>
				<br>
				<div class="info_data">
					<div class="data">
						<h4>User Name :</h4>
						<p><%=udata.getUserName() %></p>
					</div>
					<div class="data">
						<h4>Mobile :</h4>
						<p><%=udata.getUserMobile() %></p>
					</div>
				</div>
				<br> <br><br> 	 	 	
				<div class="info">
					<div class="info_data">
						<div class="data">
							<h4>Email :</h4>
							<p><%=udata.getUserEmail() %></p>
						</div>
						<div class="data">
							<h4>Password :</h4>
							<p><%=udata.getUserPassword() %></p>
						</div>
					</div>
				</div>
				<br> <br>
				<form action="/logout"><button class=logoutbut type="submit">LOGOUT</button></form>
			</div>
			
		</div>
	</div>
</body>
</html>

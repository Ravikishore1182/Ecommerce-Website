<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<style>
		*{
			padding: 0px;
			margin: 0px;
		}
		body{
			background: url("background.png");
			background-size: 100%;
			background-position: -400px 0px 0px 0px;
			background-repeat: no-repeat;
			
		}
		.main{
			width:400px;
			margin:100px auto 0px auto
		}
		h2{
			text-align: center;
			padding: 20px;
			font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
			color: rgb(255, 255, 255);
			letter-spacing: 3px;
		}
		.register{
			background-color: rgba(red, green, blue, 0.9);
			width: 100%;
			font-size: 18px;
			border-radius: 10px;
			border: 1px solid rgba(225red,225 green,225 blue, 0.3);
			box-shadow: 2px 2px  15px rgba(red, green, blue, 0.3);
			color: rgb(0, 0, 128);
			margin-top: -80px;
		}
		button{
			width: 100px;
			height: 27px;
			bottom: 60px;
			border-radius: 8px;
			border: none;
			outline: none;
			text-align: center;
			font-weight: bold;
			font-size: 18px;
			letter-spacing: 3px;
			text-shadow: 1px 1px 1px black;
			background-color:rgb(128, 0, 255);
			cursor: pointer;
			transition: transform 0.2s,box-shadow 0.5s;
			outline-color: transparent;
			outline-style:solid;
		}
		#button:hover{
			transform: scale(1.1);
		}
		</style>
	</head>
		<body>
			<div class="main">
				<div class="register">
					<h2>Register Here</h2>
					<form id="register"  action="/User">
					<label>FullName</label>
					<br>
					<input type="text" id="name" name="name" placeholder="Enter Your FullName">
					<br><br>
					<label>Email : </label>
					<br>
					<input type="email" id="name" name="email" placeholder="Enter Your Email">
					<br><br>
					<label>Password : </label>
					<br>
					<input type="password" id="name" name="password" placeholder="Enter Your Password">
					<br><br>
					<button id="button">Register</button>
					<br><br>
					</form>
				</div>
			</div>
		</body>
	</head>
</html>
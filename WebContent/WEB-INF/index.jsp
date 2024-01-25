<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GoGreen</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

.hero {
	width: 100%;
	height: 100vh;
	position: relative;
	padding: 0 5%;
	display: flex;
	align-items: center;
	justify-content: center;
	overflow: hidden;
	background-image: url("${pageContext.request.contextPath}/resources/images/landingpagee.png");
	background-attachment: fixed;
	background-repeat: no-repeat;
	background-size: cover;
	font-family: 'Poppins', sans-serif;
	margin: 0;
	padding: 0;
	font-family: 'Poppins', sans-serif
}

nav {
	width: 100%;
	position: absolute;
	top: 0;
	left: 0;
	padding: 20px 8%;
	align-items: center;
	justify-content: space-between;
}

nav ul {
	display: flex;
	justify-content: flex-end;
	padding-top:12px;
}

nav ul li {
	list-style: none;
	diplay: inline-block;
	margin-left: 40px;
	]
}

nav ul li a {
	text-decoration: none;
	color: #fff;
	font-size: 17px;
	transition:color 0.3s;
}

nav ul li a:hover{
color:#FFFFDD;
}

.content {
    text-align: left;
    z-index: 1;
    width: 100%;
    margin: 70px;
    padding: 40px;
    color: white;
    background: linear-gradient(to right, rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0)); /* Adjust the alpha values as needed */
}



.content h1 {
	font-size: 42px; 
	line-height: 1.3;
	margin-bottom: 20px;
	text-align: left; 
		color: white;
	
}

.content p{
	font-size: 20px; 
	line-height: 1.3;
	margin-bottom: 20px;
	text-align: left; 
		color: white;
	
}

.content a {
	text-decoration: none;
	display: inline-block;
    background-color: #FFBB5C; 
	color: #000;
	font-size: 24px;
	border: none ;
	padding: 14px 70px;
	border-radius: 50px;
	margin-top: 20px;
	transition: background-color 0.3s, color 0.3s;
	
	
}


.content a:hover {
    background-color: #FF9B50; 
    color: #FFFFDD 
}

.content a:active {
    box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.5); 
}

</style>
</head>
<body>
	<div class="hero">

		<nav>
			<ul>
				<li><a href="login">Log In</a></li>
				<li><a href="register">Sign Up</a></li>

			</ul>
		</nav>
		<div class="content">
			<h1>Welcome to the Iskandar Puteri Low Carbon Initiative (IPRK)<br> Portal by Majlis Bandaraya Iskandar Puteri (MBIP).</h1>
			<p> MBIP's Iskandar Puteri Rendah Karbon (IPRK) initiative collects energy-saving data across various communities <br>which includes schools, residences, institutions, and more. Launched in 2019, it's a significant step towards sustainability. </p>
			<a href="login">Log In</a>
		</div>
	</div>


</body>
</html>
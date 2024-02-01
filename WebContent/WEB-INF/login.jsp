<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
	
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<title>GoGreen</title>
	<style>
		body {
			margin: 0;
			font-family: Arial, sans-serif;
		}
		
		header {
			background-color: #045BAC;
			padding: 10px 15px;
			text-align: center;
			display: flex;
			justify-content: space-between;
			align-items: center;
			color: white;
		}
		
		.logo{
			display: flex;
   			align-items: center;
		}
		
		.logo img {
			background-color: white;
			border-radius: 50%;
			margin: 0 20px;
			padding: 2px;
		}
		
		.logo span{
			font-size: 20px;
		}

		#button-container {
			display: flex;
			align-items: center;
		}

		#login,
		#signup {
			background-color: #045bac;
			color: white;
			padding: 10px 20px;
			text-decoration: none;
			margin: 0 10px;
			border-radius: 5px;
		}

		.loginFormContainer {
			display: flex;
			flex-direction: column;
			align-items: center;
		}

		#login-form {
			display: flex;
			flex-direction: column;
			align-items: center;
			margin-top: 10px;
		}

		#login-form div {
			display: flex;
			align-items: center;
			margin-bottom: 10px;
		}

		.forgot-password {
			margin-left: 190px;
			color: #045bac;
			font-size: 10px;
			text-decoration: none;
		}

		#login-button {
			margin-top: 10px;
			background-color: #ffc684;
			color: #ffffff;
			padding: 10px 20px;
			margin-left: 10px;
			border: none;
			border-radius: 5px;
			cursor: pointer;
		}
		
		#login-button:hover {
			background-color: #fbbf7b;
		}

		.signup-link {
			margin-top: 12px;
			font-size: 20px;
			text-decoration: underline;
		}
		
		.field{
			display: flex;
			width: 100%;
			gap: 15px;
		}
		
		.form-label{
			flex: 1;
			text-align: right;
			margin: 0;
		}
		
		.form-control{
			flex: 2;
			background-color: #f6f6f6;
		}

		footer {
			background-color: #045bac;
			color: white;
			text-align: center;
			padding: 10px;
			position: fixed;
			bottom: 0;
			width: 100%;
		}

		.content {
			display: flex;
			flex-direction: column;
			align-items: center;
			padding: 40px 30px;
		}

		#pass a {
			font-size: 14px;
			margin-left: 200px;
		}

		.pageContainer {
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			margin-top: 30px;
		}

		.errorMessage {
			margin-left: 15px;

			text-align: right;
		}
	</style>
</head>
<body>
	<header>
		<div class="logo">
			<img src="${pageContext.request.contextPath}/resources/images/mbip.png" alt="logo" width="45px">
			<span>Iskandar Puteri</span>
		</div>
		
		<div id="button-container">
			<a href="<%=request.getContextPath()%>/login" id="login">Login</a>
			<a href="<%=request.getContextPath()%>/register" id="signup">Sign Up</a>
		</div>
	</header>
	<div class="content">
		<div class="image2" style="width: fit-content; margin-bottom: 20px;">
			<img src="${pageContext.request.contextPath}/resources/images/iskandar_logo.png" alt="logo" />
		</div>
		<div class="loginFormContainer">
			<h4>LOG IN</h4>
			<c:if test="${not empty error}">
				<div class="errorMessage">
					<p>${error}</p>
				</div>
			</c:if>
			<form id="login-form" method="post" action="<%= request.getContextPath() %>/login/submit" enctype="multipart/form-data">
				<div class="field">
					<label for="nric" class="form-label">NRIC:</label>
					<input type="text" id="NRIC" class="form-control" name="NRIC" placeholder="Enter your NRIC"/>
				</div>
				<div class="field">
					<label for="password" class="form-label">PASSWORD:</label>
					<input type="password" id="password" class="form-control" name="password" placeholder="Enter your password"/>
				</div>

				<div id="pass">
					<a href="<%= request.getContextPath() %>/forgotPassword" class="forgot-password">Forgot Password?</a>
				</div>
				<button type="submit" id="login-button">Log In</button>
			</form>
			<div style="margin: 20px 0;">
				<span>No account yet?</span>
				<a href="<%= request.getContextPath() %>/register" style="color: #045BAC;">Sign up here</a>
			</div>
		</div>
	</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>

</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GoGreen</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
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

h1 {
	color: white;
}

#button-container {
	display: flex;
	align-items: center;
}

#login, #signup {
	background-color: #045BAC;
	color: white;
	padding: 10px 20px;
	text-decoration: none;
	margin: 0 10px;
	border-radius: 5px;
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

.content {
	display: flex;
	justify-content: space-around;
	padding: 10px 30px;
}

.formContainer {
	padding: 20px;
}

.formContainer h2 {
	color: #045BAC;
	text-align: center;
}

.field{
	display: flex;
	gap: 30px;
}

.form-group{
	flex: 1;
	margin-bottom: 10px;
}

.form-label{
	margin: 0;
}

#login-button {
	background-color: #FFC684;
	color: #FFFFFF;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
}

#login-button:hover {
	background-color: #fbbf7b;
}

#image2 {
	max-width: 500px;
	margin-top: 150px;
	height: 270px;
}

#content {
	max-width: 100%;
	box-sizing: border-box;
	overflow: hidden;
	padding: 20px;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

		<img id="image2"
			src="${pageContext.request.contextPath}/resources/images/iskandar_logo.png"
			alt="logo">

		<div class="formContainer">
			<h2>Sign up</h2>
			<form id="registrationForm" method="post" action="<%=request.getContextPath()%>/register/submit" enctype="multipart/form-data">
				<div class="field">
					<div class="form-group">
						<label for="firstName" class="form-label">First Name:</label>
						<input type="text" id="firstName" class="form-control" name="firstName" required>
					</div>

					<div class="form-group">
						<label for="lastName" class="form-label">Last Name:</label>
						<input type="text" id="lastName" class="form-control" name="lastName" required>
					</div>
				</div>
				
				<div class="field">
					<div class="form-group">
						<label for="NRIC" class="form-label">NRIC:</label> 
						<input type="text" id="Identification_Card" class="form-control" name="Identification_Card" required>
					</div>
					
					<div class="form-group">
						<label for="Address" class="form-label">Address:</label>
						<input type="text" id="Address" class="form-control" name="Address" required>
					</div>
					
				</div>
				
				<div class="field">
					<div class="form-group">
						<label for="email" class="form-label">Email:</label>
						<input type="email" id="email" class="form-control" name="email" required>
					</div>

					<div class="form-group">
						<label for="phoneNo" class="form-label">Phone Number:</label>
						<input type="tel" id="phoneNo" class="form-control" name="phoneNo" pattern="[0-9]{11}" required>
					</div>

				</div>

				<div class="field">
					<div class="form-group">
						<label for="category" class="form-label">Category:</label>
						<select id="category" class="form-select" name="category" required>
							<option value="Housing (High Rise)">Housing (High Rise)</option>
							<option value="Housing (Landed)">Housing (Landed)</option>
							<option value="Institution">Institution</option>
						</select>
					</div>

					<div class="form-group">
						<label for="area" class="form-label">Area:</label>
						<select id="area" class="form-select" name="area" required>
							<option value="Pulai Indah">Pulai Indah</option>
							<option value="Kangkar Pulai">Kangkar Pulai</option>
							<option value="Pulai Utama">Pulai Utama</option>
							<option value="Sri Pulai">Sri Pulai</option>
							<option value="Taman Universiti">Taman Universiti</option>
							<option value="Mutiara Rini">Mutiara Rini</option>
							<option value="Lima Kedai">Lima Kedai</option>
							<option value="Nusa Bayu">Nusa Bayu</option>
							<option value="Gelang Patah">Gelang Patah</option>
							<option value="Leisure Farm">Leisure Farm</option>
							<option value="Tanjung Kupang">Tanjung Kupang</option>
							<option value="Medini Iskandar">Medini Iskandar</option>
							<option value="Kota Iskandar">Kota Iskandar</option>
							<option value="Bukit Horizon">Bukit Horizon</option>
							<option value="Impian Emas">Impian Emas</option>
							<option value="Sri Skudai">Sri Skudai</option>
							<option value="Skudai">Skudai</option>
							<option value="Skudai Baru">Skudai Baru</option>
							<option value="Selesa Jaya">Selesa Jaya</option>
							<option value="Tun Aminah">Tun Aminah</option>
							<option value="Nusa Bestari">Nusa Bestari</option>
							<option value="Bukit Indah">Bukit Indah</option>
							<option value="Sutera Utama">Sutera Utama</option>
							<option value="Perling">Perling</option>
						</select>
					</div>
				</div>

				<div class="field">
					<div class="form-group">
						<label for="ic_card" class="form-label">Identification Card:</label> 
						<input type="file" id="ic_card" class="form-control" name="ic_card" accept="image/*" required>
					</div>
					
					<div class="form-group">
						<label for="fileUpload" class="form-label">Proof of residency:</label> 
						<input type="file" id="fileUpload" class="form-control" name="fileUpload" accept="image/*" required>
					</div>
				</div>

				<div class="field">
					<div class="form-group">
						<label for="password" class="form-label">PASSWORD:</label>
						<input type="password" id="password" class="form-control" name="password" placeholder="Enter your password" required>
					</div>


					<div class="form-group">
						<label for="Cpassword" class="form-label">CONFIRM PASSWORD:</label> 
						<input type="password" id="Cpassword" class="form-control" name="Cpassword" placeholder="Confirm your password" required>
					</div>

				</div>

				<div class="field">
					<div class="form-group">
						<label for="people" class="form-label">Number Of People Living:</label>
						<input type="number" id="people" class="form-control" name="people" required>
					</div>
					<div class="form-group">
						
					</div>
				</div>

				<div class="submitField" style="text-align: center">
					<div>
						<label class="form-label" style="margin: 20px 0;"> 
							<input type="checkbox" id="agreeTerms" name="agreeTerms" required> I agree to all the statements in Terms of Service
						</label>
					</div>
					<button type="submit" id="login-button">Sign Up</button>
					<div style="margin: 20px 0;">
						<span>Already have an account?</span>
						<a href="<%= request.getContextPath() %>/login" style="color: #045BAC;">Login here</a>
					</div>
				</div>

			</form>
		</div>
		<script>
			var errorParam = new URLSearchParams(window.location.search)
					.get('error');

			if (errorParam) {
				alert(errorParam);
			}
		</script>

		<script>
			$(document).ready(function() {
				$('#registrationForm').submit(function(event) {
					var password = $('#password').val();
					var confirmPassword = $('#Cpassword').val();

					if (password !== confirmPassword) {
						alert('Password and confirm password do not match');
						event.preventDefault(); // Prevent form submission
					}
				});
			});
		</script>
	</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>

</html>

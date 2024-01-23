<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GoGreen</title>
<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
}

header {
	background-color: #045BAC;
	padding: 15px;
	text-align: center;
	display: flex;
	justify-content: space-between;
	align-items: center;
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

#image1 {
	display: flex;
	align-items: center;
	margin-right: 10px;
	width: 40px;
	height: 40px;
	border-radius: 50%;
	background-color: white
}

#image1 img {
	max-width: 100%;
	height: auto;
	border-radius: 50%;
	margin-right: 20px;
}

#image1 h1 {
	color: white;
	margin-right: 10px;
}

#content {
	display: flex;
	margin-left: 30px;
}

#form1 {
	margin-left: 10px;
}

#form1 h1 {
	color: #045BAC;
	margin-left: 480px;
}

#field1 {
	display: flex;
	width: 100%;
	height: 80px;
	margin-left: 300px;
	margin-bottom: -30px;
}

#field2 {
	display: flex;
	width: 100%;
	height: 80px;
	margin-left: 300px;
	margin-bottom: -30px;
}

#field3 {
	display: flex;
	width: 100%;
	height: 80px;
	margin-left: 300px;
	margin-bottom: -30px;
}

#field4 {
	display: flex;
	width: 100%;
	height: 80px;
	margin-left: 300px;
	margin-bottom: -30px;
}

#field5 {
	display: flex;
	width: 100%;
	height: 80px;
	margin-left: 300px;
	margin-bottom: -30px;
}

#field6 {
	display: flex;
	width: 100%;
	height: 80px;
	margin-left: 300px;
	margin-bottom: -30px;
}

#field7 {
	display: flex;
	width: 100%;
	height: 80px;
	margin-left: 300px;
	margin-bottom: -30px;
}

.form-group input[type="text"] {
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #f0f0f0;
	color: #333;
}

.form-group input[type="email"] {
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #f0f0f0;
	color: #333;
}

.form-group input[type="tel"] {
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #f0f0f0;
	color: #333;
}

.form-group input[type="password"] {
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #f0f0f0;
	color: #333;
}

.form-group input[type="number"] {
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #f0f0f0;
	color: #333;
}

.form-group {
	display: inline-block;
	margin-right: 150px;
}

#termsForm {
	margin-left: 380px;
}

#login-button {
	background-color: #FFC684;
	color: #FFFFFF;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin-left: 520px;
}

#category {
	width: 173px;
	font-size: 13px;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #f0f0f0;
}

.form-group input {
	width: 160px;
	padding: 5px;
}

.form-group input[type="file"] {
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #f0f0f0;
}

#image2 {
	max-width: 900px;
	height: 500px;
	margin-left: 80px;
	margin-top: 130px;
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
		<div id="image1">
			<img
				src="${pageContext.request.contextPath}/resources/images/mbip.png"
				alt="" style="max-width: 100%; height: auto;">
			<h1>Iskandar</h1>
			<h1>Puteri</h1>
		</div>
		<div id="button-container">
			<a href="<%=request.getContextPath()%>/login" id="login">Login</a>
			<a href="<%=request.getContextPath()%>/register" id="signup">Sign
				Up</a>
		</div>
	</header>
	<div id="content">

		<img id="image2"
			src="${pageContext.request.contextPath}/resources/images/iskandar_logo.png"
			alt="" style="max-width: 600px; height: 300px;">

		<div id="form1">
			<h1>Sign up</h1>
			<form id="registrationForm" method="post"
				action="<%=request.getContextPath()%>/register/submit"
				enctype="multipart/form-data">
				<div id="field1">
					<div class="form-group">
						<label for="firstName">First Name:</label> </br> <input type="text"
							id="firstName" name="firstName" required>
					</div>

					<div class="form-group">
						<label for="lastName">Last Name:</label> </br> <input type="text"
							id="lastName" name="lastName" required>
					</div>
				</div>
				</br>
				<div id="field2">
					<div class="form-group">
						<label for="NRIC">NRIC:</label> </br> <input type="text"
							id="Identification_Card" name="Identification_Card" required>
					</div>

					<div class="form-group">
						<label for="Address">Address:</label> <br> <input type="text"
							id="Address" name="Address" required>
					</div>
				</div>
				</br>
				<div id="field3">
					<div class="form-group">
						<label for="email">Email:</label> <br> <input type="email"
							id="email" name="email" required>
					</div>

					<div class="form-group">
						<label for="phoneNo">Phone Number:</label> <br> <input
							type="tel" id="phoneNo" name="phoneNo" pattern="[0-9]{11}"
							required>
					</div>

				</div>
				<br>
				<div id="field4">
					<div class="form-group">
						<label for="category">Category:</label> <br> <select
							id="category" name="category" required
							style="width: 170px; padding: 10px; border: 1px solid #ccc; border-radius: 5px; background-color: #f0f0f0;">
							<option value="Housing(High Rise)">Housing(High Rise)</option>
							<option value="Housing(Landed)">Housing(Landed)</option>
							<option value="Institution">Institution</option>
						</select>
					</div>

					<div class="form-group">
						<label for="Area">Area:</label> </br> <select id="area" name="area"
							required
							style="width: 170px; padding: 10px; border: 1px solid #ccc; border-radius: 5px; background-color: #f0f0f0;">
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

				<br>
				<div id="field5">
					<div class="form-group">
						<label for="Identification Card">Identification Card:</label> 
						</br> 
						<input
							type="file" id="ic_card" name="ic_card"
							accept="image/*" required>
					</div>



					<div class="form-group">
						<label for="fileUpload">Proof of residency:</label> 
						<br> 
						<input
							type="file" id="fileUpload" name="fileUpload"
							accept="image/*" required>
					</div>
				</div>

				<br>
				<div id="field6">
					<div class="form-group">
						<label for="password">PASSWORD:</label> <br> <input
							type="password" id="password" name="password"
							placeholder="Enter your password">
					</div>


					<div class="form-group">
						<label for="Cpassword">CONFRIM PASSWORD:</label> <br> <input
							type="password" id="Cpassword" name="Cpassword"
							placeholder="Confirm your password">
					</div>

				</div>
				<br>
				<div id="field7">
					<div class="form-group">
						<label for="people">Number Of People Living:</label> <br> <input
							type="number" " id="people" name="people" required>
					</div>
				</div>
				<br> <br>
				<div id="termsForm">
					<div>
						<label> <input type="checkbox" id="agreeTerms"
							name="agreeTerms" required> I agree to all the statements
							in Terms of Service
						</label>
					</div>

				</div>

				<br>
				<button type="submit" id="login-button">Sign Up</button>
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
</html>

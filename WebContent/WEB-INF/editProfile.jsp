<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
<title>GoGreen</title>
<style>
.pageContent{
	padding: 30px 60px;
}
.pageTitle {
	text-decoration: underline;
    margin: 20px 0;
    font-size: 30px;
    font-weight: bold;
}

.form{
	display: flex;
	flex-direction: column;
	
}
.form-row{
	display: flex;
	justify-content: space-between;
	gap: 50px;
}

.form-group{
	flex: 1;
}

.word{
	padding: 10px;
	font-size: 16px;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #f0f0f0;
	margin-bottom: 1rem;
	width: 95%;
}
label{
	margin-bottom: 5px;
}
.edit-btn{
	border: 2px solid #f2bc85;
	background-color: #f2bc85;
	color: white;
	padding: 10px 20px;
	margin: auto;
	border-radius: 10px;
}
.edit-btn:hover{
	background-color:#f0ab65;
}
</style>
</head>
<body>
	<div class="pageContainer">
		<div class="sideBarContainer">
			<jsp:include page="sidebar.jsp" />
		</div>

		<div class="pageWrapper">
			<jsp:include page="headerBar.jsp" />
			<div class="pageContent">
				<div class="pageNav">
					Home > <a href="profile">Profile</a> > <a
						href="editProfile">Edit Profile</a>
				</div>



				<div id="content">
					<h2 class="pageTitle">Profile Information</h2>

					<div class="form">
						<form method="post" action="<%=request.getContextPath()%>/updateProfile" enctype="multipart/form-data">
							<div class="form-row">
								<div class="form-group">

									<label for="firstName">First Name:</label> <br>
									<input type="text" id="firstName" class="word" name="firstName"
										value="${user.firstName}" />
								</div>

								<div class="form-group">
									<label for="lastName">Last Name:</label> <br>
									<input
										type="text" id="lastName" class="word" name="lastName" value="${user.lastName}" />
								</div>
							</div>

							<div class="form-row">

								<div class="form-group">
									<label for="phoneNo">Phone Number:</label> <br>
									<input type="text" id="phoneNo" class="word" name="phoneNo"
										value="${user.phoneNo}" />
								</div>

								<div class="form-group">
									<label for="email">Email:</label> <br> 
									<input
										type="text" id="email" class="word" name="email" value="${user.email}" />
								</div>
							</div>

							<div class="form-row">
								<div class="form-group">
									<label for="category">Category:</label> <br> 
									<select id="category" class="word" name="category" onchange="${user.category}" required>
										<option value="Housing(High Rise)">Housing(High Rise)</option>
										<option value="Housing(Landed)">Housing(Landed)</option>
										<option value="Institution">Institution</option>
									</select>


								</div>

								<div class="form-group">
									<label for="numPeople">Number
										of People Living In The House:</label> <br> 
										<input type="text" id="numPeople" class="word" name="people" value="${user.people}" />
								</div>
							</div>

							<div class="form-row">
								<div class="form-group">
									<label for="Address">Address:</label> <br> 
									<input type="text" id="Address" class="word" name="address" value="${user.address}" />
								</div>

								<div class="form-group">
									<label for="fileUpload">Proof of residency:</label> 
									<br> 
									<input
										type="file" id="fileUpload" class="word" name="residency"
										accept="image/*">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group">
									<label for="area">Area:</label> <br> 
									<select id="area" class="word" name="area" onchange="${user.area}" required >
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

								<div class="form-group">
									<label for="fileUpload1">Identification Card:</label> <br>
									<input
										type="file" id="fileUpload1" class="word" name="icproof"
										accept="image/*" value="${user.ic_card}" >
								</div>
							</div>
							<input type="hidden" name="id" value="${user.id}" />
							<div style="text-align: center; margin-top: 30px;">
								<input type="submit" class="btn edit-btn" value="Update Profile">
							</div>
						</form>
					</div>
				</div>

			</div>


		</div>
	</div>


	<script>
		
	</script>

</body>
</html>

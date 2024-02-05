<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.*"%>
<%@ page import="com.model.User"%>

<%
	User user = (User) request.getAttribute("user");
	if (user != null) {
		String status = user.getStatus();
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<title>GoGreen</title>
<style type="text/css">
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
			<jsp:include page="../sidebar.jsp" />
		</div>

		<div class="pageWrapper">
			<jsp:include page="../headerBar.jsp" />

			<div class="pageContent">
				<div class="pageNav">
					Home > <a href="profile">Profile</a>
				</div>

				<div id="content" class="content" size="A4">
					<h2 class="pageTitle">Profile Information</h2>
					<p style="font-weight: bold;">Status: ${user.status}</p>
					<div class="form">
						<form method="post"
							action="<%=request.getContextPath()%>/editProfile"
							enctype="multipart/form-data">
							<div class="form-row">
								<div class="form-group">
									<label for="firstName">First Name:</label> <br>
									<p class="word">${user.firstName}</p>
								</div>

								<div class="form-group">
									<label for="lastName">Last Name:</label> <br>
									<p class="word">${user.lastName}</p>
								</div>
							</div>

							<div class="form-row">

								<div class="form-group">
									<label for="phoneNo">Phone Number:</label> <br>
									<p class="word">${user.phoneNo}</p>
								</div>

								<div class="form-group">
									<label for="email">Email:</label> <br>

									<p class="word">${user.email}</p>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group">
									<label for="category">NRIC:</label> <br>
									<p class="word">${user.ic}</p>
								</div>

								<div class="form-group">
									<label for="fileUpload1">Identification Card:</label> <br>
									<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#icModal${user.id}">
									  View IC
									</button>
									<div class="modal fade" id="icModal${user.id}" tabindex="-1" aria-labelledby="#icModalLabel" aria-hidden="true">
									  <div class="modal-dialog">
									    <div class="modal-content">
									      <div class="modal-header">
									        <h1 class="modal-title fs-5" id="icModalLabel">View IC</h1>
									        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									      </div>
									      <div class="modal-body" style="text-align: center;">
									      <!-- display image -->
									      
									      	<img class="icCardImg" width="400px" src="data:image/*;base64,${Base64.getEncoder().encodeToString(user.ic_card)}" alt="Image" />			      	
									      
									      </div>
									      <div class="modal-footer">
									        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
									      </div>
									    </div>
									  </div>
									</div>
								</div>
							</div>
							
							<div class="form-row">
								<div class="form-group">					
									<label for="category">Category:</label> <br>
									<p class="word">${user.category}</p>
								</div>
								<div class="form-group">
									<label for="Area">Area:</label> <br>
									<p class="word">${user.area}</p>
								</div>
							</div>
							
							<div class="form-row">
								<div class="form-group">
									<label for="Address">Address:</label> <br>
									<p class="word">${user.address}</p>
								</div>

								<div class="form-group">
									<label for="Address">Proof of residency:</label> 
									<br> 
									<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#residencyModal${user.id}">
									  View Residency
									</button>
									<div class="modal fade" id="residencyModal${user.id}" tabindex="-1" aria-labelledby="#residencyModalLabel" aria-hidden="true">
									  <div class="modal-dialog">
									    <div class="modal-content">
									      <div class="modal-header">
									        <h1 class="modal-title fs-5" id="residencyModalLabel">View Residency</h1>
									        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									      </div>
									      <div class="modal-body" style="text-align: center;">
											<!-- display image -->
									      	<img class="residencyImg" width="400px" src="data:image/*;base64,${Base64.getEncoder().encodeToString(user.file)}" alt="Image" />			      	
									      </div>
									      <div class="modal-footer">
									        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
									      </div>
									    </div>
									  </div>
									</div>

								</div>
							</div>

							<div class="form-row">
								<div class="form-group">
									<label for="Number of People Living In The House">Number
										of People Living In The House:</label> <br>
									<p class="word">${user.people}</p>
								</div>

								<div class="form-group">
									
								</div>
							</div>

							<%
								String status = user.getStatus();
								if ("pending".equals(status)) {
							%>
							<div class="text-center mt-3">
								<input type="submit" class="edit-btn" value="Edit" id="edit-button">
							</div>
							<%
								}
							%>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>

</html>

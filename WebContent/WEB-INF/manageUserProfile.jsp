<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
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
}
label{
	margin-bottom: 5px;
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
					Home > <a href="${pageContext.request.contextPath}/manageUser">Manage
						User</a>
				</div>

				<form action="ProfileServlet" method="post"
					enctype="multipart/form-data">

					<div class="content">
						<h2 class="pageTitle">User Information</h2>

						<div class="form">
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
									<label for="category">Category:</label> <br>
									<p class="word">${user.category}</p>

								</div>

								<div class="form-group">
									<label for="Number of People Living In The House">Number
										of People Living In The House:</label> <br>
									<p class="word">${user.people}</p>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group">
									<label for="Address">Address:</label> <br>
									<p class="word">${user.address}</p>
								</div>

								<div class="form-group">
									<label for="fileUpload">Proof of residency:</label> <br>
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
									<label for="Area">Area:</label> <br>
									<p class="word">${user.area}</p>
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

							<div class="button mt-3 text-center">
								<button type="button" class="btn btn-outline-success me-4" id="approve-button" onclick="approve()">Approve</button>
								<button type="button" class="btn btn-outline-danger" class="btn" id="reject-button" onclick="reject()">Reject</button>
							</div>

						</div>
					</div>

				</form>


			</div>
		</div>
	</div>
	<script>
		function approve() 
		{
			window.location
			.assign("${pageContext.request.contextPath}/Approve?userId=${user.id}");

		}

		function reject() {

			window.location
					.assign("${pageContext.request.contextPath}/Reject?userId=${user.id}");
		}
	</script>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>

</html>

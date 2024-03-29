<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.*"%>
<%@ page import="com.model.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	gap: 50px;
	margin: 10px 0;
}

.form-group{
	flex: 1;
}

.form-control{
	width: 100%;
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
					Home > <a href="profile">Profile</a> > <a
						href="editProfile">Edit Profile</a>
				</div>

				<div id="content">
					<h2 class="pageTitle">Profile Information</h2>

					<div class="form">
						<form method="post" action="<%=request.getContextPath()%>/updateProfile" enctype="multipart/form-data">
							<div class="form-row">
								<div class="form-group">
									<label for="firstName" class="form-label">First Name:</label> 
									<input type="text" id="firstName" class="form-control" name="firstName" value="${user.firstName}" />
								</div>

								<div class="form-group">
									<label for="lastName" class="form-label">Last Name:</label> 
									<input type="text" id="lastName" class="form-control" name="lastName" value="${user.lastName}" />
								</div>
							</div>

							<div class="form-row">
								<div class="form-group">
									<label for="phoneNo" class="form-label">Phone Number:</label> 
									<input type="tel" id="phoneNo" name="phoneNo" pattern="[0-9]{11}" class="form-control" value="${user.phoneNo}" required />	
								</div>
								<div class="form-group" class="form-label">
									<label for="email">Email:</label>  
									<input type="text" id="email" class="form-control" name="email" value="${user.email}" />
								</div>
							</div>

							<div class="form-row">
							
								<div class="form-group" class="form-label">
									<label for="ic">NRIC:</label>  
									<input type="text" id="ic" class="form-control" name="ic" value="${user.ic}" />
								</div>
							
								<c:if test="${user.status.equals('approve')}">
									<div class="form-group">
										<label for="fileUpload1" class="form-label">Identification Card:</label> <br>
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
								</c:if>
								<c:if test="${not user.status.equals('approve')}">
									<div class="form-group">
										<label for="ic_card" class="form-label">Identification Card:</label> 
										<input type="file" id="ic_card" class="form-control" name="icproof" accept="image/*">
									</div>
								</c:if>
	
							</div>

							<div class="form-row">
								<div class="form-group">
									<label for="category" class="form-label">Category:</label>  
									<select id="category" class="form-select" name="category" required ${user.status.equals("approve") ? "disabled" : ""}>
										<option value="Housing (High Rise)" ${user.category.equals("Housing (High Rise)") ? "selected" : ""}>Housing (High Rise)</option>
	   									<option value="Housing (Landed)" ${user.category.equals("Housing (Landed)") ? "selected" : ""}>Housing (Landed)</option>
	   									<option value="Institution" ${user.category.equals("Institution") ? "selected" : ""}>Institution</option>
									</select>
									<c:if test="${user.status.equals('approve')}">
										<input type="hidden" name="category" value="${user.category}"/>
									</c:if>
								</div> 
								<div class="form-group">
									<label for="area" class="form-label">Area:</label>  
									<select id="area" class="form-select" name="area" required ${user.status.equals("approve") ? "disabled" : ""}>
										<option value="Pulai Indah" ${user.area.equals("Pulai Indah") ? "selected" : ""}>Pulai Indah</option>
									    <option value="Kangkar Pulai" ${user.area.equals("Kangkar Pulai") ? "selected" : ""}>Kangkar Pulai</option>
									    <option value="Pulai Utama" ${user.area.equals("Pulai Utama") ? "selected" : ""}>Pulai Utama</option>
									    <option value="Sri Pulai" ${user.area.equals("Sri Pulai") ? "selected" : ""}>Sri Pulai</option>
									    <option value="Taman Universiti" ${user.area.equals("Taman Universiti") ? "selected" : ""}>Taman Universiti</option>
									    <option value="Mutiara Rini" ${user.area.equals("Mutiara Rini") ? "selected" : ""}>Mutiara Rini</option>
									    <option value="Lima Kedai" ${user.area.equals("Lima Kedai") ? "selected" : ""}>Lima Kedai</option>
									    <option value="Nusa Bayu" ${user.area.equals("Nusa Bayu") ? "selected" : ""}>Nusa Bayu</option>
									    <option value="Gelang Patah" ${user.area.equals("Gelang Patah") ? "selected" : ""}>Gelang Patah</option>
									    <option value="Leisure Farm" ${user.area.equals("Leisure Farm") ? "selected" : ""}>Leisure Farm</option>
									    <option value="Tanjung Kupang" ${user.area.equals("Tanjung Kupang") ? "selected" : ""}>Tanjung Kupang</option>
									    <option value="Medini Iskandar" ${user.area.equals("Medini Iskandar") ? "selected" : ""}>Medini Iskandar</option>
									    <option value="Kota Iskandar" ${user.area.equals("Kota Iskandar") ? "selected" : ""}>Kota Iskandar</option>
									    <option value="Bukit Horizon" ${user.area.equals("Bukit Horizon") ? "selected" : ""}>Bukit Horizon</option>
									    <option value="Impian Emas" ${user.area.equals("Impian Emas") ? "selected" : ""}>Impian Emas</option>
									    <option value="Sri Skudai" ${user.area.equals("Sri Skudai") ? "selected" : ""}>Sri Skudai</option>
									    <option value="Skudai" ${user.area.equals("Skudai") ? "selected" : ""}>Skudai</option>
									    <option value="Skudai Baru" ${user.area.equals("Skudai Baru") ? "selected" : ""}>Skudai Baru</option>
									    <option value="Selesa Jaya" ${user.area.equals("Selesa Jaya") ? "selected" : ""}>Selesa Jaya</option>
									    <option value="Tun Aminah" ${user.area.equals("Tun Aminah") ? "selected" : ""}>Tun Aminah</option>
									    <option value="Nusa Bestari" ${user.area.equals("Nusa Bestari") ? "selected" : ""}>Nusa Bestari</option>
									    <option value="Bukit Indah" ${user.area.equals("Bukit Indah") ? "selected" : ""}>Bukit Indah</option>
									    <option value="Sutera Utama" ${user.area.equals("Sutera Utama") ? "selected" : ""}>Sutera Utama</option>
									    <option value="Perling" ${user.area.equals("Perling") ? "selected" : ""}>Perling</option>
									</select>
									<c:if test="${user.status.equals('approve')}">
										<input type="hidden" name="area" value="${user.area}"/>
									</c:if>
								</div>
							</div>
							
							<div class="form-row">
								<div class="form-group">
									<label for="Address" class="form-label">Address:</label>  
									<input type="text" id="Address" class="form-control" name="address" value="${user.address}" ${user.status.equals("approve") ? "disabled" : ""}/>
									<c:if test="${user.status.equals('approve')}">
										<input type="hidden" name="address" value="${user.address}"/>
									</c:if>
								</div>

								<c:if test="${user.status.equals('approve')}">
									<div class="form-group">
										<label for="Address" class="form-label">Proof of residency:</label> <br>
										 
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
								</c:if>
								<c:if test="${not user.status.equals('approve')}">
									<div class="form-group">
										<label for="fileUpload" class="form-label">Proof of residency:</label> 
										<input type="file" id="fileUpload" class="form-control" name="residency" accept="image/*">
									</div>
								</c:if>
							</div>
							
							<div class="form-row">
								<div class="form-group">
									<label for="people" class="form-label">Number Of People Living:</label> 
									<input type="number" id="people" name="people" class="form-control" required>
								</div>
								<div class="form-group"></div>
							</div>
							
							<input type="hidden" name="id" value="${user.id}" />
							<input type="hidden" name="status" value="${user.status}" />
							
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
   
    var userPeople = ${user.people};

    document.getElementById('people').value = userPeople;
</script>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>

</html>
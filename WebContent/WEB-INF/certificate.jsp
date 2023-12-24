<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GoGreen Certificate</title>
<style>

.pageContent{
	padding: 30px 60px;
}

.hero {
	position: relative;
	background-repeat: no-repeat;
	background-size: cover;
	background-attachment: fixed;
	font-family: 'Poppins', sans-serif;
	margin: 0 auto;
	padding-top: 20px;
	width: 80%;
	text-align: center;
}

.hero img {
	width: 100%;
	height: auto;
	display: block;
	margin: 0 auto;
}

.certificate-text {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: #161A30;
	font-size: 24px;
	font-weight: center;
	z-index: 1;
}

.certificate-text h2 {
	font-size: 55px;
	margin-bottom: 10px;
	padding-top: 0;
	margin-top: 0;
	line-height: 1;
}

.certificate-text .bold {
	font-weight: bold;
	display: inline-block;
	font-size: 40px;
	padding-bottom:15px;
	margin-bottom: 40px;
}


.certificate-text h6 {
	font-size: 16px;
	font-weight: normal;
	padding-bottom: 50px;
}

#btn{
	text-decoration: none;
	padding: 15px;
	background-color: #f2bc85;
	color: white;
	border-radius: 15px;
	border: none;
	cursor: pointer;
}
  
#btn:hover{
	border: black solid 0.5px;
}

.download{	
	text-align:center;
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
					Home > 
					<a href="${pageContext.request.contextPath}/userDashboard">Dashboard</a>
				</div>

				<div class="hero">
					<img src="${pageContext.request.contextPath}/resources/images/certificate.png" alt="Certificate Image">
					<div class="certificate-text">
						<h2>
							<span class="bold">Certificate of Participation</span>
						</h2>
						<p>This Certificate is Awarded to</p>
						<h1>NAME</h1>
						<h6>Has successfully completed the requirement of providing a
							bill lasting six consecutive months, convering the period from
							[Start Month] to [End Month]</h6>

					</div>
				</div>
				
				<div class="download">
						<button type="download" value="Download" id="btn">Download</button>
						</div>

			</div>
		</div>

	</div>
	</div>
</body>
</html>

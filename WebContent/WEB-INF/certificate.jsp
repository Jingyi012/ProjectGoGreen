<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- Add these links in the <head> section of your HTML -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UoUChUZsXl5uWvA8INMD4qlzxAxU1E6hQwBQDv2xH2M0I/6Z6b9TMbXQK/pT3J"
	crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GoGreen Certificate</title>
<style>
.pageContent {
	padding: 30px 60px;
}

.hero {
	position: relative;
	background-repeat: no-repeat;
	background-size: cover;
	background-attachment: fixed;
	font-family: 'Poppins', sans-serif;
	padding-top: 0px;
	width: 80%;
	max-width: 650px;
	text-align: center;
	margin: 30px auto;
}

.hero img {
	width: 100%;
	height: auto;
	display: block;
	margin: 0 auto;
}

.certificate-text {
	position: absolute;
	top: 45%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: #161A30;
	font-size: 18px;
	font-weight: center;
	z-index: 1;
	width: 100%;
	margin-bottom: 50px;
}

.certificate-text h2 {
	font-size: 80px;
	margin-bottom: 0;
	padding-top: 0;
	margin-top: 0;
	line-height: 1;
}

.certificate-text h1 {
	font-size: 28px;
}

.certificate-text .bold {
	font-weight: bold;
	display: inline-block;
	font-size: 24px;
	padding-bottom: 15px;
	margin-bottom: 20px;
}

.certificate-text h6 {
	font-size: 12px;
	font-weight: normal;
	padding-bottom: 30px;
}

#btn {
	text-decoration: none;
	padding: 15px;
	background-color: #f2bc85;
	color: white;
	border-radius: 15px;
	border: none;
	cursor: pointer;
}

#btn:hover {
	border: black solid 0.5px;
}

.download {
	text-align: center;
}

#content {
	text-align: center;
	margin: 50px auto;
}

#downloadBtn {
	padding: 10px 20px;
	background-color: #3498db;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.calendarYear {
	text-align: center;
	margin: 10px 0 20px 0;
	cursor: pointer;
	font-size: 20px;
}

#yearSelect {
	font-size: 20px;
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
					Home > <a href="${pageContext.request.contextPath}/userDashboard">Dashboard</a>
					<div id="calendarYear" class="calendarYear">
						<i class="bi bi-caret-left-fill"></i> <select id="yearSelect">
							<option>2021</option>
							<option>2022</option>
							<option selected>2023</option>
						</select> <i class="bi bi-caret-right-fill"></i>
					</div>

				</div>

				<div class="hero">

					<div class="certificate-text">

						<!-- Display the certificate details only if eligible -->
						<c:if test="${certificateEligible}">
							<img
								src="${pageContext.request.contextPath}/resources/images/certificate.png"
								alt="Certificate Image">

							<h2>
								<span class="bold">Certificate of Participation</span>
							</h2>
							<p>This Certificate is Awarded to</p>
							<h1>${user.firstName}${user.lastName}</h1>
							<h6>
								Has successfully completed the requirement of providing a bill
								lasting six consecutive months
							</h6>
						</c:if>

						<!-- Display the message only if not eligible -->
						<c:if test="${!certificateEligible}">
							<h6 ><b><br><br>You are not eligible for a certificate. Please fulfill
								the requirements.</b></h6>
						</c:if>
					</div>

					<!-- Display the button only if eligible -->
					<c:if test="${certificateEligible}">
						<div class="download">
							<button type="button" id="btn" onclick="downloadPDF()">Download
								PDF</button>
						</div>
					</c:if>
				</div>
			</div>
		</div>
		</div>
		<script
			src="https://rawgit.com/eKoopmans/html2pdf/master/dist/html2pdf.bundle.js"></script>
		<script>
			function downloadPDF() {
				var element = document.querySelector('.hero');

				html2pdf(element, {
					margin : 10,
					filename : 'Certificate.pdf',
					image : {
						type : 'jpeg',
						quality : 0.98
					},
					html2canvas : {
						scale : 2
					},
					jsPDF : {
						unit : 'mm',
						format : 'a4',
						orientation : 'portrait'
					}
				});
			}
		</script>

		<script>
			$(document).ready(
					function() {
						updateCalendar(2023);

						$('#yearSelect').change(function() {
							updateCalendar($(this).val());
						});

						$('.bi-caret-left-fill').click(decrementSelect);
						$('.bi-caret-right-fill').click(incrementSelect);

						function updateCalendar(year) {
							$.ajax({
								type : 'GET',
								url : '${pageContext.request.contextPath}/certificate',
								data : {
									year : year
								},
								success : function(response) {
									$('#calendar').html(response);
									$('#calendar').hide().fadeIn(500);
								},
								error : function(error) {
									console.error(
											'Error updating included page:',
											error);
								}
							});
						}

						function incrementSelect() {
							var select = $('#yearSelect');
							var newIndex = Math.min(
									select[0].options.length - 1, select
											.prop('selectedIndex') + 1);
							if (newIndex !== select.prop('selectedIndex')) {
								select.prop('selectedIndex', newIndex);
								updateCalendar(select.val());
							}
						}

						function decrementSelect() {
							var select = $('#yearSelect');
							var newIndex = Math.max(0, select
									.prop('selectedIndex') - 1);
							if (newIndex !== select.prop('selectedIndex')) {
								select.prop('selectedIndex', newIndex);
								updateCalendar(select.val());
							}
						}
					})
		</script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GoGreen</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/billReport.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"
	integrity="sha512-GsLlZN/3F2ErC5ifS5QtgpiJtWd43JWSuIgh7mbzZ8zBps+dvLusV+eNQATqgA/HdeKFVgA5v3S/cIrLF7QnIg=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<style>
.pageContent {
	padding: 30px 60px;
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
					Home > <a href="${pageContext.request.contextPath}/bills">Bills</a>
					> <a href="${pageContext.request.contextPath}/bills/waterBill">Water
						Bills</a> > ${month} ${year}

				</div>
				<h2 class="pageTitle">Water Bills</h2>

				<div class="reportContainer" id="reportContainer" size="A4">
					<h2 class="pageTitle" id="dTitle"
						style="display: none; margin-bottom: 20px;">Water Bill</h2>
					<table class="reportTable">
						<tr>
							<th>Address:</th>
							<td id="address">${user.address}</td>
						</tr>
						<tr>
							<th>Name:</th>
							<td id="name">${user.firstName} ${user.lastName}</td>
						</tr>
						<tr>
							<th>Month:</th>
							<td id="date">${month}</td>
						</tr>
						<tr>
							<th>Year:</th>
							<td id="year">${year}</td>
						</tr>
						<tr>
						<tr>
							<th>Water Consumption(L):</th>
							<fmt:formatNumber value="${waterBill.water_consumption}" pattern="#,##0.00" var="water_consumption" />
							<td id="waterConsumption">${water_consumption}</td>
						</tr>
						<tr>
							<th>Carbon Footprint(kgCO2):</th>
							<fmt:formatNumber value="${waterBill.carbon_footprint}" pattern="#,##0.00" var="carbon_footprint" />
							<td id="CarbonFootprint">${carbon_footprint}</td>
						</tr>

					</table>

					<button class="downloadButton" onclick="downloadPdf()"
						id="downloadButton">Download File</button>

				</div>
			</div>


		</div>
	</div>
	<script>
	    function downloadPdf() {
	        const element = document.getElementById('reportContainer');
	        var button = document.getElementById("downloadButton");
	        button.style.display = "none";
	        var title = document.getElementById('dTitle');
	        const titleCopy = title.cloneNode(true);
	        element.insertBefore(titleCopy, element.firstChild);
	        titleCopy.style.display = ""
	        const opt = {
       		margin: 1,
       		  filename: 'waterReport_${month}_${year}.pdf',
       		  image: { type: 'jpeg', quality: 0.98 },
       		  jsPDF: { unit: 'mm', format: 'A4', orientation: 'portrait' }
       		};
	
	        html2pdf().set(opt).from(element).save().then(() => {
                element.removeChild(titleCopy);
                button.style.display = "";
            });;
	    }
	</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.text.SimpleDateFormat, java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String [] months = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
	pageContext.setAttribute("months", months);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GoGreen</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/report.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
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
					Home > 
					<a href="${pageContext.request.contextPath}/adminReport">Report</a>
				</div>
			
				 <div class="tabs">
                    <button class="tablinks" onclick="openTab(event, 'Monthly')" id="defaultOpen">Monthly</button>
                    <button class="tablinks" onclick="openTab(event, 'Yearly')">Yearly</button>
                </div>
				
				<div id="Monthly" class="table-content">
					<div>
						<h2>Monthly Report</h2>
					</div>
					<table class="table table-hover table-bordered">
						<tr class="table-secondary">
							<th class="date-col"  colspan="2">Date</th>
							<th class="description-col" colspan="4">Description</th>
							<th class="action-col">Action</th>
						</tr>
						<c:forEach var="year" begin="2021" end="2023" >
				            <c:forEach var="month" begin="1" end="12" >
				                <tr>
									<td class="date-col" colspan="2">${months[month-1]} ${year}</td>
									<td class="description-col" colspan="4">Carbon Footprint Report ${months[month-1]} ${year}</td>
									<td class="action-col download-icon"><a href="${pageContext.request.contextPath}/monthReport?month=${month}&year=${year}"><i class="fas fa-download"></i></a></td>
								</tr>
				            </c:forEach>
				        </c:forEach>

					</table>
				</div>
				
				<div id="Yearly" class="table-content">
					<div>
						<h2>Yearly Report</h2>
					</div>
                    <table class="table table-hover table-bordered">
                        <tr class="table-secondary">
                            <th class="date-col">Date</th>
                            <th class="description-col" colspan="4">Description</th>
                            <th class="action-col">Action</th>
                        </tr>
                        <c:forEach var="year" begin="2021" end="2023" >
				            <tr>
	                            <td class="date-col">${year}</td>
	                            <td class="description-col" colspan="4">Carbon Footprint Report ${year}</td>
	                            <td class="action-col download-icon"><a href="${pageContext.request.contextPath}/yearReport?year=${year}"><i class="fas fa-download"></i></a></td>
	                        </tr>
				        </c:forEach>

                    </table>
                </div>
            </div>
        </div>
    </div>

    <script>

		function openTab(evt, tabName) {
			var i, tableContent, tablinks;
			tableContent = document.getElementsByClassName("table-content");
			for (i = 0; i < tableContent.length; i++) {
				tableContent[i].style.display = "none";
			}
			
			tablinks = document.getElementsByClassName("tablinks");
			for (i = 0; i < tablinks.length; i++) {
				tablinks[i].className = tablinks[i].className.replace(" active", "")
			}
	
			document.getElementById(tabName).style.display="block";
			evt.currentTarget.className+=" active";
		}
		document.getElementById("defaultOpen").click();
	</script>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>

</html>
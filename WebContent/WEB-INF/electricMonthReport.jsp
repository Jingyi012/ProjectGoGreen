<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GoGreen</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/billReport.css" />
<style>
    .pageContent{
        padding: 30px 60px;
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
					<a href="${pageContext.request.contextPath}/bills">Bills</a> >
					<a href="${pageContext.request.contextPath}/bills/electricBill">Electric Bills</a> >
                    ${month} ${year}
				</div>
				<h2 class="pageTitle">Electric Bills</h2>
				
				<div class="reportContainer">
					<table class="reportTable">
						<tr>
							<th>Address:</th>
							<td id="address">12 Jalan Indah 14/5, Bukit Indah, Iskandar Puteri, Johor</td>
						</tr>
						<tr>
							<th>Date:</th>
							<td id="date">12.6.2023 - 12.7.2023</td>
						</tr>
						<tr>
							<th>Electric Consumption(kWh):</th>
							<td id="electricConsumption">186</td>
						</tr>
						<tr>
							<th>Factor Prorate(Day):</th>
							<td id="electricProrate">1.000000</td>
						</tr>
						<tr>
							<th>Current Charge(RM):</th>
							<td id=electricCharge>13.60</td>
						</tr>
						<tr>
							<th>Carbon Footprint(kWhCO2):</th>
							<td id=CarbonFootprint>108.624</td>
						</tr>
					</table>
					
					<button class="downloadButton">Download File</button>
						
				</div>      	
        	
        	</div>
        </div>
        
          
    </div>

</body>
</html>
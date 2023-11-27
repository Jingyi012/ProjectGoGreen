<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>GoGreen</title>
	<link rel="stylesheet" href="./css/userDashboard.css" />
    <link rel="stylesheet" href="./css/adminDashboard.css" />
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
					<a href="adminDashboard.jsp">Dashboard</a>
				</div>
        		<div class="wholeCarbonFootprintDetails">
        			<div class="itemblock red">
                        <span>High Carbon Emission Area</span>
                        <p>Gelang Patah</p>
                    </div>
                    <div class="itemblock green">
                        <span>Low Carbon Emission Area</span>
                        <p>Iskandar Puteri</p>
                    </div>
                    <div class="itemblock blue">
                        <span>Total Participant</span>
                        <p>10094</p>
                    </div>
                    <div class="itemblock yellow">
                        <span>Total Carbon Emission</span>
                        <p>10094kgCO<sub>2</sub></p>
                    </div>
        		</div>

				<div class="areaCarbonFootprint">
					<div class="mapping">
						This is Map

					</div>
					<div class="areaCarbonTable">
						<h3>Total Carbon Footprint of Each Area</h3>
						<table>
							<tr>
								<th>Area Name</th>
								<th>Water Consumption (L)</th>
								<th>Electric Consumption (kWh)</th>
								<th>Recycle Weight (kg)</th>
								<th>Total Participant (people)</th>
								<th>Total Carbon Footprint (kgCO<sub>2</sub>)</th>
							</tr>
							<tr>
								<td>Iskandar Puteri</td>
								<td>1133</td>
								<td>1234</td>
								<td>334</td>
								<td>1245</td>
								<td>3341</td>
							</tr>
						</table>

					</div>

				</div>
				
				<div class="moreDetails">
					<div class="graph1">
						<h4>Trend of Carbon Footprint</h4>
					</div>
					
					<div class="categoryAvg">
						<h4>User Average Carbon Footprint (kgCO<sub>2</sub>)</h4>
						<table>
							<tr>
								<td>Housing (High Rise)</td>
								<td>1032</td>
							</tr>
							<tr>
								<td>Housing (Landed)</td>
								<td>1234</td>
							</tr>
							<tr>
								<td>Institution</td>
								<td>2523</td>
							</tr>
						</table>
					</div>
				
				</div>
        	</div>
        </div>
    </div>
</body>
</html>
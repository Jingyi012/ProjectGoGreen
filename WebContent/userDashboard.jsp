<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>GoGreen</title>
	<link rel="stylesheet" href="./css/userDashboard.css" />
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
					<a href="userDashboard.jsp">Dashboard</a>
				</div>
        		<div class="myCarbonFootprint">
        			<h2 style="margin: 0 0 20px 0">My Carbon Footprint</h2>
        			<div class="monthSelect">
        				<i class="bi bi-calendar"></i>
        				<select>
        				<% 
        				String[] monthArray = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"}; 
            			for(int i=0; i<12; i++){ %>
        					<option><%= monthArray[i] %></option>
        				<% } %>
        				</select>
        			</div>
        			<div class="carbonFootprintDetails">
        				<div class="detailItemBlock water">
							<i class="bi bi-droplet"></i>
							<span> 208 L</span>
        				</div>
        				<div class="detailItemBlock electric">
							<i class="bi bi-lightning-charge"></i>
							<span> 208 kWh</span>
        				</div>
        				<div class="detailItemBlock recycle">
							<i class="bi bi-recycle"></i>
							<span> 208 kg</span>
        				</div>
        				<div class="detailItemBlock carbonFootprint">
							<img src="./images/carbonFootprint.png" alt="carbonFootprint.png" width="30px" />
							<span>120 kgCO<sub>2</sub></span>
        				</div>
        			</div>
        		</div>

				<div class="areaCarbonFootprint">
					<div class="mapping" id="map1">
						<iframe style="width: 100%" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3988.3816941312375!2d103.65650037803128!3d1.5376092944462916!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31da733232b8cc9d%3A0xe7509f37fa103de9!2sDATARAN%20MBIP!5e0!3m2!1szh-CN!2smy!4v1701625536222!5m2!1szh-CN!2smy" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>

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

        	</div>
        </div>
    </div>
</body>
</html>
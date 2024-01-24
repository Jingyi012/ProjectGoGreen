<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>GoGreen</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/userDashboard.css" />
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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
        		<div class="myCarbonFootprint">
        			<h2 style="margin: 0 0 20px 0">My Carbon Footprint</h2>
        			<div class="monthYearSelect">
        				<i class="bi bi-calendar"></i>
        				<select id="monthSelect">
        				<% 
        				String[] monthArray = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"}; 
            			for(int i=0; i<12; i++){ %>
        					<option value="<%= i+1 %>"><%= monthArray[i] %></option>
        				<% } %>
        				</select>
        				<select id="yearSelect">
        					<option>2021</option>
        					<option>2022</option>
        					<option selected>2023</option>
        				</select>
        			</div>
        			<div class="carbonFootprintDetails" id="carbonFootprintDetails">
        				
        			</div>
        		</div>

				<div class="areaCarbonFootprint">
					<div class="mapping" id="barChart">

					</div>
					<div class="areaCarbonTable">
						<h3>Total Carbon Footprint of Each Area 2023</h3>
						<div class="areaCarbonTableDetails">
							<table>
								<tr>
									<th>Area Name</th>
									<th>Water Consumption (L)</th>
									<th>Electric Consumption (kWh)</th>
									<th>Recycle Weight (kg)</th>
									<th>Total Participant (people)</th>
									<th>Total Carbon Footprint (kgCO<sub>2</sub>)</th>
								</tr>
								<%-- <% 
								String[] areaDetails = {
										"Pulai Indah",
							            "Kangkar Pulai",
							            "Pulai Utama",
							            "Sri Pulai",
							            "Taman Universiti",
							            "Mutiara Rini",
							            "Lima Kedai",
							            "Nusa Bayu",
							            "Gelang Patah",
							            "Leisure Farm",
							            "Tanjung Kupang",
							            "Medini Iskandar",
							            "Kota Iskandar",
							            "Bukit Horizon",
							            "Impian Emas",
							            "Sri Skudai",
							            "Skudai",
							            "Skudai Baru",
							            "Selesa Jaya",
							            "Tun Aminah",
							            "Nusa Bestari",
							            "Bukit Indah",
							            "Sutera Utama",
							            "Perling"
							        };
								for(int i=0; i < areaDetails.length; i++){ %>
								<tr>
									<td><%= areaDetails[i] %></td>
									<td>1133</td>
									<td>1234</td>
									<td>334</td>
									<td>1245</td>
									<td>3341</td>
								</tr>
								<% } %> --%>
								<c:forEach var="areaCarbonList" items="${areaCarbonList}">
								<tr>
									<td><c:out value="${areaCarbonList.area}"/></td>
									<td><c:out value="${areaCarbonList.water_consumption}"/></td>
									<td><c:out value="${areaCarbonList.electric_consumption}"/></td>
									<td><c:out value="${areaCarbonList.recycle_weight}"/></td>
									<td><c:out value="${areaCarbonList.num_participant}"/></td>
									<td><c:out value="${areaCarbonList.sum_cf}"/></td>
								</tr>
								</c:forEach>
							</table>
						</div>

					</div>

				</div>

        	</div>
        </div>
    </div>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script>
    	google.charts.load('current', {'packages':['corechart']});
    	google.charts.setOnLoadCallback(drawChart2);

	  function drawChart2() {

		  var areaData = [["Area", "Carbon Footprint", { role: "style" } ]];
		  
		  <%-- <% int[] fourDigitNumbers = {1234, 9678, 4321, 5876, 2468, 1357, 8765, 3456, 7890, 2109, 6543, 8901, 4325, 6789, 1098, 5432, 8761, 2345, 8907, 4567, 5432, 9876, 2109, 8765};
		  	for(int i=0; i<areaDetails.length; i++){ %>
		  		areaData.push(["<%= areaDetails[i] %>", <%= fourDigitNumbers[i] %>, ""]);
		  	<% } %> --%>
	      /* var dataAreaCarbon = google.visualization.arrayToDataTable([
	        ["Area", "Carbon Footprint", { role: "style" } ],
	        ["Copper", 8.94, ""],
	        ["Silver", 10.49, "silver"],
	        ["Gold", 19.30, "gold"],
	        ["Platinum", 21.45, "color: #e5e4e2"]
	      ]); */

	      <c:forEach var="areaCarbon" items="${areaCarbonList}">
	        areaData.push(["${areaCarbon.area}", ${areaCarbon.sum_cf}, ""]);
	    </c:forEach>
	      
	      var dataAreaCarbon = google.visualization.arrayToDataTable(areaData);
	      var view = new google.visualization.DataView(dataAreaCarbon);
	      view.setColumns([0, 1,
	                       { calc: "stringify",
	                         sourceColumn: 1,
	                         type: "string",
	                         role: "annotation" },
	                       2]);

	      var options = {
	        title: "Carbon Footprint at Each Area 2023",
	        titleTextStyle: {
	            fontSize: 18
	          },
	        bar: {groupWidth: "50%"},
	        legend: { position: "none" },
	        hAxis: {
	            title: "Carbon Footprint",
	            minValue: 0,
	        },
	        vAxis: {
	            title: "Area",     
	        }
	        
	      };
	      var chart = new google.visualization.BarChart(document.getElementById("barChart"));
	      chart.draw(view, options);
	  }
    </script>
    <script>
    	$(document).ready(function(){
			
			var currentDate = new Date();
			document.getElementById('monthSelect').value = currentDate.getMonth() + 1; 
		    //document.getElementById('yearSelect').value = currentDate.getFullYear();
					
			updateMyCarbonFootprint(currentDate.getMonth() + 1, 2023);

			$('#yearSelect').change(function () {
		        var month = $('#monthSelect').val();
		        var year = $(this).val();
		        updateMyCarbonFootprint(month, year);
		    });

		    $('#monthSelect').change(function () {
		        var month = $(this).val();
		        var year = $('#yearSelect').val();
		        updateMyCarbonFootprint(month, year);
		    });

		    function updateMyCarbonFootprint(month, year) {
		        $.ajax({
		            url: 'updateMyCarbonFootprint',
		            type: 'post',
		            data: { year: year, month: month },
		            success: function (data) {
		                $('#carbonFootprintDetails').html(data);
		            },
		            error: function (error) {
		                console.error('Error updating included page:', error);
		            }
		        });
		    }
		})

    </script>
</body>
</html>
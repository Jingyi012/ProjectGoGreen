<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>GoGreen</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/userDashboard.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminDashboard.css" />
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
					<a href="${pageContext.request.contextPath}/adminDashboard">Dashboard</a>
				</div>
        		<div class="wholeCarbonFootprintDetails">
        			<div class="itemblock red">
                        <span>High Carbon Emission Area</span>
                        <p>${highestArea.name}</p>
                    </div>
                    <div class="itemblock green">
                        <span>Low Carbon Emission Area</span>
                        <p>${lowestArea.name}</p>
                    </div>
                    <div class="itemblock blue">
                        <span>Total Participant</span>
                        <p>${totalParticipant}</p>
                    </div>
                    <div class="itemblock yellow">
                        <span>Total Carbon Emission</span>
                        <p>${totalCF} kgCO<sub>2</sub></p>
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
				
				<div class="moreDetails">
					<div class="graph1Container">
						<h3>Trend of Carbon Footprint 2023</h3>
						<div id="graph1">
							
						
						</div>
					</div>
					
					<div class="categoryAvg">
						<h3>User Average Carbon Footprint (kgCO<sub>2</sub>)</h3>
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

	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
	  google.charts.load('current', {'packages':['corechart']});
	  google.charts.setOnLoadCallback(drawChart);
	
	  function drawChart() {
		    
		    var monthData = [];
		    var month = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
		    var data = [1232, 1233, 4632, 1023, 3321, 5773, 2132, 3452, 3500, 4000, 3200, 3300];
		    for (var i = 0; i < data.length; i++) {
		        monthData.push([month[i], data[i]]);
		    }

		    var data = new google.visualization.DataTable();
			data.addColumn('string', 'Month');
			data.addColumn('number', "Carbon Footprint");
			data.addRows(monthData);

		    var options = {
		        hAxis: {
		            title: 'Month'
		        }, 
		        vAxis: {
		            title: 'Carbon Footprint (kgCO2)'
		        },
		        legend: { position: 'bottom' },
		        width: 730,
		        height: 300
		    };

		    var chart = new google.visualization.LineChart(document.getElementById('graph1'));

		    chart.draw(data, options);
		}

	  google.charts.setOnLoadCallback(drawChart2); 

	  function drawChart2() {

		  var areaData = [["Area", "Carbon Footprint", { role: "style" } ]];
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
</body>
</html>
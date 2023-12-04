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
		    /* var monthData = [['Month', 'Carbon Footprint']]; */
		    var monthData = [];
		    var month = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
		    var data = [1232, 1233, 4632, 1023, 3321, 5773, 2132, 3452, 3500, 4000, 3200, 3300];
		    for (var i = 0; i < data.length; i++) {
		        monthData.push([month[i], data[i]]);
		    }

		    /* var dataTable = google.visualization.arrayToDataTable(monthData); */
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
		        width: 700, 
		        height: 250
		    };

		    var chart = new google.visualization.LineChart(document.getElementById('graph1'));

		    chart.draw(data, options);
		}

	</script>
</body>
</html>
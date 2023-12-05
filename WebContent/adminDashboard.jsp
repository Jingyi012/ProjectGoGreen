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
                        <p>Kangkar Pulai</p>
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
								
								<% 
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
								<% } %>
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
		        width: 700,
		        height: 250
		    };

		    var chart = new google.visualization.LineChart(document.getElementById('graph1'));

		    chart.draw(data, options);
		}

	  google.charts.setOnLoadCallback(drawChart2);

	  function drawChart2() {

		  var areaData = [["Area", "Carbon Footprint", { role: "style" } ]];
		  
		  <% int[] fourDigitNumbers = {1234, 9678, 4321, 5876, 2468, 1357, 8765, 3456, 7890, 2109, 6543, 8901, 4325, 6789, 1098, 5432, 8761, 2345, 8907, 4567, 5432, 9876, 2109, 8765};
		  	for(int i=0; i<areaDetails.length; i++){ %>
		  		areaData.push(["<%= areaDetails[i] %>", <%= fourDigitNumbers[i] %>, ""]);
		  	<% } %>
	      /* var dataAreaCarbon = google.visualization.arrayToDataTable([
	        ["Area", "Carbon Footprint", { role: "style" } ],
	        ["Copper", 8.94, ""],
	        ["Silver", 10.49, "silver"],
	        ["Gold", 19.30, "gold"],
	        ["Platinum", 21.45, "color: #e5e4e2"]
	      ]); */
	      
	      var dataAreaCarbon = google.visualization.arrayToDataTable(areaData);
	      var view = new google.visualization.DataView(dataAreaCarbon);
	      view.setColumns([0, 1,
	                       { calc: "stringify",
	                         sourceColumn: 1,
	                         type: "string",
	                         role: "annotation" },
	                       2]);

	      var options = {
	        title: "Carbon Footprint at Each Area",
	        bar: {groupWidth: "50%"},
	        legend: { position: "none" },
	      };
	      var chart = new google.visualization.BarChart(document.getElementById("barChart"));
	      chart.draw(view, options);
	  }

	</script>
</body>
</html>
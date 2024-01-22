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
            			request.setAttribute("monthArray", monthArray);
            			%>
        				<c:forEach var="month" items="${monthArray}" varStatus="loop">
        					<option value="${loop.index + 1}">${month}</option>
        				</c:forEach>
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
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <script>
	    var category = [];
	    var areaData = [];
	    
	    <c:forEach var="areaCarbon" items="${areaCarbonList}">
			category.push("${areaCarbon.area}");
	    	areaData.push(${areaCarbon.sum_cf});
	        
	    </c:forEach>
	
	    var options = {
	        series: [{
	            data: areaData,
	        }],
	        chart: {
	            type: 'bar',
	            height: 385,
	            title: 'Carbon Footprint at Each Area 2023',
	        },
	        title: {
				text: "Carbon Footprint at Each Area 2023",
				align: 'center',
				style: {
		            fontSize: '18px',
		            fontFamily: 'times'
		        }
	        },
	        plotOptions: {
	            bar: {
	                horizontal: true,
	                borderRadius: 4,
	            }
	        },
	        dataLabels: {
	            enabled: false,
	        },
	        xaxis: {
	            title: {
	                text: 'Carbon Footprint',
	                style: {
	    	            fontFamily: 'times'
	    	        }
	            },
	            categories: category,
	            labels: {
	            	style: {
	    	            fontFamily: 'times'
	    	        }
	            }
	        },
	        yaxis: {
	            title: {
	                text: 'Area',
	                style: {
	    	            fontFamily: 'times'
	    	        }
	            },
	            labels: {
	            	style: {
	    	            fontFamily: 'times'
	    	        }
	            }
	        },
	        tooltip: {
	            y: {
	                title: {
	                    formatter: function () {
	                        return 'Carbon Footprint: ';
	                    }
	                }
	            }
	        },
	    };
	
	    var chart = new ApexCharts(document.querySelector("#barChart"), options);
	    chart.render();
	
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
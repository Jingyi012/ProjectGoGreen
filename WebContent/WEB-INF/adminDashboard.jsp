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
                        <p>${highestArea.area}</p>
                    </div>
                    <div class="itemblock green">
                        <span>Low Carbon Emission Area</span>
                        <p>${lowestArea.area}</p>
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
						<h3>User Average Carbon Footprint 2023 (kgCO<sub>2</sub>)</h3>
						<table>
							<tr>
								<td>Housing (High Rise)</td>
								<td>${housingHighRiseCF}</td>
							</tr>
							<tr>
								<td>Housing (Landed)</td>
								<td>${housingLandedCF}</td>
							</tr>
							<tr>
								<td>Institution</td>
								<td>${institutionCF}</td>
							</tr>
						</table>
					</div>
				
				</div>
        	</div>
        </div>
    </div>
    
	<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
	<script type="text/javascript">
	    var monthData = [];
	    var month = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

	    for (var i = 0; i < month.length; i++) {
	        monthData.push(0);
	    }

	    <c:forEach var="monthlyCF" items="${monthlyCarbonFootprint}" varStatus="loop">
	    	monthData[${loop.index}] = ${monthlyCF.month_totalCF};
	    </c:forEach>

	    var options = {
                chart: {
                    type: 'line',
                    width: 700,
                    height: 300,
                },
                series: [{
                    name: 'Carbon Footprint',
                    data: monthData,
                }],
                xaxis: {
                    categories: month,
                    title: {
                        text: 'Month',
                        style: {
    	    	            fontFamily: 'times'
    	    	        }
                    },
                },
                yaxis: {
                    title: {
                        text: 'Carbon Footprint (kgCO2)',
                        style: {
    	    	            fontFamily: 'times'
    	    	        }
                    },
                    labels:{
                    	formatter: function(val){
							return val.toFixed(2)
                        }
                    }
                },
                legend: {
                    position: 'bottom',
                    style: {
	    	            fontFamily: 'times'
	    	        }
                },
            };

            var chart = new ApexCharts(document.getElementById('graph1'), options);
            chart.render();

	</script>
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
</body>
</html>
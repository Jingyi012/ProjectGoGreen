<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.text.SimpleDateFormat, java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	String[] areaName = {"Bukit Horizon", "Bukit Indah", "Gelang Patah", "Impian Emas", "Kangkar Pulai",
            "Kota Iskandar", "Leisure Farm", "Lima Kedai", "Medini Iskandar", "Mutiara Rini",
            "Nusa Bayu", "Nusa Bestari", "Perling", "Pulai Indah", "Pulai Utama",
            "Selesa Jaya", "Sri Pulai", "Sri Skudai", "Skudai", "Skudai Baru",
            "Sutera Utama", "Taman Universiti", "Tanjung Kupang", "Tun Aminah"};
	request.setAttribute("areaNames", areaName);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GoGreen</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminDashboard.css" />
<script src="https://printjs-4de6.kxcdn.com/print.min.js"></script>
<style>
.areaCarbonFootprint{
	background-color: rgb(244, 244, 244);
	border-radius: 10px;
	padding: 20px;
	margin-top: 20px;
	display: flex;
}

.mapping{
	flex: 1;
	height: auto;
	background-color: white;
	width: fit-content;
	display: flex;
    justify-content: center;
    align-items: center;
    padding: 20px 50px;
    box-shadow: 0 3px 3px lightgray;
}
.downloadBtn{
		padding: 15px 20px;
		background-color: #f2bc85;
		color: white;
		border-radius: 15px;
		border: none;
		cursor: pointer;
	}
	.downloadBtn:hover{
		background-color: #eaac6d;
	}
	@media print {
	    .sideBarContainer{
	    	display: none;
	    }
	    .pageWrapper{
	    	margin-left: 0 !important;
	    }
	    .reportContent{
	    	width: 1000px;
	    }
	}
</style>
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
					<a href="${pageContext.request.contextPath}/adminReport">Report</a> >
					<a href="">Carbon Footprint Report ${year}</a>	
				</div>
				
				<div class="reportContent" id="reportContainer">
					<h2 class="pageTitle">Carbon Footprint Report ${year}</h2>
					
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
	                        <fmt:formatNumber value="${totalCF}" pattern="#,##0.00" var="totalCF" />
	                        <p>${totalCF} kgCO<sub>2</sub></p>
	                    </div>
	        		</div>
	
					<div class="areaCarbonFootprint">
						<div class="mapping" id="barChart">
							
	
						</div>
						
					</div>
					<div class="moreDetails">
						<div class="graph1Container">
							<div id="graph1" class="lineChart">

							</div>
						</div>
						
						<div class="categoryAvg">
							<h3>User Average Carbon Footprint ${year} (kgCO<sub>2</sub>)</h3>
							<table>
							<tr>
								<td>Housing (High Rise)</td>
								<td>
									<fmt:formatNumber value="${housingHighRiseCF}" pattern="#,##0.00" var="housingHighRiseCF" />
									<c:out value="${housingHighRiseCF}" />
								</td>
							</tr>
							<tr>
								<td>Housing (Landed)</td>
								<td>
									<fmt:formatNumber value="${housingLandedCF}" pattern="#,##0.00" var="housingLandedCF" />
									<c:out value="${housingLandedCF}" />
								</td>
							</tr>
							<tr>
								<td>Institution</td>
								<td>
									<fmt:formatNumber value="${institutionCF}" pattern="#,##0.00" var="institutionCF" />
									<c:out value="${institutionCF}" />
								</td>
							</tr>
						</table>
						</div>
					</div>
				</div>

				<div style="text-align: center; margin: 40px 0">
					<button class="downloadBtn" onclick="downloadPdf()">Download</button>
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
	    	monthData[${monthlyCF.month-1}] = ${monthlyCF.month_totalCF};
	    </c:forEach>

	    var options = {
                chart: {
                    type: 'line',
                    height: 300,
                },
                title: {
    				text: "Trend of Carbon Footprint ${year}",
    				align: 'center',
    	            margin: 10,
    				style: {
    		            fontSize: '18px',
    		            fontFamily: 'times'
    		        }
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

	    <c:forEach var="areaName" items="${areaNames}">
		    category.push("${areaName}");
		    <c:set var="areaHaveData" value="false" />
		    <c:forEach var="areaCarbon" items="${areaCarbonList}">
		        <c:if test="${areaName eq areaCarbon.area and not areaHaveData}">
		            areaData.push(${areaCarbon.sum_cf});
		            <c:set var="areaHaveData" value="true" />
		        </c:if>
		    </c:forEach>
		    <c:if test="${not areaHaveData}">
		        areaData.push(0);
		    </c:if>
		</c:forEach>
	    
	    /* <c:forEach var="areaCarbon" items="${areaCarbonList}">
			category.push("${areaCarbon.area}");
	    	areaData.push(${areaCarbon.sum_cf});
	        
	    </c:forEach> */
	
	    var options = {
	        series: [{
	            data: areaData,
	        }],
	        chart: {
	            type: 'bar',
	            height: 385,
	            title: 'Carbon Footprint at Each Area ${year}',
	        },
	        title: {
				text: "Carbon Footprint at Each Area ${year}",
				align: 'center',
				style: {
		            fontSize: '18px',
		            fontFamily: 'times'
		        }
	        },
	        plotOptions: {
	            bar: {
	                horizontal: false,
	                borderRadius: 4,
	            }
	        },
	        dataLabels: {
	            enabled: false,
	        },
	        xaxis: {
	            title: {
	                text: 'Area',
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
	                text: 'Carbon Footprint (kgCO2)',
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
	            },
	        },
	    };
	
	    var chart = new ApexCharts(document.querySelector("#barChart"), options);
	    chart.render();
	
	</script>
	<script>
	    function downloadPdf() {
	    	printJS({
	            printable: 'reportContainer',
	            type: 'html',
	            css: [
		            '${pageContext.request.contextPath}/resources/css/adminDashboard.css',
		            '${pageContext.request.contextPath}/resources/css/print.css'
		            ]
	          }); 
	    }
	</script>
</body>
</html>
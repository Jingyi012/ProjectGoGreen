<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.text.SimpleDateFormat, java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GoGreen</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js" integrity="sha512-GsLlZN/3F2ErC5ifS5QtgpiJtWd43JWSuIgh7mbzZ8zBps+dvLusV+eNQATqgA/HdeKFVgA5v3S/cIrLF7QnIg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<style>
	.pageContent {
		padding: 30px 60px;
	}
	.pageTitle{
		text-decoration: underline; 
		margin: 20px 0 30px; 
		font-size: 30px;
	}
	.dataContainer{
		display: flex;
		gap: 30px;
		flex-direction: column;
		border: 1px solid #fbfbfb;
	}
	.item-group{
		flex: 1;
	}
	.row{
		display: flex;
	    justify-content: space-between;
	    align-items: center;
	    gap: 50px;
	}
	.row div{
		flex: 1;
	}

	.itemGroup{
		border: 2px solid lightgray;
		background-color: #fbfbfb;
		border-radius: 5px;
		padding: 10px;
	}
	.itemGroup h4{
		margin: 5px 0 10px;
		font-size: 20px;
	}
	.itemGroup p{
		margin: 5px 0;
		font-size: 20px;
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
	    @page {
	        size: A4; /* Set the page size for print */
	    }
	    .sideBarContainer{
	    	display: none;
	    }
	    .pageWrapper{
	    	margin-left: 0 !important;
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
					<a href="${pageContext.request.contextPath}/adminReport">Report</a>
					
				</div>
				<div class="reportContent" id="reportContainer">
					<h2 class="pageTitle">${month} ${year} Carbon Footprint Report</h2>
					<div class="row">
						<div class="dataContainer">
							<div class="itemGroup">
								<h4>Water Consumption</h4>
								<p>L</p>
							</div>
							<div class="itemGroup">
								<h4>Electric Consumption</h4>
								<p>${electric["electric_consump"]} kWh</p>
							</div>
							<div class="itemGroup">
								<h4>Recycle Weight</h4>
								<p>${recycle["recycle_weight"]} kg</p>
							</div>
							<div class="itemGroup">
								<h4>Total Carbon Footprint</h4>
								<p>${totalCF} kgCO<sub>2</sub></p>
							</div>
						</div>
						
						<div id="chart" class="chart">
						
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
	<script>
		var options = {
	       series: [44, ${electric["electric_CF"]}, ${recycle["recycle_CF"]}],
	       chart: {
	       width: 380,
	       type: 'pie',
	     },
	     labels: ['Water', 'Electric', 'Recycle'],
	     title:{
	    	 text: "Carbon Footprint from Each Type of Input",
			align: 'center',
			style: {
	            fontSize: '18px',
	            fontFamily: 'times'
	        }
		 },
		 tooltip: {
	            enabled: true,
	            y: {
	                formatter: function (value) {
	                    return value + " kgCO2";
	                }
	            }
	        },
	     responsive: [{
	       breakpoint: 480,
	       options: {
	         chart: {
	           width: 200
	         },
	         legend: {
	           position: 'bottom'
	         }
	       }
	     }]
	     };
	
	     var chart = new ApexCharts(document.querySelector("#chart"), options);
	     chart.render();
	</script>
	<script>
	    function downloadPdf() {
	        const element = document.getElementById('reportContainer');

	        const opt = {
       			margin: [10, 20, 10, 20],
       			filename: '${month} ${year} Carbon Footprint Report.pdf',
       			image: { type: 'jpeg', quality: 0.98 },
       			jsPDF: { unit: 'mm', format: 'A4', orientation: 'portrait' }
       		};
	
	        html2pdf().set(opt).from(element).save();
	    }
	</script>
</body>
</html>
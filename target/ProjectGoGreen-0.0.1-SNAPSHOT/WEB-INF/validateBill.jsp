<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GoGreen</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bills.css"/>
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
					<a href="">Validate Bill</a>
				</div>

	        	<h2 style="text-decoration: underline; margin: 20px 0 0 0; font-size: 30px;" >Validate Bill</h2>
	        	<div class="billChoice">
	        		<a href="${pageContext.request.contextPath}/validateWaterBill" class="billChoiceItem water">
	        			<i class="bi bi-droplet"></i>
	        			<h2>Water Bill</h2>
	        		</a>
	        		<a href="${pageContext.request.contextPath}/validateElectricBill" class="billChoiceItem electric">
	        			<i class="bi bi-lightning-charge"></i>
	        			<h2>Electric Bill</h2>
	        		</a>
	        		<a href="${pageContext.request.contextPath}/adminRecycleBill" class="billChoiceItem recycle">
	        			<i class="bi bi-recycle"></i>
	        			<h2>Recycle Bill</h2>
	        		</a>
	        	</div>

        	</div>
        </div>
        
    </div>

</body>
</html>
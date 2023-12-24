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
					<a href="${pageContext.request.contextPath}/validateBill">Validate Bill</a> >
					<a href="">Validate Electric Bill</a> >
				</div>

	        	<h2 style="text-decoration: underline; margin: 20px 0 0 0; font-size: 30px;" >Validate Electric Bill</h2>
	        	<div class="electricBillTableContainer">
	        		<table class="validateElectricBillTable">
	        			<tr>
	        				<th>No</th>
	        				<th>Name</th>
	        				<th>Address</th>
	        				<th>Category</th>
	        				<th>Electric Consumption</th>
	        				<th>Bill</th>
	        				<th>Action</th>
	        			</tr>
	        			<tr></tr>
	        		</table>
	        	</div>

        	</div>
        </div>
        
    </div>

</body>
</html>
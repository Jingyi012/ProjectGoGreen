<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GoGreen</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/billForm.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
    .pageContent{
        padding: 30px 60px;
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
					<a href="${pageContext.request.contextPath}/bills">Bills</a> >
					<a href="${pageContext.request.contextPath}/bills/waterBill">Water Bills</a> >
                    ${month} ${year}
				</div>
				<h2 class="pageTitle">Edit Water Bills</h2>
				
			  
				
				<div class="formContainer">
					<form action="${pageContext.request.contextPath}/bills/editWaterMonthForm/submit" method="post" enctype="multipart/form-data">
						<div class="billForm water">
							<label for="waterBill">Insert Electric Consumption:</label>
							<input type="text" id="waterBill" name="wBill" placeholder="123kWh" value="${waterbill.water_consumption}">
						</div>
						
						<div class="billFile water">
							<span>Upload Water Bill as proof:</span>
							<label for="wFile" class="fileBox"><br>Choose File &nbsp<i class="fa fa-upload"></i></label>
							<input type="file" id="wFile" name="wFile" placeholder="Choose file">
						</div>
						
						<div class="submitButton">
						<input type="submit" value="Submit" id="btn">
						<input type="hidden" name="year" value="${year}" />
						<input type="hidden" name="month" value="${month}" />
						</div>
					</form>
				</div>
        	
        	
        	</div>
        </div>
        
    </div>

</body>
</html>
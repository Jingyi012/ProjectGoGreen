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
            <jsp:include page="sidebar.jsp" />
        </div>
	    
        <div class="pageWrapper">
        	<jsp:include page="headerBar.jsp" />
        	<div class="pageContent">
                <div class="pageNav">
					Home > 
					<a href="${pageContext.request.contextPath}/bills">Bills</a> >
					<a href="${pageContext.request.contextPath}/bills/recycleBill">Recycle Bills</a> >
                    ${month} ${year}
				</div>
				<h2 class="pageTitle">Recycle Bills</h2>
				
			  
				
				<div class="formContainer">
					<form action="${pageContext.request.contextPath}/bills/recycleMonthForm/submit" method="post" enctype="multipart/form-data">
						<div class="billForm recycle">
							<label for="recycle_weight">Insert Recycling Consumption:</label>
							<input type="text" id="recycle_weight" name="recycle_weight" placeholder="123Kg">
						</div>
						
						<div class="billFile recycle">
							<span>Upload Recycling Bill as proof:</span>
							<label for="rFile" class="fileBox"><br>Choose File &nbsp<i class="fa fa-upload"></i></label>
							<input type="file" id="rFile" name="rFile" placeholder="Choose file">
						</div>
						
						<div class="submitButton">
						<input type="submit" value="Submit" id="btn">
						<input type="hidden" name="year" value="${year}" />
						<input type="hidden" name="smonth" value="${month}" />
						</div>
					</form>
				</div>
        	
        	
        	
        	</div>
        </div>
        
    </div>

</body>
</html>
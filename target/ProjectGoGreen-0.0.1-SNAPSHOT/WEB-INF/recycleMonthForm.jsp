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
        
        <% 
	        String month = request.getParameter("month"); 
	        session.setAttribute("month", month);
        %>
	    
        <div class="pageWrapper">
        	<jsp:include page="headerBar.jsp" />
        	<div class="pageContent">
                <div class="pageNav">
					Home > 
					<a href="bills.jsp">Bills</a> >
					<a href="recycleBill.jsp">Recycle Bills</a> >
                    <%= month %>
				</div>
				<h2 class="pageTitle">Recycle Bills</h2>
				
			  
				
				<div class="formContainer">
					<form action="./recycleMonthReport.jsp?month=<%= month %>">
						<div class="billForm recycle">
							<label for="eBill">Insert Recycling Consumption:</label>
							<input type="text" id="eBill" name="eBill" placeholder="123Kg">
						</div>
						
						<div class="billFile recycle">
							<span>Upload Recycling Bill as proof:</span>
							<label for="eFile" class="fileBox"><br>Choose File &nbsp<i class="fa fa-upload"></i></label>
							<input type="file" id="eFile" name="eFile" placeholder="Choose file">
						</div>
						
						<div class="submitButton">
						<input type="submit" value="Submit" id="btn">
						</div>
					</form>
				</div>
        	
        	
        	
        	</div>
        </div>
        
    </div>

</body>
</html>
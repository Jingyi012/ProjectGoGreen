<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GoGreen</title>
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
					<a href="bills.jsp">Bills</a> >
					<a href="electricBill.jsp">Electric Bills</a> >
                    <%= request.getParameter("month") %>
				</div>
        	
        	
        	
        	</div>
        </div>
        
    </div>

</body>
</html>
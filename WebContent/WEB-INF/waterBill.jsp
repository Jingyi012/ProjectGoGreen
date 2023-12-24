<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GoGreen</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/billCalendar.css" />
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
					<a href="">Water Bills</a>
				</div>
        		<h2 class="pageTitle">Water Bills</h2>
        		<div class="calendarYear">
        			<i class="bi bi-caret-left-fill" onclick="decrementSelect()"></i>
        			<select id="yearSelect">
        				<option>2021</option>
        				<option>2022</option>
        				<option selected>2023</option>
        			</select>
        			<i class="bi bi-caret-right-fill" onclick="incrementSelect()"></i>
        		</div>
        		<div class="calendar">
        			
        			<% 
        			String[] monthArray = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"}; 
        			Calendar cal = Calendar.getInstance();
				    int currentMonth = cal.get(Calendar.MONTH) + 1;
				    
        			for(int i=0; i<12; i++){
        			
        			%>
					<div class="month">
        				<div class="monthName">
        					<%= monthArray[i] %>
        				</div>
        				<div class="monthFunc">
							<%
							   if(i+1 < currentMonth){
							%>
								<a class="uploadBtn" href="./waterMonthForm.jsp?month=<%=monthArray[i]%>">Upload Bill</a>
							<%   
								}
							%>
        				</div>
        			</div>	
        			<% } %>	
        			
        		</div>
        	</div>    
   		 </div>
   		<script>
        function incrementSelect() {
            var select = document.getElementById("yearSelect");
            select.selectedIndex = Math.min(select.options.length - 1, select.selectedIndex + 1);
          }

        function decrementSelect() {
            var select = document.getElementById("yearSelect");
            select.selectedIndex = Math.max(0, select.selectedIndex - 1);
          }
        </script>
    </div>

</body>
</html>
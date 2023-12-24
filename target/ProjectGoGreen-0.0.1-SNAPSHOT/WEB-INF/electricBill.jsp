<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GoGreen</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/billCalendar.css" />
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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
					<a href="">Electric Bills</a>
				</div>
        		<h2 class="pageTitle">Electric Bills</h2>
        		<div id="calendarYear" class="calendarYear" >
        			<i class="bi bi-caret-left-fill"></i>
        			<select id="yearSelect">
        				<option>2021</option>
        				<option>2022</option>
        				<option selected>2023</option>
        			</select>
        			<i class="bi bi-caret-right-fill"></i>
        		</div>
        		<div class="calendar" id="calendar">
        			
        		</div>
        	</div>
        </div>
        <script>
        	

			$(document).ready(function(){
				updateCalendar(2023);

				$('#yearSelect').change(function() {
					updateCalendar($(this).val());
				});

				$('.bi-caret-left-fill').click(decrementSelect);
    			$('.bi-caret-right-fill').click(incrementSelect);

				function updateCalendar(year){
					$.ajax({
						type: 'GET',
						url: 'updateElectricCalendar', 
						data: { year: year },
						success: function(response) {
							
							$('#calendar').html(response);
						},
						error: function(error) {
							console.error('Error updating included page:', error);
						}
					});
				}

				function incrementSelect() {
					var select = $('#yearSelect');
					select.prop('selectedIndex', Math.min(select[0].options.length - 1, select.prop('selectedIndex') + 1));
					updateCalendar(select.val());
				}

				function decrementSelect() {
					var select = $('#yearSelect');
					select.prop('selectedIndex', Math.max(0, select.prop('selectedIndex') - 1));
					updateCalendar(select.val());
				}
			})

        </script>
    </div>

</body>
</html>
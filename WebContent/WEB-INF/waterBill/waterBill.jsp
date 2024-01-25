<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            <jsp:include page="../sidebar.jsp" />
        </div>
	    
        <div class="pageWrapper">
        	<jsp:include page="../headerBar.jsp" />
        	<div class="pageContent">

				<div class="pageNav">
					Home > 
					<a href="${pageContext.request.contextPath}/bills">Bills</a> >
					<a href="">Water Bills</a>
				</div>
        		<h2 class="pageTitle">Water Bills</h2>
        		<div id="calendarYear" class="calendarYear" >
        			<i class="bi bi-caret-left-fill" class="carousel-control-prev" type="button" data-bs-target="#calendarContainer" data-bs-slide="prev"></i>
        			<select id="yearSelect">
        				<option>2021</option>
        				<option>2022</option>
        				<option selected>2023</option>
        			</select>
        			<i class="bi bi-caret-right-fill"></i>
        		</div>

        		<div class="calendar" id="calendar">
        		
        		</div>
        		
        		<c:if test="${not empty successMessage}">
			        <div class='statusMessageBox'>
                            <div class='toast-content'>
                            <i class='bi bi-check2 toast-icon greenColor'></i>
                            <div class='message'>
                                <span class='message-text text-1'>Success</span>
                                <span class='message-text text-2'>${successMessage}</span>
                            </div>
                            </div>
                            <i class='bi bi-x toast-close'></i>
                            <div class='progressbar active greenColor'></div>
                    </div>
			    </c:if>
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
						url: 'updateWaterCalendar', 
						data: { year: year },
						success: function(response) {
							$('#calendar').html(response);
							$('#calendar').hide().fadeIn(500);
						},
						error: function(error) {
							console.error('Error updating included page:', error);
						}
					});
				}
			
				function incrementSelect() {
					var select = $('#yearSelect');
					var newIndex = Math.min(select[0].options.length - 1, select.prop('selectedIndex') + 1);
					if (newIndex !== select.prop('selectedIndex')) {
						select.prop('selectedIndex', newIndex);
						updateCalendar(select.val());
					}
				}

				function decrementSelect() {
					var select = $('#yearSelect');
					var newIndex = Math.max(0, select.prop('selectedIndex') - 1);
					if (newIndex !== select.prop('selectedIndex')) {
						select.prop('selectedIndex', newIndex);
						updateCalendar(select.val());
					}
				}
			})
        </script> 
        <script>
	        document.addEventListener('DOMContentLoaded', function() {
	            var statusMessageBox = document.querySelector('.statusMessageBox');
	            if (statusMessageBox) {
	                setTimeout(function() {
	                    statusMessageBox.classList.add("slideOut");
	                }, 3000);
	
	                var progressbar = document.querySelector('.statusMessageBox .progressbar.active');
	                if (progressbar) {
	                    setTimeout(function() {
	                        progressbar.classList.remove("active");
	                        statusMessageBox.remove();
	                    }, 3500);
	                }
	
	                var toastCloseButtons = document.querySelectorAll('.statusMessageBox .toast-close');
	                toastCloseButtons.forEach(function(button) {
	                    button.addEventListener("click", function() {
	                        statusMessageBox.classList.add("slideOut");
	
	                        setTimeout(function() {
	                            progressbar.classList.remove("active");
	                            statusMessageBox.remove();
	                        }, 300);
	                    });
	                });
	            }
	        });
	    </script>
    </div>
</body>
</html>

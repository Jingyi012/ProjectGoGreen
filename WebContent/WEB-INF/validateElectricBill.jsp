<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GoGreen</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/billValidate.css"/>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
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
					<a href="">Validate Electric Bill</a>
				</div>

	        	<h2 style="text-decoration: underline; font-size: 30px; margin: 20px 0" >Validate Electric Bill</h2>
	        	<div class="electricBillTableContainer">
	        		<table class="table table-hover">
	        			<tr class="table-primary">
	        				<th>No</th>
	        				<th>Name</th>
	        				<th>Address</th>
	        				<th>Category</th>
	        				<th>Year</th>
	        				<th>Month</th>
	        				<th>Electric Consumption</th>
	        				<th>Bill</th>
	        				<th colspan='2'>Action</th>
	        			</tr>
	        			
	        			<c:forEach var="euList" items="${pendingValidateEList}" varStatus="loop">
	        			<tr>
	        				<td><c:out value="${loop.index + 1}" /></td>
	        				<td><c:out value="${euList.getName()}" /> </td>
	        				<td><c:out value="${euList.address}" /> </td>
	        				<td><c:out value="${euList.category}" /> </td>
	        				<td><c:out value="${euList.year}" /></td>
	        				<td><c:out value="${euList.month}" /></td>
	        				<td><c:out value="${euList.electric_consumption}" /></td>
	        				<td>
	        				<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#ebillModal${euList.eid}">
							  View Bill
							</button>
							<div class="modal fade" id="ebillModal${euList.eid}" tabindex="-1" aria-labelledby="#ebillModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h1 class="modal-title fs-5" id="ebillModalLabel">View Bill</h1>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body" style="text-align: center;">
							      <!-- display image -->
							      	<img class="billImg" width="400px" src="data:image/*;base64,${Base64.getEncoder().encodeToString(euList.electricBill_proof)}" alt="Image" />
							      	
							      	 <%-- <iframe class="billpdf" src="data:application/pdf;base64,${Base64.getEncoder().encodeToString(euList.electricBill_proof)}" width="100%" height="600"></iframe> --%>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
							      </div>
							    </div>
							  </div>
							</div>
	        				
	        				</td>
	        				<td>
	        					<form method="post" action="validateElectricAction">
	        						<input type="hidden" name="eid" value="${euList.eid}" />
	        						<input type="hidden" name="action" value="approve" />
	        						<button type="submit" class="approveBtn btn btn-outline-success">Approve</button>
	        					</form> 					
	        				</td>
	        				<td>
	        					<form method="post" action="validateElectricAction">
	        						<input type="hidden" name="eid" value="${euList.eid}" />
	        						<input type="hidden" name="action" value="reject" />
	        						<button type="submit" class="rejectBtn btn btn-outline-danger">Reject</button>
	        					</form> 
	        				</td>
	        			</tr>
	        			</c:forEach>
	        			
	        		</table>
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
        </div>
        
    </div>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</body>
</html>
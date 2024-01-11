<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GoGreen</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/billValidate.css"/>
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

	        	<h2 style="text-decoration: underline; font-size: 30px;" >Validate Electric Bill</h2>
	        	<div class="electricBillTableContainer">
	        		<table class="validateElectricBillTable">
	        			<tr>
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
	        				<td><c:out value="${euList.name}" /></td>
	        				<td><c:out value="${euList.address}" /></td>
	        				<td><c:out value="${euList.category}" /></td>
	        				<td><c:out value="${euList.year}" /></td>
	        				<td><c:out value="${euList.month}" /></td>
	        				<td><c:out value="${euList.electric_consumption}" /></td>
	        				<td><c:out value="${euList.electricBill_proof}" /></td>
	        				<td>
	        					<form method="post" action="validateElectricAction">
	        						<input type="hidden" name="eid" value="${euList.eid}" />
	        						<input type="hidden" name="action" value="approve" />
	        						<button type="submit">Approve</button>
	        					</form> 					
	        				</td>
	        				<td>
	        					<form method="post" action="validateElectricAction">
	        						<input type="hidden" name="eid" value="${euList.eid}" />
	        						<input type="hidden" name="action" value="reject" />
	        						<button type="submit">Reject</button>
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

</body>
</html>
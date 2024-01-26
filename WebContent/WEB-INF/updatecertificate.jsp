<%@ page import="java.util.*, com.model.Certificate, com.model.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:choose>
					<c:when test="${certificateEligible}">
					<img src="${pageContext.request.contextPath}/resources/images/certificate.png" alt="Certificate Image">
					
						<div class="certificate-text">
							<h2>
								<span class="bold">Certificate of Participation</span>
							</h2>
							<p>This Certificate is Awarded to</p>
							<h1>${user.firstName}${user.lastName}</h1>
							<h6>
								Has successfully completed the requirement of providing a bill
								lasting six consecutive months
							</h6>
						</div>

					
					</c:when>

					<c:otherwise>
						<h6 ><b><br><br>You are not eligible for a certificate. Please fulfill
								the requirements.</b></h6>
					</c:otherwise>
</c:choose>
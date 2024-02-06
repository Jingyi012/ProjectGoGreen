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
							<h1>${username}</h1>
							<h6>
								Has successfully completed the requirement of providing a bill<br>
								lasting six consecutive months in ${selectedYear} 
							</h6>
						</div>

						<c:if test="${certificateEligible}">
							<div class="download">
								<button type="button" class="downloadBtn" onclick="downloadPDF()">Download
									PDF</button>
							</div>
						</c:if>
					</c:when>

	<c:otherwise>
		<h3>
			<b><br>
			<br>You are not eligible for a certificate. Please fulfill the
				requirements.</b>
		</h3>
	</c:otherwise>

</c:choose>

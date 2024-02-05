<%@ page import="java.util.*, com.model.WaterBill"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="selectedYear" value="${selectedYear}" />
<c:set var="currentYear" value="${currentYear}" />
<c:set var="currentMonth" value="${currentMonth}" />

<c:choose>
	<c:when test="${databaseError eq true}">
		<p class="calendarErrorMessage">Error encountered, please refresh</p>
	</c:when>
	<c:otherwise>
		<div class="calendarContainer">
			<c:forEach var="i" begin="0" end="11" varStatus="loop">
				<c:set var="status" value="none" />
				<c:set var="month" value="month-${i + 1}" />
				<c:if
					test="${waterBillStatusMap ne null and waterBillStatusMap[month] ne null}">

					<c:set var="status" value="${waterBillStatusMap[month]}" />
				</c:if>

				<c:set var="cssClass" value="" />
				<c:choose>
					<c:when test="${status eq 'pending' or status eq 'approve'}">
						<c:set var="cssClass" value="green" />
					</c:when>
					<c:when test="${status eq 'reject'}">
						<c:set var="cssClass" value="red" />
					</c:when>
				</c:choose>

				<div class="month">
					<div class="monthName ${cssClass}">${monthArray[i]}</div>
					<div class="monthFunc ${cssClass}">
						<c:choose>
							<c:when
								test="${(i + 1 lt currentMonth or selectedYear lt currentYear) and status eq 'none'}">
								<a class="uploadBtn"
									href="${pageContext.request.contextPath}/bills/waterBill/${selectedYear}/${monthArray[i]}">Upload
									Bill</a>
							</c:when>
							<c:when
								test="${(i + 1 lt currentMonth or selectedYear lt currentYear) and status eq 'pending'}">
								<p>Pending validate</p>
								<a class="uploadBtn"
									href="${pageContext.request.contextPath}/bills/editWaterBill/${selectedYear}/${monthArray[i]}">Edit
									Bill</a>
							</c:when>
							<c:when
								test="${(i + 1 lt currentMonth or selectedYear lt currentYear) and status eq 'reject'}">
								<p>Bill rejected, please re-upload</p>
								<a class="uploadBtn"
									href="${pageContext.request.contextPath}/bills/editWaterBill/${selectedYear}/${monthArray[i]}">ReUpload
									Bill</a>
							</c:when>
							<c:when
								test="${(i + 1 lt currentMonth or selectedYear lt currentYear) and status eq 'approve'}">

								<a class="uploadBtn"
									href="${pageContext.request.contextPath}/bills/waterMonthReport/${selectedYear}/${monthArray[i]}">View
									Report</a>
							</c:when>

						</c:choose>
					</div>
				</div>
			</c:forEach>
		</div>
 	</c:otherwise>
</c:choose>
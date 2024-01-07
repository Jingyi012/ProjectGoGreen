    <%@ page import="java.util.*, com.model.ElectricBill"%>
    <% 
       	String[] monthArray = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"}; 
       	int selectedYear = (int)request.getAttribute("selectedYear");
       	
       	int currentYear = (int)request.getAttribute("currentYear");
		int currentMonth = (int)request.getAttribute("currentMonth");
		List<ElectricBill> eList = (List<ElectricBill>) request.getAttribute("electricBillList");
		Map<String, String> electricBillStatusMap = (Map<String, String>) request.getAttribute("electricBillStatusMap");
       	for(int i=0; i<12; i++){
       		String status = "none";
       		boolean hasElectricBillStatus = electricBillStatusMap.containsKey("month-" + (i + 1));
       		if(hasElectricBillStatus){
       			status = electricBillStatusMap.get("month-"+(i+1));
       		}
       		String cssClass = "";
       		if(status.equals("pending") || status.equals("approve")){
       			cssClass="green";
       		} else if (status.equals("reject")){
       			cssClass = "red";
       		}
     %>
		<div class="month">
			<div class="monthName <%= cssClass %>">
				<%= monthArray[i] %>
			</div>
			<div class="monthFunc <%= cssClass %>">
				<%
					if((i+1 < currentMonth || selectedYear < currentYear) && status.equals("none")){
				%>
					<a class="uploadBtn" href="${pageContext.request.contextPath}/bills/electricBill/<%=selectedYear%>/<%=monthArray[i]%>">Upload Bill</a>
				<%   
					} else if ((i+1 < currentMonth || selectedYear < currentYear) && status.equals("pending")){
				%>
					<p>Pending validate</p>
					<a class="uploadBtn" href="${pageContext.request.contextPath}/bills/editElectricBill/<%=selectedYear%>/<%=monthArray[i]%>">Edit Bill</a>
				<% 
					} else if ((i+1 < currentMonth || selectedYear < currentYear) && status.equals("reject")){
				%>
					<p>Bill rejected, please re-upload</p>
					<a class="uploadBtn" href="${pageContext.request.contextPath}/bills/editElectricBill/<%=selectedYear%>/<%=monthArray[i]%>">ReUpload Bill</a>
				<% 
					} else if((i+1 < currentMonth || selectedYear < currentYear) && status.equals("approve")){
				%>
					<!-- <i class="bi bi-check-circle" style="color: green; font-size: 30px;"></i> -->
					<a class="uploadBtn" href="${pageContext.request.contextPath}/bills/electricMonthReport/<%=selectedYear%>/<%=monthArray[i]%>">View Report</a>
				<%
					}
				%>
			</div>
		</div>	
       <% } %>
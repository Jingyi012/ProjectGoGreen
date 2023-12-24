    <% 
       	String[] monthArray = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"}; 
       	int selectedYear = (int)request.getAttribute("selectedYear");
       	
       	int currentYear = (int)request.getAttribute("currentYear");
		int currentMonth = (int)request.getAttribute("currentMonth");
		 
       	for(int i=0; i<12; i++){
       			
     %>
		<div class="month">
			<div class="monthName">
				<%= monthArray[i] %>
			</div>
			<div class="monthFunc">
				<%
					if(i+1 < currentMonth || selectedYear < currentYear){
				%>
					<a class="uploadBtn" href="electricBill/<%=selectedYear%>/<%=monthArray[i]%>">Upload Bill</a>
				<%   
					}
				%>
			</div>
		</div>	
       <% } %>
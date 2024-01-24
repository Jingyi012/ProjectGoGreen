<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GoGreen</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/report.css" />

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
					<a href="${pageContext.request.contextPath}/adminReport">Report</a>
				</div>
			
				 <div class="tabs">
                    <button class="tablinks" onclick="openTab(event, 'Monthly')" id="defaultOpen">Monthly</button>
                    <button class="tablinks" onclick="openTab(event, 'Yearly')">Yearly</button>
                </div>
				
				
				<div id="Monthly" class="table-content">
				<div>
				<h2>Monthly Report  2023 </h2>
				</div>
					<table>
						<tr>
							<th class="date-col"  colspan="2">Date</th>
							<th class="description-col" colspan="4">Description</th>
							<th class="action-col">Action</th>
						</tr>

						<tr>
							<td class="date-col"  colspan="2">JAN</td>
							<td class="description-col" colspan="4">January Carbon Emission Report</td>
							<td class="action-col download-icon"><i class="fas fa-download"></i></td>
						</tr>
						
						<tr>
							<td class="date-col" colspan="2">FEB</td>
							<td class="description-col" colspan="4">February Carbon Emission Report</td>
							<td class="action-col download-icon"><i class="fas fa-download"></i></td>
						</tr>
						
						<tr>
							<td class="date-col" colspan="2">MAR</td>
							<td class="description-col" colspan="4">March Carbon Emission Report</td>
							<td class="action-col download-icon"><i class="fas fa-download"></i></td>
						</tr>
						
						<tr>
							<td class="date-col" colspan="2">APR</td>
							<td class="description-col" colspan="4">April Carbon Emission Report</td>
							<td class="action-col download-icon"><i class="fas fa-download"></i></td>
						</tr>
						
						<tr>
							<td class="date-col" colspan="2">MAY</td>
							<td class="description-col" colspan="4">May Carbon Emission Report</td>
							<td class="action-col download-icon"><i class="fas fa-download"></i></td>
						</tr>
						
						<tr>
							<td class="date-col" colspan="2">JUN</td>
							<td class="description-col" colspan="4">June Carbon Emission Report</td>
							<td class="action-col download-icon"><i class="fas fa-download"></i></td>
						</tr>
						
						<tr>
							<td class="date-col" colspan="2">JUL</td>
							<td class="description-col" colspan="4">July Carbon Emission Report</td>
							<td class="action-col download-icon"><i class="fas fa-download"></i></td>
						</tr>
						
						<tr>
							<td class="date-col" colspan="2">AUG</td>
							<td class="description-col" colspan="4">August Carbon Emission Report</td>
							<td class="action-col download-icon"><i class="fas fa-download"></i></td>
						</tr>
						
						<tr>
							<td class="date-col" colspan="2">SEP</td>
							<td class="description-col" colspan="4">September Carbon Emission Report</td>
							<td class="action-col download-icon"><i class="fas fa-download"></i></td>
						</tr>
						
						<tr>
							<td class="date-col" colspan="2">OCT</td>
							<td class="description-col" colspan="4">October Carbon Emission Report</td>
							<td class="action-col download-icon"><i class="fas fa-download"></i></td>
						</tr>
						
						<tr>
							<td class="date-col" colspan="2">NOV</td>
							<td class="description-col" colspan="4">November Carbon Emission Report</td>
							<td class="action-col download-icon"><i class="fas fa-download"></i></td>
						</tr>
						
						<tr>
							<td class="date-col" colspan="2">DEC</td>
							<td class="description-col" colspan="4">December Carbon Emission Report</td>
							<td class="action-col download-icon"><i class="fas fa-download"></i></td>
						</tr>
						

					</table>
				</div>
				
				<div id="Yearly" class="table-content">
				<div>
				<h2>Yearly Report</h2>
				</div>
                    <table>
                        <tr>
                            <th class="date-col">Date</th>
                            <th class="description-col" colspan="4">Description</th>
                            <th class="action-col">Action</th>
                        </tr>
                        
                        <tr>
                            <td class="date-col">2021</td>
                            <td class="description-col" colspan="4">2021 Carbon Emission Report</td>
                            <td class="action-col download-icon"><i class="fas fa-download"></i></td>
                        </tr>
                        
                          <tr>
                            <td class="date-col">2022</td>
                            <td class="description-col" colspan="4">2022 Carbon Emission Report</td>
                            <td class="action-col download-icon"><i class="fas fa-download"></i></td>
                        </tr>
                                                
                          <tr>
                            <td class="date-col">2023</td>
                            <td class="description-col" colspan="4">2023 Carbon Emission Report</td>
                            <td class="action-col download-icon"><i class="fas fa-download"></i></td>
                        </tr>
                        
                        
                    </table>
                </div>
            </div>
        </div>
    </div>
   
    
    <script>

					function openTab(evt, tabName) {
						var i, tableContent, tablinks;
						tableContent = document.getElementsByClassName("table-content");
						for (i = 0; i < tableContent.length; i++) {
							tableContent[i].style.display = "none";
						}
						
						tablinks = document.getElementsByClassName("tablinks");
						for (i = 0; i < tablinks.length; i++) {
							tablinks[i].className = tablinks[i].className.replace(" active", "")
						}

						document.getElementById(tabName).style.display="block";
						evt.currentTarget.className+=" active";
					}
					document.getElementById("defaultOpen").click();
				</script>

</body>
</html>
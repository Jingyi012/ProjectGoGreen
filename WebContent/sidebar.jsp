<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
<title>GoGreen</title>

<style>
	body{
		margin: 0;
	}
	.hideSideBar{
		width: 0 !important;
		transition: width 0.3s ease;
	}
	.userSideBar{
		width: 240px;
		display: flex;
		flex-direction: column;
		background-color: #045BAC;
		min-height: 98vh;
		align-items: center;
		padding: 40px 0 0;
		position: fixed;
		transition: width 0.3s ease;
		z-index: 2;
		overflow-x: hidden;
	}

	.logoContainer{
		display: flex;
		flex-direction: row;
		width: 190px;
	}
	
	.logo{
		width: 65px;
		height: 65px;
		background-color: white;
		border-radius: 50%;
		padding: 5px;
	}
	.logoDesc{
		text-align: right;
		width: 60%;
		color: white;
		display: inline;
	}
	.logoName{
		font-size: 24px;
		font-weight: 600;
	}
	.logoDesc p{
		font-size: 12px;
		margin: 8px 0 0 0;
	}

	hr{
		width: 190px;
		margin-top: 15px;
	}

	.navItems{
		width: 190px;
		display: flex;
		flex-direction: column;
	}

	.navItem{
		font-size: 20px;
		color: white;
		text-decoration: none;
		padding: 15px;
		margin: 8px 0;
	}

	.navItem:hover{
		background-color: #f2bc85;
		border-radius: 10px;
	}
	
</style>

</head>
<body>
	<div class="userSideBar">
		<div class="logoContainer">
			<img src="./images/mbip.png" class="logo">
			<div class="logoDesc">
				<span class="logoName">Iskandar<br>Puteri</span>
				<p>Rendah Karbon</p>
			</div>
		</div>
		<hr>
		<div class="navItems">
		
		<% if(session.getAttribute("userRole").equals("admin")){ %>
			<a href="adminDashboard.jsp" class="navItem"><i class="bi bi-speedometer2"></i> Dashboard</a>
			<a href="manageUser.jsp" class="navItem"><i class="bi bi-people-fill"></i> Manage User</a>
			<a href="adminReport.jsp" class="navItem"><i class="bi bi-clipboard2-data"></i> Report</a> 
			<a href="validateBill.jsp" class="navItem"><i class="bi bi-ui-checks"></i> Validate Bill</a>
			
		<% } else { %>
			<a href="profile2.jsp" class="navItem"><i class="bi bi-person-circle"></i> Profile</a>
			<a href="userDashboard.jsp" class="navItem"><i class="bi bi-speedometer2"></i> Dashboard</a>
			<a href="bills.jsp" class="navItem"><i class="bi bi-receipt"></i> Bills</a>
			<a href="certificate.jsp" class="navItem"><i class="bi bi-award"></i> Certificate</a>
		
		<% } %>
		
		</div>
		
	</div>
</body>
</html>
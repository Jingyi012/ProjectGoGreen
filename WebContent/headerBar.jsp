<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
	<style>
		body{
			margin: 0;
		}
		.headerContainer{
			width: 100%;
			box-shadow: rgba(75, 91, 116, 0.2) 0px 10px 10px -10px;
		}

        .headerItems{
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 20px;
            font-weight: 500;
        }
        
        .hamburgerMenu{
        	padding: 5px;
        	border-radius: 50%;
        	margin: 10px 15px;
        }
        
        .hamburgerMenu:hover, .userAcc:hover, .logout:hover{
        	background-color: rgb(238, 238, 238);
			cursor: pointer;
        }
        
        .account{
        	display: block;
            position: relative;
        }
		
        .logout{
        	display: none;
			position: absolute;
			background-color: #fff;
			width: 130px;
			overflow: auto;
			box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
			z-index: 1;
			padding: 15px 15px ;
			border-top: 1px solid lightgray;
        }
        
		.show {
			display: block;
		}

        .userAcc{
        	padding: 15px 15px;
			cursor: pointer;
        }
		
		/* webpage layout */
		.pageContainer{
	    	width: 100%;
	    	height: 100%;
	        min-height: 98vh;
	    }
	    .pageWrapper{
	        margin-left: 240px;
			transition: margin 0.3s ease;
	    }

		.pageNav{
			margin: 0 0 30px 0;
			font-size: 20px;
		}
		.pageNav a{
			text-decoration: none;
			color: black;
		}
		.pageNav a:hover{
			text-decoration: underline;
			color: black;
		}
	    
	</style>
</head>
<body>
	<div class="headerContainer">
        <div class="headerItems">
            <i class="bi bi-list hamburgerMenu" onclick="sideBarToggle()"></i>
            <div class="account" >
            	<div class="userAcc" onClick="toggle()">
            		<i class="bi bi-person-circle"></i>
                	<span>User Name</span>
					<i class="bi bi-caret-down-fill"></i>
            	</div>
                <div class="logout">
                	<i class="bi bi-box-arrow-left"></i>
                	<span>Logout</span>
                </div>
            </div>
        </div>
        <script>
		
		function toggle() {
			document.querySelector(".account .logout").classList.toggle("show");
			var icon = document.querySelector(".account .userAcc i.bi-caret-down-fill");
			if (icon) {
				icon.classList.remove('bi-caret-down-fill');
				icon.classList.add('bi-caret-up-fill');
			} else {
				icon = document.querySelector(".account .userAcc i.bi-caret-up-fill");
				icon.classList.remove('bi-caret-up-fill');
				icon.classList.add('bi-caret-down-fill');
			}
		}

		// Close the dropdown if the user clicks outside of it
		window.onclick = function(event) {
			if (!event.target.closest('.account')) {
				var dropdowns = document.querySelector(".account .logout");

				if (dropdowns.classList.contains('show')) {
				dropdowns.classList.remove('show');
				}

				var icon = document.querySelector(".account .userAcc i.bi-caret-up-fill");
				if (icon) {
					icon.classList.remove('bi-caret-up-fill');
					icon.classList.add('bi-caret-down-fill');
				}
			}
		}

		function sideBarToggle(){
			var sidebar = document.querySelector(".userSideBar");
			var pageWrapper = document.querySelector(".pageWrapper");
			if(sidebar.classList.contains("hideSideBar")){
				sidebar.classList.remove("hideSideBar");
				pageWrapper.style.marginLeft = "240px";
			} else {
				sidebar.classList.add("hideSideBar");
				pageWrapper.style.marginLeft = "0";
			}
            
        };
		
        
    </script>
	</div>
</body>
</html>
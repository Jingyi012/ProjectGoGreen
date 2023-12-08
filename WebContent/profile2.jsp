<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
    <title>GoGreen</title>
    <style>
	    .title{
	        margin-top: 20px;
	        margin-bottom: 20px;
	        font-size: 29px;
	        font-weight: bold;
	    }
	    
	    .pageContent{
        	padding: 30px 60px;
    	}
    	form {
            display: grid;
            row-gap: 55px;
            grid-template-columns: 260px 260px 260px 260px;
        }

        .left {
        	grid-column: 1 / 3;
        	grid-row: 1 / 4;
        }
        
        .right {
        	grid-column: 3 / 5;
        	grid-row: 1 / 4;
        }
        
        ::placeholder {
        	opacity: 0.7;
        	color: black;
        }
        
        input[type="text"]{
			width: 420px;
			height: 40px;
			margin-top: 10px;
			margin-bottom: 10px;
			background-color: #F5F5F5;
			border: solid #D9D9D9 0.3px;
			border-radius: 5px;
			padding-left: 8px;
		}
		
		.selectArea{
			width: 431.33px;
			height: 43.33px;
			margin-top: 10px;
			margin-bottom: 10px;
			background-color: #F5F5F5;
			border: solid #D9D9D9 0.3px;
			border-radius: 5px;
		}
		
		select:disabled{
			opacity: 0.7;
        	color: black;
		}
		
		input[type="file"]{
			margin-top: 20px;
			margin-bottom: 20px;
			border-radius: 5px;
			padding-left: 2px;
		}
        
        .editContainer {
        	grid-column: 2 / 4;
        	grid-row: 4 / 5;
        	text-align: center;
        	padding-right: 85px;
        }
        
        #btn{
			text-decoration: none;
			padding: 15px;
			background-color: #f2bc85;
			color: white;
			border-radius: 15px;
			border: none;
			cursor: pointer;
			width: 105px;
			height: 50px;
		}
		  
		#btn:hover{
			border: black solid 0.5px;
		}
    	

    
    </style>
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
						<a href="profile2.jsp">Profile</a>
				</div>
				<div class="title">Profile Information</div>
				
				<form action="#" method="post">
					<div class="left">
					    <label for="input1">First Name:</label><br>
					    <input type="text" id="input1" name="input1" placeholder="Ali" disabled><br>
					
					    <label for="input2">Phone Number:</label><br>
					    <input type="text" id="input2" name="input2" placeholder="01112028239" disabled><br>
					
					    <label for="input3">Category:</label><br>
					    <input type="text" id="input3" name="input3" placeholder="Housing(High Rise)" disabled><br>
					
					    <label for="input4">Address:</label><br>
					    <input type="text" id="input4" name="input4" placeholder="Loring 4d, No.12 Taman Buaya" disabled><br>
					
					    <label for="input5">Area:</label><br>
					    <select name="area" id="input5" class="selectArea" disabled>
						    <option value="pulai_indah">Pulai Indah</option>
						    <option value="kangkar_pulai">Kangkar Pulai</option>
						    <option value="pulai_utama">Pulai Utama</option>
						    <option value="sri_pulai">Sri Pulai</option>
						    <option value="taman_universiti">Taman Universiti</option>
						    <option value="mutiara_rini">Mutiara Rini</option>
						    <option value="lima_kedai">Lima Kedai</option>
						    <option value="nusa_bayu">Nusa Bayu</option>
						    <option value="gelang_patah">Gelang Patah</option>
						    <option value="leisure_farm">Leisure Farm</option>
						    <option value="tanjung_kupang">Tanjung Kupang</option>
						    <option value="medini_iskandar">Medini Iskandar</option>
						    <option value="kota_iskandar">Kota Iskandar</option>
						    <option value="bukit_horizon">Bukit Horizon</option>
						    <option value="impian_emas">Impian Emas</option>
						    <option value="sri_skudai">Sri Skudai</option>
						    <option value="skudai">Skudai</option>
						    <option value="skudai_baru">Skudai Baru</option>
						    <option value="selesa_jaya">Selesa Jaya</option>
						    <option value="tun_aminah">Tun Aminah</option>
						    <option value="nusa_bestari">Nusa Bestari</option>
						    <option value="bukit_indah">Bukit Indah</option>
						    <option value="sutera_utama">Sutera Utama</option>
						    <option value="perling">Perling</option>
						</select>
				    </div>
				    <div class="right">
					    <label for="input6">Last Name:</label><br>
					    <input type="text" id="input6" name="input6" placeholder="Zhen" disabled><br>
					
					    <label for="input7">Email:</label><br>
					    <input type="text" id="input7" name="input7" placeholder="abc123@gmail.com" disabled><br>
					
					    <label for="input8">Number of People Living In The House:</label><br>
					    <input type="text" id="input8" name="input8" placeholder="2" disabled><br>
					
					    <label for="file1">Proof of Residency:</label><br>
					    <input type="file" id="file1" name="file1"><br>
					
					    <label for="file2">Identification Card:</label><br>
					    <input type="file" id="file2" name="file2"><br>	    
				    </div>
				
				    
				    <div class="editContainer">
	                    <input type="button" id="btn" value="Edit" onclick="redirectToOtherPage()">
	                </div>
	                
				</form>
				
				<script>
		        function redirectToOtherPage() {
		         
		            window.location.href = 'editProfile2.jsp'; 
		        }
		        document.getElementById("file1").disabled = true;
		        document.getElementById("file2").disabled = true;
	    		</script>
    		
    		</div>
    	</div>
    </div>
			

</body>
</html>
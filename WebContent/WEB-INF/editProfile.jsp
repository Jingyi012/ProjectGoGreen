<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
    <title>GoGreen</title>
    <style>
        body {
            font-size: 16px;
            margin: 0;
            padding: 0;
        }

        #head 
        {
            margin-left: 30px;
        }

     

        .form-group label {
            margin-bottom: 8px;
            font-size: 16px;
        }

        #word {
            margin-bottom: 14px;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width:400px;
            background-color: #f0f0f0; 
        }
        
        
        #word1{
            margin-bottom: 14px;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width:400px;
            color:blue;
            background-color: #f0f0f0; 
            text-decoration:underline;
        }
        
    #content 
    {
            margin-top: 30px;
            margin-right: auto;
            
        }
        
        #edit-button 
        {
            margin-top: -40px;
            background-color: #FFC684;
            color: #FFFFFF;
            padding: 14px 24px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            margin-left: 450px;
            font-size: 18px;
          
        }

         h2 {
            margin-top: 20px;
            font-size: 29px;
        }}
        
#form {

    display: flex;
    flex-direction:row;
    flex-wrap: wrap;
    justify-content: space-between;
    align-items: center;
}

.form-row 
{
    display: flex;
    width: 100%;
    margin-bottom:5px;
    gap: 200px; 
    height: 80px; 
}

.pageContent{
        padding: 30px 60px;
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
					<a href="profile.jsp">Profile</a>
					>
					<a href="editProfile.jsp">Edit Profile</a>
				</div>

   
                 
                    <div id="content">
                    <h2>Profile Information</h2>
             
                    <div id="form">
                   <form id="login-form" method="post" action="<%= request.getContextPath() %>/updateProfile" enctype="multipart/form-data">
                          <div class="form-row">
        <div class="form-group">
        
            <label for="firstName">First Name:</label>
            <br>
               <br>
         <input type="text" id="word" name="firstName" value="${user.firstName}" />
        </div>

        <div class="form-group">
            <label for="lastName">Last Name:</label>
            <br>
               <br>
            <input type="text" id="word" name="lastName" value="${user.lastName}" />
        </div>
    </div>
    
                       <div class="form-row">

                        <div class="form-group">
                            <label for="phoneNo">Phone Number:</label>
                            <br>
                            <br>
                            <input type="text" id="word" name="phoneNo" value="${user.phoneNo}" />
                        </div>

                        <div class="form-group">
                            <label for="email">Email:</label>
                            <br>
                               <br>
                           <input type="text" id="word" name="email" value="${user.email}" />
                        </div>
                        </div>
                        
                        <div class="form-row">
                        <div class="form-group">
                            <label for="category">Category:</label>
                            <br>
                              <br>
                            <select id="category" name="category" onchange="${user.category}" required style="width: 420px; padding: 10px; border: 1px solid #ccc; border-radius: 5px; background-color: #f0f0f0;">
                                <option value="Housing(High Rise)">Housing(High Rise)</option>
                                <option value="Housing(Landed)">Housing(Landed)</option>
                                <option value="Institution">Institution</option>
                            </select>
                            

                        </div>

                        <div class="form-group">
                            <label for="Number of People Living In The House">Number of People Living In The House:</label>
                            <br>
                            <br>
                            <input type="text" id="word" name="people" value="${user.people}" />
                        </div>
                       </div>
                         
                       <div class="form-row">
                        <div class="form-group">
                            <label for="Address">Address:</label>
                            <br>
                            <br>
                              <input type="text" id="word" name="address" value="${user.address}" />
                        </div>

                        <div class="form-group">
                            <label for="fileUpload">Proof of residency:</label>
                            <br>
                              <a href="data:application/pdf;base64,${user.file}" target="_blank">View PDF</a>
                        </div>
                       </div>
                       
                      <div class="form-row">
                        <div class="form-group">
                            <label for="Area">Area:</label>
                            <br>
                            <br>
                             <select id="area" name="area" onchange="${user.area}" required style="width: 420px; padding: 10px; border: 1px solid #ccc; border-radius: 5px; background-color: #f0f0f0;">
                               <option value="Pulai Indah">Pulai Indah</option>
                                <option value="Kangkar Pulai">Kangkar Pulai</option>
                                <option value="Pulai Utama">Pulai Utama</option>
                                <option value="Sri Pulai">Sri Pulai</option>
                                <option value="Taman Universiti">Taman Universiti</option>
                                <option value="Mutiara Rini">Mutiara Rini</option>
                                <option value="Lima Kedai">Lima Kedai</option>
                                <option value="Nusa Bayu">Nusa Bayu</option>
                                <option value="Gelang Patah">Gelang Patah</option>
                                <option value="Leisure Farm">Leisure Farm</option>
                                <option value="Tanjung Kupang">Tanjung Kupang</option>
                                <option value="Medini Iskandar">Medini Iskandar</option>
                                <option value="Kota Iskandar">Kota Iskandar</option>
                                <option value="Bukit Horizon">Bukit Horizon</option>
                                <option value="Impian Emas">Impian Emas</option>
                                <option value="Sri Skudai">Sri Skudai</option>
                                <option value="Skudai">Skudai</option>
                                <option value="Skudai Baru">Skudai Baru</option>
                                <option value="Selesa Jaya">Selesa Jaya</option>
                                <option value="Tun Aminah">Tun Aminah</option>
                                <option value="Nusa Bestari">Nusa Bestari</option>
                                <option value="Bukit Indah">Bukit Indah</option>
                                <option value="Sutera Utama">Sutera Utama</option>
                                <option value="Perling">Perling</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="fileUpload1">Identification Card:</label>
                            <br>
                             <a href="data:application/pdf;base64,${user.ic_card}" target="_blank">View PDF</a>
                        </div>
                    </div>
                         </br>
                         </br>
                         </br>
                     
                            <input type="submit" id="edit-button" value="Update Profile">
                </form>
                    </div>
                 </div>
        
                </div>
           

            </div>
           </div>

          
         <script>
      
    </script>
    
</body>
</html>

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
            margin-left: 490px;
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
         <input type="text" id="firstName" name="firstName" value="${user.firstName}" />
        </div>

        <div class="form-group">
            <label for="lastName">Last Name:</label>
            <br>
            <input type="text" id="lastName" name="lastName" value="${user.lastName}" />
        </div>
    </div>
    
                       <div class="form-row">

                        <div class="form-group">
                            <label for="phoneNo">Phone Number:</label>
                            <br>
                            <p id="word">01112028239</p>
                        </div>

                        <div class="form-group">
                            <label for="email">Email:</label>
                            <br>
                           <input type="text" id="email" name="email" value="${user.email}" />
                        </div>
                        </div>
                        
                        <div class="form-row">
                        <div class="form-group">
                            <label for="category">Category:</label>
                            <br>
                             <p id="word">Housing(High Rise)</p>

                        </div>

                        <div class="form-group">
                            <label for="Number of People Living In The House">Number of People Living In The House:</label>
                            <br>
                           <p id="word">2</p>
                        </div>
                       </div>
                         
                       <div class="form-row">
                        <div class="form-group">
                            <label for="Address">Address:</label>
                            <br>
                             <p id="word">lorong 4d,No.12 Taman buaya</p>
                        </div>

                        <div class="form-group">
                            <label for="fileUpload">Proof of residency:</label>
                            <br>
                            <p id="word1">Proof.pdf</p>
                        </div>
                       </div>
                       
                      <div class="form-row">
                        <div class="form-group">
                            <label for="Area">Area:</label>
                            <br>
                              <p id="word">Pulai</p>
                        </div>

                        <div class="form-group">
                            <label for="fileUpload1">Identification Card:</label>
                            <br>
                            <p id="word1">Ic.pdf</p>
                        </div>
                    </div>
                         </br>
                         </br>
                         </br>
                     
                            <input type="submit" value="Update Profile" />
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

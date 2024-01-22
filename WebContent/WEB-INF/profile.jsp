<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.model.User" %>
<%
    User user = (User) request.getAttribute("user");
    if (user != null) {
        String status = user.getStatus();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" integrity="sha384-r6NfM2SVaPaaFssdfMzgt/HC6OeAXz5DQJ3c3zU++RLAnJ2HYl6W/J1I5F6syGff" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-iKp5Q/jNWF6DWf/hqx65ep8LwYiJ/WtD6er5cjfKKGJaw1CFsfD5xZlvaNLQ2Rq" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
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
            background-color: #FFC684;
            color: #FFFFFF;
            padding: 14px 24px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            margin-left: 470px;
            font-size: 18px;
          
        }

         h2 {
            margin-top: 20px;
            font-size: 29px;
        }}
        
#form {
    margin-bottom:10px;
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
					<a href="profile">Profile</a>
					
					
				</div>

   
                 
                    <div id="content"  id="content" size="A4">
                    <h2 id="dTitle" >Profile Information</h2>
                       <p>Status = ${user.status}</p>
                    <div id="form">
                   <form id="login-form" method="post" action="<%= request.getContextPath() %>/editProfile" enctype="multipart/form-data">
                          <div class="form-row">
        <div class="form-group">
        
            <label for="firstName">First Name:</label>
            <br>
  
        <p id="word">${user.firstName}</p>
        </div>

        <div class="form-group">
            <label for="lastName">Last Name:</label>
            <br>
             
            <p id="word">${user.lastName}</p>
        </div>
    </div>
    
                       <div class="form-row">

                        <div class="form-group">
                            <label for="phoneNo">Phone Number:</label>
                            <br>
                            <p id="word">${user.phoneNo}</p>
                        </div>

                        <div class="form-group">
                            <label for="email">Email:</label>
                            <br>
                              
                          <p id="word">${user.email}</p>
                        </div>
                        </div>
                        
                        <div class="form-row">
                        <div class="form-group">
                            <label for="category">Category:</label>
                            <br>
                           
                              <p id="word">${user.category}</p>

                        </div>

                        <div class="form-group">
                            <label for="Number of People Living In The House">Number of People Living In The House:</label>
                            <br>
                          <p id="word">${user.people}</p>
                        </div>
                       </div>
                         
                       <div class="form-row">
                        <div class="form-group">
                            <label for="Address">Address:</label>
                            <br>
                             <p id="word">${user.address}</p>
                        </div>

                        <div class="form-group">
                            <label for="Address">Proof of residency:</label>
                            <br>
                            <a href="data:application/pdf;base64,${user.file}" target="_blank">View PDF</a>

                        </div>
                       </div>
                       
                      <div class="form-row">
                        <div class="form-group">
                            <label for="Area">Area:</label>
                            <br>
                              <p id="word">${user.area}</p>
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
                     
       <%
    String status = user.getStatus(); 
    if ("pending".equals(status)) {
%>
    <input type="submit" id="edit-button" value="Edit">
<%
    }
%>



                </form>
                    </div>
                 </div>
        
                </div>
           

            </div>
           </div>

          
    
</body>
</html>

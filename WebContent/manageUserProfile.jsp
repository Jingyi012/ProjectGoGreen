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
         
            font-size: 18px;
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
    margin-bottom: 2px;
    gap: 200px; 
    height: 80px; 
}

.pageContent{
        padding: 30px 60px;
    }
    
    
        #approve-button {
            background-color: #4CAF50;
            color: #FFFFFF;
            margin-left: 50px;
        }

        #reject-button {
            background-color: #FFC684;
            color: #FFFFFF;
            margin-left: 20px;
        }
        
         #button
        {
          display:flex;
          margin-left:400px;
        }
        
        #word
        {
            margin-bottom: -30px;
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
					<a href="manageUserProfile.jsp">Manage User</a>
				</div>
				
                <form action="ProfileServlet" method="post" enctype="multipart/form-data">
                 
                    <div id="content">
                    <h2>User Information</h2>
             
                    <div id="form">
                          <div class="form-row">
        <div class="form-group">
            <label for="firstName">First Name:</label>
            <br>
            <p id="word">Ali</p>
        </div>

        <div class="form-group">
            <label for="lastName">Last Name:</label>
            <br>
             <p id="word">Zhen</p>
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
                              <p id="word">abc123@gmail.com</p>
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
                             <p id="word">3</p>
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
                     
                         <div id="button">
                     <button type="button" id="approve-button" onclick="approve()">Approve</button>
                     <button type="button" id="reject-button" onclick="reject()">Reject</button>
                    </div>
                         
                    </div>
                 </div>
        
                </form>
           

            </div>
           </div>
          </div>
           <script>
        function approve() {
     
        	 window.alert('This participant is approved');
        }

        function reject() {
            var reason = prompt('Please provide a reason for rejection:');
            
            if (reason !== null && reason.trim() !== '') {
                alert('This participant is rejected. Reason: ' + reason);
            } else {
                alert('Rejection canceled or reason not provided.');
            }
        }

    </script>
    
</body>
</html>

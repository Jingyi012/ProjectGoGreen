<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GoGreen</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }

        header {
            background-color: #045BAC;
            padding: 15px;
            text-align: center;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        h1 
        {
            color: white;
        }

        #button-container {
            display: flex;
            align-items: center;
        }

        #login, #signup {
            background-color: #045BAC;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            margin: 0 10px;
            border-radius: 5px;
        }

        #line 
        {
            margin-top: 30px;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-left:25px;
           
        }
        
        #line a {
            font-size: 24px;
        }

        #image1 
        {
            display: flex;
            align-items: center; 
            margin-right: 10px;
            width: 40px;
            height: 40px; 
            border-radius: 50%; 
            background-color:white
        }

        #image1 img {
            max-width: 100%;
            height: auto;
            border-radius: 50%;
            margin-right: 20px; 
        }

        #image1 h1 
        {
            color: white;
            margin-right: 10px;
        }

        #image2
        {
            margin-top:50px;
            margin-left:230px;
        }

        #login-form {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 20px;
         
        }

       #login-form div {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }


        #login-form input {
    margin: 5px;
    padding: 10px;
    width: 200px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f0f0f0;
}

        
    .forgot-password 
    {
    margin-top: 10px;
    margin-left:850px;
    color: #045BAC;
    font-size: 10px; 
    text-decoration:none;
}

   #login-button {
    margin-top:10px;
    background-color: #FFC684;
    color: #FFFFFF;
    margin-left:30px;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

  #bottom
  {
    display:flex;
    margin-top:10px;
    margin-left:658px;
    margin-bottom:100px;
  
  }
  
  #bottom a
  {
   margin-bottom:4px;
  }
  
  .signup-link
  {
   margin-top:12px;
   font-size:20px;
   text-decoration: underline;
  }
  
  #field1
  {
    margin-left:80px;
  }
  
  #field2
  {
    margin-right:30px;
  }
  
  #field
  {
    display:flex;
  }
  
   footer 
   {
            background-color: #045BAC;
            color: white;
            text-align: center;
            padding: 10px;
            position: fixed;
            bottom: 0;
            width: 100%;
    }
    
    #field3
    {
      margin-right:72px;
    }
    
    
     #content 
    {
    max-width: 800px; 
    margin: 0 auto;

 
}

        
    </style>
</head>
<body>
    <header>
        <div id="image1">
            <img src="${pageContext.request.contextPath}/resources/images/mbip.png" alt="" style="max-width: 100%; height: auto;">
            <h1>Iskandar</h1> 
            <h1>Puteri</h1>
        </div>
        <div id="button-container">
            <a href="<%= request.getContextPath() %>/login" id="login">Login</a>
            <a href="<%= request.getContextPath() %>/register" id="signup">Sign Up</a>
        </div>
    </header>
    <div id="content">
    <div id="image2">
        <img src="images/iskandar_logo.png" alt="" style="max-width: 100%; height: auto;">
    </div>
    <form id="login-form" method="post" action="<%= request.getContextPath() %>/resetPassword/submit" enctype="multipart/form-data">
    <div id="line">
        <a href="#">Reset Password</a>
        <br>
   <div id="field">
            <div id="field1">
        <label for="nric">NRIC:</label>
        
    </div>
    
        <div id="field2">
         <input type="text" id="NRIC" name="NRIC" placeholder="Enter your NRIC">
        
    </div>
    
   </div>
            
            <div id="field3">
                <label for="password">Confirm New Password:</label>
                <input type="password" id="password" name="password" placeholder="Enter your password">
            </div>
      
        
    </div>
  
    <button type="submit" id="login-button">Reset</button>
     </form>
     </div>
     <footer>
      
    </footer>
</body>
</html>

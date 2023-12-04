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

        #line {
            margin-top: 30px;
            display: flex;
            flex-direction: column;
            align-items: center;
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
            margin-left:580px;
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
    color: #000000;
    font-size: 10px; 
    text-decoration:none;
}

   #continue-button {
    margin-top:10px;
    background-color: #FFC684;
    color: #FFFFFF;
    margin-left:20px;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

  #bottom
  {
    display:flex;
    margin-top:20px;
    margin-left:20px;
    font-size:23px;
  }
  
  
  
  
  .login-link
  {
   margin-top:19px;
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
    
    .account
    {
       margin-bottom:10px;
    }
 

        
    </style>
    <script>
    function navigateToReset() {

        window.location.href = 'resetPassword.jsp';
    }
</script>
</head>
<body>
    <header>
        <div id="image1">
            <img src="images/mbip.png" alt="" style="max-width: 100%; height: auto;">
            <h1>Iskandar</h1> 
            <h1>Puteri</h1>
        </div>
        <div id="button-container">
             <a href="<%= request.getContextPath() %>/login.jsp" id="login">Login</a>
            <a href="<%= request.getContextPath() %>/register.jsp" id="signup">Sign Up</a>
        </div>
    </header>
    <div id="image2">
        <img src="images/iskandar_logo.png" alt="" style="max-width: 100%; height: auto;">
    </div>
    <div id="line">
        <a href="#">Forgot Password</a>
        <form id="login-form">
   
            
            <div>
                 <input type="email" id="email" name="email" placeholder="Enter your email" required>
            </div>
        </form>
    
    <button type="submit" id="continue-button" onclick="navigateToReset()">Continue</button>
    
    <div id="bottom">
    <p id="account">No account yet?</p>
    <a href="<%= request.getContextPath() %>/login.jsp" class="login-link">Login here</a>
    </div>
     <footer>
      
    </footer>
</body>
</html>
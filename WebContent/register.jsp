<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GoGreen</title>
 <style>
        body 
        {
            margin: 0;
            font-family: Arial, sans-serif;
        }

        header 
        {
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

        #image1 img 
        {
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

        #content
        {   
            display:flex;
            margin-top:10px;
            margin-left:60px;
        }
        
        
        
        #form1
        {
            margin-left: 10px; 
            margin-top:20px;
        }
        
        #form1 h1 
        {
        
            color: #045BAC; 
            margin-left:400px;
            
        }
        
        #field1
        {
          margin-left:220px;
          
        
        
        }
        
         #field2
        {
          margin-left:220px;
          
        
        }
        
         #field3
        {
          margin-left:220px;
        
        }
        
         #field4
        {
          margin-left:220px;
        
        }
        
        
         #field5
        {
          margin-left:220px;
        
        }
        
         #field6
        {
          margin-left:220px;
        
        }
        
        .form-group input[type="text"] {
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f0f0f0;
    color: #333;
}
              .form-group input[type="email"] {
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f0f0f0;
    color: #333;
}

      .form-group input[type="tel"] {
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f0f0f0;
    color: #333;
}
           .form-group input[type="password"] {
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f0f0f0;
    color: #333;
}
        
        .form-group {
    display: inline-block; 
    margin-right: 150px; 
   
    
}    

      #termsForm {
            margin-left: 280px;
        }
        
         #login-button {
    margin-top:10px;
    background-color: #FFC684;
    color: #FFFFFF;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin-left:420px;
}

   #field6 .form-group 
   {
    display: flex;
    align-items: center;
   
 
}


#field6 .form-group div {
    margin-right: 155px;
}

#field6 .form-group label {
    margin-right: 10px;
}

#field6 input 
{
    width: 160px;
    padding: 5px; 
    
}

#category {
    width: 173px;
    font-size: 11px; 
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f0f0f0;
}

.form-group input {
    width: 160px;
    padding: 5px; 
}

.form-group input[type="file"] {

    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f0f0f0;
}

#image2 
{

    margin-left: 70px;
    margin-top: 90px; 
    width: 750px;
    height: 200px;
  
}


    </style>
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
    <div id="content">
        <div id="image2">
        <img id="image2" src="images/iskandar_logo.png" alt="" style="max-width: 100%; height: auto;">
        </div>
        <div id="form1">
            <h1>Sign up</h1>
            <form id="field1">
    <div class="form-group">
        <label for="firstName">First Name:</label>
        </br>
        <input type="text" id="firstName" name="firstName" required>
    </div>

    <div class="form-group">
        <label for="lastName">Last Name:</label>
        </br>
        <input type="text" id="lastName" name="lastName" required>
    </div>
</form>  
    </br>
    <form id="field2">
    <div class="form-group">
        <label for="NRIC">NRIC:</label>
        </br>
        <input type="text" id="firstName" name="firstName" required>
    </div>

    <div class="form-group">
        <label for="Identification Card">Identification Card:</label>
        </br>
        <input type="text" id="Identification Card" name=Identification Card" required>
    </div>
</form>
      </br>
    <form id="field3">
       <div class="form-group">
                            <label for="email">Email:</label>
                            <br>
                            <input type="email" id="email" name="email" required>
                        </div>

     <div class="form-group">
                            <label for="phoneNo">Phone Number:</label>
                            <br>
                            <input type="tel" id="phoneNo" name="phoneNo" pattern="[0-9]{11}" required>
                        </div>

</form>
      </br>
    <form id="field4">
    <div class="form-group">
                            <label for="category">Category:</label>
                            <br>
                            <select id="category" name="category" >
                                <option value="option1">Housing(High Rise)</option>
                                <option value="option2">Housing(Landed)</option>
                                <option value="option3">Institution</option>
                            </select>
                        </div>

    <div class="form-group">
        <label for="Area">Area::</label>
        </br>
        <input type="text" id="Area" name="Area" required>
    </div>
</form>

    </br>
    <form id="field5">
  <div class="form-group">
                            <label for="Address">Address:</label>
                            <br>
                            <input type="text" id="Address" name="Address" required>
                        </div>

   <div class="form-group">
                            <label for="fileUpload">Proof of residency:</label>
                            <br>
                            <input type="file" id="fileUpload" name="fileUpload" accept=".pdf, .doc, .docx" required>
                        </div>
</form>

      </br>
    <form id="field6">
    <div class="form-group">
   <div>
                <label for="password">PASSWORD:</label>
                <input type="password" id="password" name="password" placeholder="Enter your password">
            </div>

   <div>
                <label for="Confirm password">Confirm PASSWORD:</label>
                <input type="password" id="Confirm password" name="password" placeholder="Enter your password">
            </div>
     </div>
</form>
     
     </br>
     </br>
     <div id="termsForm">
            <form>
                <label>
                    <input type="checkbox" id="agreeTerms" name="agreeTerms" required>
                    I agree to all the statements in Terms of Service
                </label>
            </form>
        </div>
       
      </br>
      <button type="submit" id="login-button">Sign Up</button>
      
        </div>
    </div>

 
    
</body>
</html>

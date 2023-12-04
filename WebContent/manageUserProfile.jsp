<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>GoGreen</title>
    <style>
        body {
            font-size: 16px;
            margin: 0;
            padding: 0;
        }

        #head {
            margin-left: 30px;
        }

        #head p {
            word-spacing: 0.5px;
        }

        .form-group {
            display: inline-block;
            margin-bottom: 20px;
            margin-right: 200px;
        }

        .form-group label {
            margin-bottom: 8px;
            font-size: 18px;
        }

        .form-group input,
        .form-group select,
        .form-group button,
        .form-group file {
            margin-bottom: 14px;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width:300px;
            background-color: #f0f0f0; 
        }

        #content {
            margin-top: 30px;
            margin-left: 180px;
            margin-right: auto;
            
        }

        #edit-button {
            margin-top: 20px;
            background-color: #FFC684;
            color: #FFFFFF;
            padding: 14px 24px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            margin-left: 570px;
            font-size: 18px;
        }

        h2 
        {
            margin-top: 20px;
            margin-left: 180px;
            font-size: 24px;
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
          margin-left:500px;
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
                <form action="ProfileServlet" method="post" enctype="multipart/form-data">
                    <div id="head">
                        <p>Home > Manage User</p>
                    </div>
                    <h2>Profile Information</h2>
                    <div id="content">
                        <div class="form-group">
                            <label for="firstName">First Name:</label>
                            <br>
                            <input type="text" id="firstName" name="firstName" required>
                        </div>

                        <div class="form-group">
                            <label for="lastName">Last Name:</label>
                            <br>
                            <input type="text" id="lastName" name="lastName" required>
                        </div>

                        <div class="form-group">
                            <label for="phoneNo">Phone Number:</label>
                            <br>
                            <input type="tel" id="phoneNo" name="phoneNo" pattern="[0-9]{11}" required>
                        </div>

                        <div class="form-group">
                            <label for="email">Email:</label>
                            <br>
                            <input type="email" id="email" name="email" required>
                        </div>

                        <div class="form-group">
                            <label for="category">Category:</label>
                            <br>
                            <select id="category" name="category" required style="width: 320px; font-size: 16px; padding: 10px; border: 1px solid #ccc; border-radius: 5px; background-color: #f0f0f0;">
                                <option value="option1">Housing(High Rise)</option>
                                <option value="option2">Housing(Landed)</option>
                                <option value="option3">Institution</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="Number of People Living In The House">Number of People Living In The House:</label>
                            <br>
                            <input type="text" id="Number of People Living In The House" name="Number of People Living In The House" required>
                        </div>

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

                        <div class="form-group">
                            <label for="Area">Area:</label>
                            <br>
                            <input type="text" id="Area" name="Area" required>
                        </div>

                        <div class="form-group">
                            <label for="fileUpload1">Identification Card:</label>
                            <br>
                            <input type="file" id="fileUpload1" name="fileUpload1" accept=".pdf, .doc, .docx" required>
                        </div>

                    </div>
                    <br>
                    <div id="button">
                     <button type="button" id="approve-button" onclick="approve()">Approve</button>
                     <button type="button" id="reject-button" onclick="reject()">Reject</button>
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
          
            alert('This participant is rejected');
        }
    </script>
</body>
</html>
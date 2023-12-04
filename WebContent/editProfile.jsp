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

    .form-group input {
        margin-bottom: 14px;
        padding: 10px;
        width: 300px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 5px;
        background-color: #f0f0f0; 
    }

    #content {
        margin-top: 30px;
        margin-left: 180px;
        margin-right: auto;
    }

    #submit-button {
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

    h2 {
        margin-top: 20px;
        margin-left: 180px;
        font-size: 24px;
    }
</style>
   
       <script>
        function showMessage() {
            // You can customize the pop-up message here
            alert("Profile information submitted successfully!");
        }
    </script>

</head>
<body>
    <div class="pageContainer">
        <div class="sideBarContainer">
            <jsp:include page="sidebar.jsp" />
        </div>

        <div class="pageWrapper">
            <jsp:include page="headerBar.jsp" />
            <div class="pageContent">
                <div id="head">
                    <p>Home > Profile > Edit Profile</p>
                </div>
                <h2>Profile Information</h2>
                <div id="content">
                    <form id="field1">
                        <div class="form-group">
                            <label for="firstName">First Name:</label>
                            <br>
                           <input type="text" id="firstName" name="firstName" value="${requestScope.firstName}" required><br>
                        </div>
                       

                        <div class="form-group">
                            <label for="lastName">Last Name:</label>
                            <br>
                           <input type="text" id="lastName" name="lastName" value="${requestScope.lastName}" required><br>
                        </div>
                    </form> <br>
                    <form id="field2">
                        <div class="form-group">
    <label for="phoneNo">Phone Number:</label>
    <br>
    <input type="tel" id="phoneNo" name="phoneNo" value="${requestScope.phoneNo}" pattern="[0-9]{10}" required>
</div>


                       <div class="form-group">
    <label for="email">Email:</label>
    <br>
    <input type="email" id="email" name="email" value="${requestScope.email}" required>
</div>

                    </form>
                    <br>
                    <form id="field3">
            <div class="form-group">
    <label for="category">Category:</label>
    <br>
    <select id="category" name="category"  required style="width: 320px; font-size: 16px; padding: 10px; border: 1px solid #ccc; border-radius: 5px; background-color: #f0f0f0;">
        <option value="Housing(High Rise)">Housing(High Rise)</option>
        <option value="Housing(Landed)">Housing(Landed)</option>
        <option value="Institution">Institution</option>
    </select>
</div>



                        <div class="form-group">
                            <label for="Number of People Living In The House">Number of People Living In The House:</label>
                            <br>
                            <input type="number" id="Number of People Living In The House" name="Number of People Living In The House" value="<%= request.getAttribute("numberOfPeople") %>" required>
                        </div>
                    </form>
                    <br>
                    <form id="field4">
                        <div class="form-group">
                            <label for="Address">Address:</label>
                            <br>
                            <input type="text" id="Address" name="Address"value="<%= request.getAttribute("address") %>" required>
                        </div>

                       <div class="form-group">
    <label for="fileUpload">Proof of residency:</label>
    <br>
   <input type="text" id="fileUpload" name="fileUpload" value="${requestScope.fileUploadName}" readonly><br>
</div>

                    </form>

                    <br>
                    <form id="field5">
                       <div class="form-group">
    <label for="Area">Area:</label>
    <br>
    <input type="text" id="Area" name="Area" value="<%= request.getAttribute("area") %>" required>
</div>


                                    <div class="form-group">
    <label for="fileUpload1">Identification Card:</label>
    <br>
    <input type="text" id="fileUpload1" name="fileUpload"1 value="${requestScope.fileUploadName}" readonly><br>

</div>
                    </form>

                </div>
                <br>
       
       

        <button id="submit-button" onclick="showMessage()">Submit</button>

            </div>
        </div>

    </div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>GoGreen</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
    <style>
        #head {
            margin-left: 30px;
        }

        #head p {
            word-spacing: 0.5px;
        }

        h2 
        {
            margin-left: 530px;
        }

        table {
            width: 180%;
            margin: auto;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid black;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

    
        th:first-child,
        td:first-child {
            text-align: center;
        }


        .validation-icon {
            color: green;
            cursor: pointer; 
        }
        
            #content 
    {
    display:inline-block;
    margin: 0 auto;
}

#form-row
{

  margin-left:175px;
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
                <div id="head">
                    <p>Home > Manage User</p>
                </div>
                <div id="content">
                <h2>Manage User</h2>

                <form id="form-row">
                    <table>
                        <tr>
                            <td>No</td>
                            <td>Participant</td>
                            <td>Validate</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>Ali</td>
                 
                            <td><a href="manageUserProfile.jsp"><i class="bi bi-check-circle validation-icon"></i></a></td>
                        </tr>
                    </table>
                </form>
                </div>
            </div>
            
        </div>
    </div>
</body>
</html>





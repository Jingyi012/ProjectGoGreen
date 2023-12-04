<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>GoGreen</title>
    <!-- Include Bootstrap Icons CSS -->
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
            margin-left: 540px;
        }

        table {
            width: 50%;
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

        /* Center the "No" column */
        th:first-child,
        td:first-child {
            text-align: center;
        }

        /* Apply styles to the validation icons */
        .validation-icon {
            color: green;
            cursor: pointer; /* Add cursor pointer to indicate it's clickable */
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
                <h2>Manage User</h2>

                <form>
                    <table>
                        <tr>
                            <td>No</td>
                            <td>Participant</td>
                            <td>Validate</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>Ali</td>
                            <!-- Wrap the icon in an anchor tag with the desired href -->
                            <td><a href="manageUserProfile.jsp"><i class="bi bi-check-circle validation-icon"></i></a></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
</body>
</html>





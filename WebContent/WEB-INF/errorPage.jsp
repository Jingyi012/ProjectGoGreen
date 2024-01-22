<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error Page</title>
    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        .error-container {
            text-align: center;
        }

        h1 {
            color: red;
        }

        .retry-button {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            background-color: #4caf50;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h1>User not found with the provided IC and email.</h1>
       <a href="<%= request.getContextPath() %>/forgotPassword"class="retry-button">Retry</a>
    </div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }
        .welcome-container {
            width: 300px;
            margin: 100px auto;
            padding: 25px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 5px;
            text-align: center;
        }
        .registration-button input[type="submit"] {
            width: auto;
            padding: 8px 16px;
            font-size: 14px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 20px;
        }
        .registration-button input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

    <div class="welcome-container">
        <h1>Welcome to JSP!</h1>

        <%-- JSP Scriptlet to declare and use a variable --%>
        <%
            String name = "Visitor";
        %>

        <p>Hello, <%= name %>! We're glad you're here.</p>

        <%-- Displaying current date and time --%>
        <p>Current date and time: <%= new java.util.Date() %></p>

        <!-- Centered registration button -->
        <div class="registration-button">
            <form action="home" method="get">
                <input type="submit" value="Home" />
            </form>
        </div>
    </div>

</body>
</html>

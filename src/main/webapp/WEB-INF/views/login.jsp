<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }
        .login-container {
            width: 300px;
            margin: 100px auto;
            padding: 25px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 5px;
            position: relative;
        }
        .registration-button {
            position: absolute;
            top: 10px;
            right: 10px;
        }
        .registration-button form {
            display: inline;
        }
        .registration-button input[type="submit"] {
            width: auto;
            padding: 5px 12px;
            font-size: 12px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .registration-button input[type="submit"]:hover {
            background-color: #45a049;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0 15px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .error {
            color: red;
        }
    </style>
</head>
<body>

    <!-- Login Form -->
    <div class="login-container">
        
        <!-- Registration Button at the top-right inside the form box -->
        <div class="registration-button">
            <form action="registerPage" method="get">
                <input type="submit" value="Register" />
            </form>
        </div>

        <h2>Login</h2>
        <form action="login" method="post">
            <label for="username">Username</label>
            <input type="text" id="userName" name="username" required>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>

            <input type="submit" value="Login">

            <% 
                String errorMessage = (String) request.getAttribute("error");
                if (errorMessage != null) {
            %>
                <p class="error"><%= errorMessage %></p>
            <% } %>
        </form>
    </div>

</body>
</html>

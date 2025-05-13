<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            text-align: center;
            padding-top: 100px;
        }
        .home-container {
            background-color: white;
            display: inline-block;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        h2 {
            margin-bottom: 30px;
        }
        .button {
            display: inline-block;
            background-color: #4CAF50;
            color: white;
            padding: 12px 24px;
            margin: 10px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        .button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="home-container">
        <h2>Welcome to Student Management System</h2>

        <!-- These go to Spring Boot controller endpoints -->
        <form action="loginPage" method="get" style="display: inline;">
            <input type="submit" class="button" value="Login" />
        </form>

        <form action="registerPage" method="get" style="display: inline;">
            <input type="submit" class="button" value="Register" />
        </form>
    </div>
</body>
</html>

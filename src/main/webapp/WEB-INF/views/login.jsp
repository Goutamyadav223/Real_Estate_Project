<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0; padding: 0;
            background-color: #f4f4f4;
        }

        /* Navigation Bar */
        nav {
            background-color: #003366;
            overflow: hidden;
        }

        nav a {
            float: left;
            display: block;
            color: #ddd;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
            font-weight: bold;
        }

        nav a:hover {
            background-color: #0059b3;
            color: white;
        }

        /* Login Container */
        .login-container {
            width: 350px;
            margin: 80px auto;
            padding: 30px;
            background-color: white;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
            border-radius: 8px;
            position: relative;
        }

        .login-container h2 {
            text-align: center;
            color: #003366;
        }

        label {
            font-weight: bold;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0 16px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            width: 100%;
            background-color: #004080;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0066cc;
        }

        .registration-button {
            position: absolute;
            top: 15px;
            right: 15px;
        }

		.registration-button input[type="submit"] {
		    padding: 6px 14px;
		    font-size: 12px;
		    background-color: #004080;
		    color: white;
		    border: none;
		    border-radius: 5px;
		    font-weight: bold;
		    cursor: pointer;
		    transition: background-color 0.3s ease;
		}

		.registration-button input[type="submit"]:hover {
		    background-color: #0066cc;
		}

        .error {
            color: red;
            text-align: center;
            margin-top: 10px;
        }

        /* Footer */
        footer {
            background-color: #003366;
            color: #ccc;
            text-align: center;
            padding: 15px 0;
            margin-top: 50px;
        }
    </style>
</head>
<body>

<!-- Navigation -->
<nav>
    <a href="${pageContext.request.contextPath}/home">Home</a>
</nav>

<!-- Login Form -->
<div class="login-container">

    <!-- Register Button -->
    <div class="registration-button">
        <form action="${pageContext.request.contextPath}/registration" method="get">
            <input type="submit" value="Register" />
        </form>
    </div>

    <h2>Login</h2>
    <form action="${pageContext.request.contextPath}/user/get" method="post">
        <label for="username">Username</label>
        <input type="text" id="userName" name="userName" required>

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

<!-- Footer -->
<footer>
    <p>&copy; 2025 DreamHome Real Estate. All rights reserved.</p>
</footer>

</body>
</html>

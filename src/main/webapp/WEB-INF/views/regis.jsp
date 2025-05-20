<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
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

        /* Registration Container */
        .registration-container {
            width: 400px;
            margin: 80px auto;
            padding: 30px;
            background-color: white;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
            border-radius: 8px;
            position: relative;
        }

        .registration-container h2 {
            text-align: center;
            color: #003366;
        }

        label {
            font-weight: bold;
            color: #004080;
            display: block;
            margin-top: 10px;
        }

        input[type="text"], input[type="password"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
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

        /* Login Button on top right */
        .login-button {
            position: absolute;
            top: 15px;
            right: 15px;
        }

        .login-button form {
            display: inline;
        }

        .login-button input[type="submit"] {
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

        .login-button input[type="submit"]:hover {
            background-color: #0066cc;
        }

        .error {
            color: red;
            text-align: center;
        }

        .success {
            color: green;
            text-align: center;
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

<!-- Registration Form -->
<div class="registration-container">

    <!-- Login Button -->
    <div class="login-button">
        <form action="login" method="get">
            <input type="submit" value="Login" />
        </form>
    </div>

    <h2>Registration Form</h2>

	<form action="${pageContext.request.contextPath}/user/create" method="post">

	    <label for="name">Name</label>
	    <input type="text" id="name" name="name" required>

	    <label for="userName">Username</label>
	    <input type="text" id="userName" name="userName" required>

	    <label for="password">Password</label>
	    <input type="password" id="password" name="password" required>

	    <input type="submit" value="Register" />

	</form>

</div>

<!-- Footer -->
<footer>
    <p>&copy; 2025 DreamHome Real Estate. All rights reserved.</p>
</footer>

</body>
</html>

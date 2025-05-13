<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .registration-container {
            width: 400px;
            margin: 100px auto;
            padding: 25px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 5px;
            position: relative;
        }

        .registration-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
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
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .login-button {
            position: absolute;
            top: 10px;
            right: 10px;
        }

        .login-button form {
            display: inline;
        }

        .login-button input[type="submit"] {
            width: auto;
            padding: 5px 12px;
            font-size: 12px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .login-button input[type="submit"]:hover {
            background-color: #45a049;
        }

        .error {
            color: red;
            text-align: center;
        }

        .success {
            color: green;
            text-align: center;
        }
    </style>
</head>
<body>

    <div class="registration-container">

        <!-- Top-right Login Button inside the box -->
        <div class="login-button">
            <form action="loginPage" method="get">
                <input type="submit" value="Login" />
            </form>
        </div>

        <h2>Registration Form</h2>

        <form action="registration" method="post">

            <label for="id">ID</label>
            <input type="number" id="id" name="id" required>

            <label for="name">Name</label>
            <input type="text" id="name" name="name" required>

            <label for="userName">Username</label>
            <input type="text" id="userName" name="userName" required>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>

            <input type="submit" value="Register" />

           

        </form>
    </div>

</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Property - DreamHome</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef2f3;
            margin: 0;
            padding: 0;
        }

        nav {
            background-color: #003366;
            overflow: hidden;
            padding: 10px 20px;
        }

        nav a {
            color: white;
            text-decoration: none;
            padding: 12px 16px;
            font-weight: bold;
            display: inline-block;
        }

        nav a:hover {
            background-color: #0059b3;
            color: #fff;
        }

        .left-nav {
            float: left;
        }

        .right-nav {
            float: right;
        }

        nav::after {
            content: "";
            display: table;
            clear: both;
        }

        .form-container {
            max-width: 500px;
            margin: 40px auto;
            padding: 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .form-container h2 {
            text-align: center;
            color: #003366;
            margin-bottom: 25px;
        }

        form label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            color: #003366;
        }

        form input, form textarea, form select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        form input[type="submit"] {
            background-color: #003366;
            color: white;
            cursor: pointer;
            font-weight: bold;
        }

        form input[type="submit"]:hover {
            background-color: #0059b3;
        }

        footer {
            background-color: #003366;
            color: #ccc;
            text-align: center;
            padding: 15px 0;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

    </style>
</head>
<body>

<!-- Navigation Bar -->
<nav>
    <div class="left-nav">
        <a href="${pageContext.request.contextPath}/LandingPage">Home</a>
        <a href="${pageContext.request.contextPath}/AddProperty">Add Property</a>
    </div>
    <div class="right-nav">
        <a href="${pageContext.request.contextPath}/profile">My Profile</a>
    </div>
</nav>
<!-- Form Section -->
<div class="form-container">
    <h2>Add Property</h2>
    <form action="${pageContext.request.contextPath}/property/add" method="post">
        
		<label for="userName">User Name:</label>
		<input type="text" name="userName" id="userName" required>


        <label for="city">City:</label>
        <input type="text" name="city" id="city" required>

        <label for="area">Area:</label>
        <input type="text" name="area" id="area" required>

        <label for="price">Price:</label>
        <input type="number" name="price" id="price" step="0.01" required>

        <label for="type">Property Type:</label>
        <select name="type" id="type" required>
            <option value="">--Select--</option>
            <option value="Flat">Flat</option>
            <option value="House">House</option>
            <option value="Plot">Plot</option>
        </select>

		<label for="contant">About:</label>
		<textarea name="contant" id="contant" rows="5" required></textarea>

        <input type="submit" value="Submit Property">
    </form>
</div>

<!-- Footer -->
<footer>
    <p>&copy; 2025 DreamHome Real Estate. All rights reserved.</p>
</footer>

</body>
</html>

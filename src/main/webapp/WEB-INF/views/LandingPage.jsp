<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to DreamHome</title>
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

        .welcome {
            text-align: center;
            margin-top: 30px;
            font-size: 24px;
            color: #003366;
        }

        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            margin: 30px;
        }

        .property-card {
            background-color: white;
            border: 1px solid #ccc;
            border-radius: 10px;
            width: 300px;
            margin: 15px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }

        .property-card:hover {
            transform: scale(1.03);
        }

        .property-card img {
            width: 100%;
            height: 180px;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            object-fit: cover;
        }

        .property-info {
            padding: 15px;
        }

        .property-info h3 {
            margin: 0;
            color: #004080;
        }

        .property-info p {
            margin: 5px 0;
            color: #333;
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
        <a href="${pageContext.request.contextPath}/property/add">Add Property</a>
    </div>
    <div class="right-nav">
        <a href="${pageContext.request.contextPath}/profile">My Profile</a>
    </div>
</nav>

<!-- Welcome Message -->
<div class="welcome">
    Welcome, ${sessionScope.userName} to DreamHome!
</div>

<!-- Sample Properties -->
<div class="card-container">
    <div class="property-card">
        <img src="https://via.placeholder.com/300x180" alt="Property Image">
        <div class="property-info">
            <h3>3 BHK Apartment</h3>
            <p>Location: New Delhi</p>
            <p>Price: ₹75 Lakhs</p>
        </div>
    </div>

    <div class="property-card">
        <img src="https://via.placeholder.com/300x180" alt="Property Image">
        <div class="property-info">
            <h3>2 BHK Flat</h3>
            <p>Location: Mumbai</p>
            <p>Price: ₹1.2 Crore</p>
        </div>
    </div>

    <!-- Add more cards dynamically here later -->
</div>

<!-- Footer -->
<footer>
    <p>&copy; 2025 DreamHome Real Estate. All rights reserved.</p>
</footer>

</body>
</html>

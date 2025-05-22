<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Profile - DreamHome</title>
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
            float: left;
            color: white;
            text-decoration: none;
            padding: 12px 16px;
            font-weight: bold;
        }

        nav a:hover {
            background-color: #0059b3;
            color: #fff;
        }

        nav::after {
            content: "";
            display: table;
            clear: both;
        }

        .right-nav {
            float: right;
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

        .profile-card {
            background-color: white;
            border: 1px solid #ccc;
            border-radius: 10px;
            width: 350px;
            margin: 15px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            padding: 20px;
        }

        .profile-card h3 {
            color: #004080;
            margin-bottom: 10px;
        }

        .profile-card p {
            margin: 6px 0;
            color: #333;
        }

        .button {
            display: inline-block;
            margin-top: 10px;
            padding: 8px 14px;
            background-color: #004080;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
        }

        .button:hover {
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
    <!-- Left-side links -->
    <div>
        <a href="${pageContext.request.contextPath}/LandingPage">Home</a>
        <a href="${pageContext.request.contextPath}/AddProperty">Add Property</a>
    </div>

    <!-- Right-side link -->
    <div class="right-nav">
        <a href="${pageContext.request.contextPath}/profile">My Profile</a>
    </div>
</nav>

<!-- Welcome Message -->
<div class="welcome">
    Welcome, ${sessionScope.userName} to Your Profile!
</div>

<!-- Profile Details Section -->
<div class="card-container">

    <!-- Personal Information -->
    <div class="profile-card">
        <h3>Your Information</h3>
        <p><strong>Name:</strong> ${sessionScope.name}</p>
        <p><strong>Email:</strong> ${sessionScope.email}</p>
        <p><strong>Username:</strong> ${sessionScope.userName}</p>
        <a href="${pageContext.request.contextPath}/editProfile" class="button">Edit Profile</a>
    </div>

    <!-- Posted Properties -->
    <div class="profile-card">
        <h3>Your Listings</h3>
        <p>You have <strong>${sessionScope.listingCount}</strong> active property listings.</p>
        <a href="${pageContext.request.contextPath}/myProperties" class="button">View My Properties</a>
    </div>

    <!-- Saved Properties -->
    <div class="profile-card">
        <h3>Saved Properties</h3>
        <p>You have <strong>${sessionScope.savedCount}</strong> saved properties.</p>
        <a href="${pageContext.request.contextPath}/wishlist" class="button">View Wishlist</a>
    </div>

    <!-- Change Password -->
    <div class="profile-card">
        <h3>Account Security</h3>
        <a href="${pageContext.request.contextPath}/changePassword" class="button">Change Password</a>
    </div>

</div>

<!-- Footer -->
<footer>
    <p>&copy; 2025 DreamHome Real Estate. All rights reserved.</p>
</footer>

</body>
</html>

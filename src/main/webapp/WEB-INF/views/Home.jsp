<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Real Estate Home</title>
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

        /* Hero Section */
        .hero-image {
            position: relative;
            background-image: url('images/image1.png');
            height: 400px;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
        }

        .hero-overlay {
            position: absolute;
            top: 0; left: 0; right: 0; bottom: 0;
            background-color: rgba(0,0,0,0.5);
            z-index: 1;
        }

        .hero-content {
            position: relative;
            z-index: 2;
            text-align: center;
        }

        .hero-content h1 {
            font-size: 48px;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.7);
        }

        .btn-group {
            margin-top: 20px;
        }

        .btn {
            background-color: #004080;
            color: white;
            padding: 12px 28px;
            margin: 0 10px;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            text-decoration: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
            display: inline-block;
        }

        .btn:hover {
            background-color: #0066cc;
        }

        /* Container and Property Cards */
        .container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 0 20px;
        }

        h2 {
            color: #004080;
            margin-bottom: 15px;
        }

        .property-list {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .property-card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            width: 30%;
            overflow: hidden;
            text-align: center;
            transition: transform 0.3s ease;
        }

        .property-card:hover {
            transform: scale(1.03);
        }

        .property-card img {
            width: 100%;
            height: 180px;
            object-fit: cover;
        }

        .property-details {
            padding: 15px;
        }

        .property-details h3 {
            margin: 0 0 10px 0;
            color: #003366;
        }

        .property-details p {
            margin: 5px 0;
            color: #555;
        }

        /* Footer */
        footer {
            background-color: #003366;
            color: #ccc;
            text-align: center;
            padding: 15px 0;
            margin-top: 40px;
        }
    </style>
</head>
<body>

<!-- Navigation Menu (Home Only) -->
<nav>
    <a href="${pageContext.request.contextPath}/home" class="btn">Home</a>
</nav>

<!-- Hero Section with Login/Register -->
<div class="hero-image">
    <div class="hero-overlay"></div>
    <div class="hero-content">
        <h1>Welcome to Real Estate</h1>
        <div class="btn-group">
			<a href="${pageContext.request.contextPath}/login" class="btn">Login</a>
			<a href="${pageContext.request.contextPath}/registration" class="btn">Register</a>
        </div>
    </div>
</div>

<!-- Main Content: Featured Properties -->
<div class="container">
    <h2>Featured Properties</h2>
    <div class="property-list">
        <div class="property-card">
            <img src="images/luxury_villa.png" alt="Luxury Villa" />
            <div class="property-details">
                <h3>Luxury Villa</h3>
                <p>4 Beds • 3 Baths • 3500 sqft</p>
                <p>Location: Beverly Hills, CA</p>
                <p><strong>$1,200,000</strong></p>
            </div>
        </div>

        <div class="property-card">
            <img src="images/cozy_cottage.png" alt="Cozy Cottage" />
            <div class="property-details">
                <h3>Cozy Cottage</h3>
                <p>3 Beds • 2 Baths • 1500 sqft</p>
                <p>Location: Austin, TX</p>
                <p><strong>$560,000</strong></p>
            </div>
        </div>

        <div class="property-card">
            <img src="images/Modern_Apartment.png" alt="Modern Apartment" />
            <div class="property-details">
                <h3>Modern Apartment</h3>
                <p>2 Beds • 2 Baths • 1200 sqft</p>
                <p>Location: New York, NY</p>
                <p><strong>$850,000</strong></p>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer>
    <p>&copy; 2025 DreamHome Real Estate. All rights reserved.</p>
</footer>

</body>
</html>

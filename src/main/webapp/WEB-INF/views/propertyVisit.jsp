<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <meta charset="UTF-8">
    <title>Property Details - DreamHome</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;600;800&display=swap');
        * { box-sizing: border-box; }

        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: #f9fafc;
            color: #003366;
        }

        nav {
            position: fixed;
            width: 100%;
            top: 0;
            left: 0;
            padding: 20px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: #003366;
            z-index: 1000;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }

        nav .left-nav, nav .right-nav {
            display: flex;
            gap: 20px;
            align-items: center;
        }

        nav a, nav button {
            color: white;
            font-weight: 600;
            font-size: 14px;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 30px;
            border: 1.5px solid transparent;
            background: rgba(255, 255, 255, 0.15);
            cursor: pointer;
            transition: background 0.3s ease, border-color 0.3s ease;
        }

        nav a:hover, nav button:hover {
            background: white;
            color: #003366;
            border-color: #003366;
        }

        nav form { margin: 0; }

		.property-wrapper {
		    margin-top: 130px;
		    padding: 20px;
		    width: 100%;
		    display: flex;
		    justify-content: center;
		}

		.property-card {
		    width: 400px; /* 👈 Adjust width here as needed */
		    background: #fff;
		    border-radius: 15px;
		    box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1);
		    overflow: hidden;
		}


        .property-img img {
            width: 100%;
            height: auto;
            object-fit: cover;
            max-height: 280px;
        }

        .property-info {
            padding: 16px;
        }

        .property-info p {
            font-size: 15px;
            margin: 6px 0;
            color: #333;
        }

        .property-info p strong {
            color: #003366;
        }

        .btn-contact {
            display: inline-block;
            margin: 10px 0;
            padding: 10px 25px;
            background-color: #003366;
            color: white;
            border: none;
            border-radius: 30px;
            font-weight: bold;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .btn-contact:hover {
            background-color: #0055aa;
        }

        textarea {
            width: 100%;
            height: 80px;
            padding: 10px;
            border-radius: 10px;
            border: 1px solid #ccc;
            font-family: 'Poppins', sans-serif;
            font-size: 14px;
            resize: vertical;
            margin-top: 10px;
        }

        footer {
            background-color: #003366;
            color: #ccc;
            text-align: center;
            padding: 20px 0;
            font-size: 14px;
            margin-top: 60px;
        }

        @media (max-width: 600px) {
            nav {
                padding: 15px 25px;
            }

            nav a, nav button {
                font-size: 13px;
                padding: 8px 16px;
            }
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 16px;
        }

        .user-info h4 {
            margin: 0;
            font-size: 16px;
            color: #0066cc;
        }

        .user-photo {
            width: 45px;
            height: 45px;
            border-radius: 50%;
            object-fit: cover;
        }
    </style>
</head>
<body>

<!-- 🔵 Navigation -->
<nav>
    <div class="left-nav">
        <form action="${pageContext.request.contextPath}/property/getAll" method="get" style="display:inline;">
            <button type="submit" title="Home">
                <i class="fas fa-house"></i>
            </button>
        </form>
        <a href="${pageContext.request.contextPath}/AddProperty">Add Property</a>
        </div>
    <div class="right-nav">
        <a href="${pageContext.request.contextPath}/interest/notification/${sessionScope.user.id}" title="Notifications" style="position: relative;">🔔</a>
        <a href="${pageContext.request.contextPath}/property/MyProfile">My Profile</a>
    </div>
</nav>

<!-- 🔵 Property Content -->
<div class="property-wrapper">
    <div class="property-card">

        <div class="user-info">
            <img src="${pageContext.request.contextPath}/user/image/${property.user.id}" alt="profile photo" class="user-photo" />
            <h4>${property.user.name}</h4>
        </div>

        <!-- Image -->
        <div class="property-img">
            <img src="${pageContext.request.contextPath}/property/image/${property.id}" alt="Property Image">
        </div>

        <!-- Info -->
        <div class="property-info">
            <h3>${property.city} - ${property.area}</h3>
            <p><strong>Type:</strong> ${property.type}</p>
            <p><strong>Price:</strong> ₹${property.price}</p>
            <p><strong>About:</strong> ${property.contant}</p>

            <!-- Interest Form -->
            <form method="post" action="${pageContext.request.contextPath}/interest/set" onsubmit="addCurrentTime()">
                <input type="hidden" name="propertyId" value="${property.id}">
                <input type="hidden" name="senderUserId" value="${sessionScope.user.id}">
                <input type="hidden" name="receiverUserId" value="${property.user.id}">
                <textarea name="message" placeholder="Write a short message"></textarea>
                <input type="hidden" id="interestTime" name="interestTime">
                <button type="submit" class="btn-contact">Interested</button>
            </form>
        </div>
    </div>
</div>

<!-- 🔵 Footer -->
<footer>
    <p>&copy; 2025 DreamHome Real Estate. All rights reserved.</p>
</footer>

<script>
    function addCurrentTime() {
        const now = new Date();
        const localDateTime = now.toISOString().replace("Z", "");
        document.getElementById("interestTime").value = localDateTime;
    }
</script>

</body>
</html>

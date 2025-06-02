<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Profile - DreamHome</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;600;800&display=swap');

        * { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            font-family: 'Poppins', sans-serif;
            background: #f4f7fc;
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

        nav form {
            margin: 0;
        }

        nav form button {
            background: rgba(255, 255, 255, 0.15);
            border: none;
        }

        .content {
            display: flex;
            gap: 40px;
            padding: 130px 40px 40px;
            max-width: 1200px;
            margin: auto;
            align-items: flex-start;
        }

        .profile-card {
            background-color: white;
            border-radius: 16px;
            width: 300px;
            padding: 25px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.08);
            position: sticky;
            top: 120px;
            align-self: flex-start;
        }

        .profile-photo {
            text-align: center;
            margin-bottom: 20px;
        }

        .profile-photo img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #004080;
        }

        .upload-photo {
            text-align: center;
            margin-top: 10px;
        }

        .upload-photo input[type="file"] {
            margin-top: 8px;
        }

        .upload-photo input[type="submit"] {
            margin-top: 10px;
            padding: 8px 20px;
            border-radius: 20px;
            border: none;
            background-color: #003366;
            color: white;
            cursor: pointer;
            font-weight: 600;
        }

        .upload-photo input[type="submit"]:hover {
            background-color: #0059b3;
        }

        .profile-card h2 {
            color: #004080;
            margin: 15px 0;
            text-align: center;
        }

        .profile-card p {
            margin: 10px 0;
            font-size: 16px;
            color: #333;
        }

        .properties {
            flex: 1;
            display: grid;
            gap: 20px;
        }

        .property-card {
            background: white;
            border-radius: 14px;
            box-shadow: 0 6px 12px rgba(0,0,0,0.08);
            padding: 20px;
            display: flex;
            gap: 20px;
        }

        .property-card img {
            width: 180px;
            height: 120px;
            border-radius: 10px;
            object-fit: cover;
            border: 1px solid #ccc;
        }

        .property-details {
            flex: 1;
        }

        .property-details h3 {
            margin-top: 0;
            color: #003366;
        }

        .no-properties {
            text-align: center;
            font-weight: 600;
            color: #555;
            margin-top: 20px;
        }

        footer {
            background-color: #003366;
            color: #ccc;
            text-align: center;
            padding: 20px 0;
            font-size: 14px;
            margin-top: 40px;
        }

        @media (max-width: 768px) {
            .content {
                flex-direction: column;
            }

            .profile-card {
                position: relative;
                width: 100%;
                top: 0;
            }

            .properties {
                width: 100%;
            }

            .property-card {
                flex-direction: column;
            }

            .property-card img {
                width: 100%;
                height: auto;
            }
        }
    </style>
</head>
<body>

<!-- Navigation Bar -->
<nav>
    <div class="left-nav">
        <form action="${pageContext.request.contextPath}/property/getAll" method="get">
            <button type="submit" title="Home"><i class="fas fa-house"></i></button>
        </form>
        <a href="${pageContext.request.contextPath}/AddProperty">Add Property</a>
      </div>
    <div class="right-nav">
        <a href="${pageContext.request.contextPath}/interest/notification/${sessionScope.user.id}" title="Notifications">🔔</a>
        <a href="${pageContext.request.contextPath}/property/MyProfile">My Profile</a>
    </div>
</nav>

<!-- Main Content -->
<div class="content">

    <!-- Profile Section -->
    <div class="profile-card">
        <div class="profile-photo">
            <img src="${pageContext.request.contextPath}/user/image/${owner.id}" alt="profile photo" />
        </div>
        <div class="upload-photo">
            
        </div>
        <h2>Bio-Data</h2>
        <p><strong>Name:</strong> ${owner.name}</p>
        <p><strong>Username:</strong> ${owner.userName}</p>
    </div>

    <!-- Properties Section -->
    <div class="properties">
        <h2 style="color: #002244;">Properties</h2>
        <c:choose>
            <c:when test="${not empty ownerProperties}">
                <c:forEach var="property" items="${ownerProperties}">
                    <div class="property-card">
                        <img src="${pageContext.request.contextPath}/property/image/${property.id}" alt="Property Image" />
                        <div class="property-details">
                            <div style="display: flex; align-items: center; gap: 10px;">
                                <img src="${pageContext.request.contextPath}/user/image/${property.user.id}" alt="User Image"
                                     style="width: 40px; height: 40px; border-radius: 50%; border: 2px solid #004080;" />
                                <strong>${sessionScope.user.name}</strong>
                            </div>
                            <h3>${property.city} - ${property.area}</h3>
                            <p><strong>Price:</strong> ₹${property.price}</p>
                            <p><strong>Type:</strong> ${property.type}</p>
                            <p><strong>About:</strong> ${property.contant}</p>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div class="no-properties">You have no properties added yet.</div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<!-- Footer -->
<footer>
    <p>&copy; 2025 DreamHome Real Estate. All rights reserved.</p>
</footer>

</body>
</html>

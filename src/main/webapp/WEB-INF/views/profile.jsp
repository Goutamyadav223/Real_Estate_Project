<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Profile - DreamHome</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;600;800&display=swap" rel="stylesheet">
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            font-family: 'Poppins', sans-serif;
            background: #f4f7fb;
            color: #003366;
        }

        /* NAVBAR */
        nav {
            position: fixed;
            width: 100%;
            top: 0;
            padding: 20px 40px;
            display: flex;
            justify-content: space-between;
            background: #003366;
            color: white;
            z-index: 1000;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }

        nav .left-nav, nav .right-nav {
            display: flex;
            align-items: center;
            gap: 20px;
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
            transition: 0.3s ease;
        }

        nav a:hover, nav button:hover {
            background: white;
            color: #003366;
            border-color: #003366;
        }

        nav form { margin: 0; }

        /* PROFILE LAYOUT */
        .profile-wrapper {
            display: flex;
            max-width: 1100px;
            margin: 140px auto 40px;
            gap: 30px;
            padding: 0 20px;
        }

        .profile-sidebar {
            flex: 1;
            background: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.1);
            text-align: center;
        }

        .profile-sidebar img {
            width: 120px;
            height: 120px;
            object-fit: cover;
            border-radius: 50%;
            border: 3px solid #004080;
            margin-bottom: 15px;
        }

        .upload-form {
            margin: 10px 0;
        }

        .upload-form input[type="file"] {
            margin-top: 10px;
        }

        .upload-form input[type="submit"] {
            margin-top: 8px;
            background: #003366;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 20px;
            cursor: pointer;
        }
		
		

        .profile-sidebar h3 {
            margin: 15px 0 5px;
            color: #004080;
        }

        .profile-sidebar p {
            color: #777;
            font-size: 14px;
        }

		.profile-content {
		    flex: 2.5;
		    overflow-y: auto;
		    max-height: 100%;
		}
        .profile-content h2 {
            margin-bottom: 20px;
            color: #004080;
        }

        .property-list {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .property-card {
            display: flex;
            gap: 20px;
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 14px rgba(0,0,0,0.08);
        }

        .property-card img {
            width: 200px;
            height: 130px;
            object-fit: cover;
            border-radius: 10px;
        }

        .property-info {
            flex: 1;
        }

        .property-info h3 {
            margin-bottom: 6px;
            color: #003366;
        }

        .property-info p {
            margin: 3px 0;
            color: #333;
        }

        .no-properties {
            color: #777;
            margin-top: 20px;
        }

        /* FOOTER */
        footer {
            background-color: #003366;
            color: #ccc;
            text-align: center;
            padding: 20px 0;
            margin-top: 60px;
            font-size: 14px;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .profile-wrapper {
                flex-direction: column;
            }

            .property-card {
                flex-direction: column;
                align-items: center;
            }

            .property-card img {
                width: 100%;
                height: auto;
            }
        }
    </style>
</head>
<body>

<!-- NAVBAR -->
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

<!-- PROFILE WRAPPER -->
<div class="profile-wrapper">
    <!-- Sidebar -->
    <div class="profile-sidebar">
        <img src="${pageContext.request.contextPath}/user/image/${user.id}" alt="Profile Photo" />
        </form>
        <h3>${sessionScope.user.name}</h3>
        <p>${sessionScope.user.userName}</p>
    </div>

    <!-- Properties -->
    <div class="profile-content">
        <h2>Your Properties</h2>
        <c:choose>
            <c:when test="${not empty properties}">
                <div class="property-list">
                    <c:forEach var="property" items="${properties}">
                        <div class="property-card">
                            <img src="${pageContext.request.contextPath}/property/image/${property.id}" alt="Property Image">
                            <div class="property-info">
                                <h3>${property.city} - ${property.area}</h3>
                                <p><strong>Price:</strong> ₹${property.price}</p>
                                <p><strong>Type:</strong> ${property.type}</p>
                                <p><strong>About:</strong> ${property.contant}</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <p class="no-properties">You have not added any properties yet.</p>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<!-- FOOTER -->
<footer>
    <p>&copy; 2025 DreamHome Real Estate. All rights reserved.</p>
</footer>

</body>
</html>

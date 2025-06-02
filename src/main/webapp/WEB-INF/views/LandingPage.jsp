<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
  <meta charset="UTF-8">
  <title>Welcome to DreamHome</title>
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

    nav form {
      margin: 0;
    }

    nav form button {
      background: rgba(255, 255, 255, 0.15);
      border: none;
    }

    .property-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: 20px;
      padding: 40px;
      margin-top: 110px;
      justify-content: center;
    }

    .property-post {
      width: 100%;
      background-color: #fff;
      border: 1px solid #ddd;
      border-radius: 15px;
      box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1);
      overflow: hidden;
      font-family: 'Poppins', sans-serif;
    }
	.property-post {
	  cursor: pointer;
	}


    .property-user {
      display: flex;
      align-items: center;
      padding: 10px;
      border-bottom: 1px solid #eee;
    }

    .user-avatar img {
      width: 40px;
      height: 40px;
      border-radius: 50%;
    }

    .user-name {
      margin-left: 10px;
      font-weight: 600;
      color: #003366;
    }

    .property-img img {
      width: 100%;
      height: auto;
      object-fit: cover;
      max-height: 200px;
    }

    .property-info {
      padding: 10px 15px;
    }

    .property-info p {
      margin: 6px 0;
      font-size: 14px;
      color: #333;
    }

    .property-info h3 {
      font-size: 18px;
      margin: 8px 0;
      color: #003366;
    }

    .property-info form button {
      background-color: #003366;
      color: white;
      padding: 8px 16px;
      border: none;
      border-radius: 20px;
      font-weight: bold;
      cursor: pointer;
      margin-top: 10px;
      transition: background-color 0.3s ease;
    }

    .property-info form button:hover {
      background-color: #0055aa;
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
  </style>
</head>
<body>

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

  <!-- 🟡 Property Grid Section -->
  <div class="property-grid">
    <c:forEach var="property" items="${sessionScope.properties}">
      <div class="property-post" onclick="window.location.href='${pageContext.request.contextPath}/property/visit/${property.id}'">
        
		<!-- Owner Info -->
		<div class="property-user" onclick="event.stopPropagation(); window.location.href='${pageContext.request.contextPath}/Owner/property/${property.user.id}'">
		  <div class="user-avatar">
		    <img src="${pageContext.request.contextPath}/user/image/${property.user.id}" alt="profile photo" />
		  </div>
		  <div class="user-name">
		    ${property.user.name}
		  </div>
		</div>


        <!-- Property Image -->
        <div class="property-img">
          <img src="${pageContext.request.contextPath}/property/image/${property.id}" alt="Property Image" />
        </div>

        <!-- Property Details -->
        <div class="property-info">
          <h3>${property.city} - ${property.area}</h3>
          <p><strong>Type:</strong> ${property.type}</p>
          <p><strong>Price:</strong> ₹${property.price}</p>
          <p><strong>About:</strong> ${property.contant}</p>
        </div>
      </div>
    </c:forEach>
  </div>


  <footer>
    <p>&copy; 2025 DreamHome Real Estate. All rights reserved.</p>
  </footer>

</body>
</html>

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
      margin-top: 10px;
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

	  
	  .nav-profile {
	  display: flex;
	  align-items: center;
	  cursor: pointer;
	}

	.nav-profile .user-avatar img {
	  width: 40px;
	  height: 40px;
	  border-radius: 50%;
	}
	
	.filter-btn {
	   background: #fff;
	   border: 2px solid #0073e6;
	   color: #0073e6;
	   padding: 8px 18px;
	   border-radius: 30px;
	   font-weight: 600;
	   cursor: pointer;
	   box-shadow: 0 2px 6px rgba(0,115,230,0.3);
	   transition: all 0.3s ease;
	   user-select: none;
	   font-size: 14px;
	   letter-spacing: 0.02em;
	 }

	 .filter-btn:hover {
	   background: #0073e6;
	   color: #fff;
	   box-shadow: 0 6px 15px rgba(0,115,230,0.6);
	 }

	 .filter-btn.active {
	   background: #004a99;
	   border-color: #004a99;
	   color: white;
	   box-shadow: 0 8px 20px rgba(0,74,153,0.8);
	   transform: scale(1.05);
	 }

	 #apply-filter-btn:hover {
	   background: #0055aa;
	   box-shadow: 0 8px 25px rgba(0,85,170,0.9);
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
    </div>
    <div class="right-nav">
      <a href="${pageContext.request.contextPath}/interest/notification/${sessionScope.user.id}" title="Notifications" style="position: relative;">🔔</a>
	  <div class="nav-profile" onclick="event.stopPropagation(); window.location.href='${pageContext.request.contextPath}/property/MyProfile'">	
	  		        <div class="user-avatar">
	  		          <img src="${pageContext.request.contextPath}/user/image/${sessionScope.user.id}" alt="profile photo" />
	  		        </div>
	  		      </div>
	  			  
    </div>
  </nav>

  
  <div class="filter-buttons-container" style="padding: 20px 40px; background: #eef4fb; display: flex; flex-wrap: wrap; gap: 15px; justify-content: center; margin-top: 90px; border-radius: 12px; box-shadow: 0 4px 10px rgb(0 51 102 / 0.1); font-family: 'Poppins', sans-serif;">

    <!-- City Filters -->
    <div class="filter-group" style="display: flex; align-items: center; gap: 10px;">
      <strong style="min-width: 50px; color:#003366;">City:</strong>
      <button class="filter-btn" data-filter-type="city" data-filter-value="Delhi">Delhi</button>
      <button class="filter-btn" data-filter-type="city" data-filter-value="Mumbai">Mumbai</button>
      <button class="filter-btn" data-filter-type="city" data-filter-value="Bangalore">Indore</button>
      <button class="filter-btn" data-filter-type="city" data-filter-value="Hyderabad">Dewas</button>
    </div>

    <!-- Type Filters -->
    <div class="filter-group" style="display: flex; align-items: center; gap: 10px;">
      <strong style="min-width: 50px; color:#003366;">Type:</strong>
      <button class="filter-btn" data-filter-type="type" data-filter-value="Flat">Flat</button>
      <button class="filter-btn" data-filter-type="type" data-filter-value="Villa">Villa</button>
      <button class="filter-btn" data-filter-type="type" data-filter-value="Apartment">Apartment</button>
      <button class="filter-btn" data-filter-type="type" data-filter-value="Plot">Plot</button>
    </div>

    <!-- Price Filters -->
    <div class="filter-group" style="display: flex; align-items: center; gap: 10px;">
      <strong style="min-width: 50px; color:#003366;">Price:</strong>
      <button class="filter-btn" data-filter-type="price" data-filter-value="0-10000">₹0 - ₹10000</button>
      <button class="filter-btn" data-filter-type="price" data-filter-value="10001-20000">₹10000 - ₹100000</button>
      <button class="filter-btn" data-filter-type="price" data-filter-value="20001-50000">₹100000 - ₹1000000k</button>
      <button class="filter-btn" data-filter-type="price" data-filter-value="50001-10000000">₹50000000</button>
    </div>

    <!-- Apply Filter Button -->
    <button id="apply-filter-btn" style="background: #003366; color: white; padding: 12px 28px; border: none; border-radius: 30px; cursor: pointer; font-weight: 700; box-shadow: 0 5px 15px rgba(0,51,102,0.7); transition: background 0.3s ease; font-family: 'Poppins', sans-serif;">
      Apply Filter
    </button>

  </div>
  
  
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

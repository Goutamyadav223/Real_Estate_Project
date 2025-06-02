<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Notifications</title>

  <!-- Fonts & Icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;600;800&display=swap" rel="stylesheet" />

  <style>
    * {
      box-sizing: border-box;
    }

    body {
      margin: 0;
      font-family: 'Poppins', sans-serif;
      background-color: #f0f4f8;
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
      user-select: none;
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

    .page-container {
      padding-top: 120px;
      max-width: 800px;
      margin: 0 auto;
    }

    h2 {
      text-align: center;
      color: #004080;
      margin-bottom: 20px;
    }

    .notification-card {
      display: flex;
      align-items: center;
      background: #fff;
      padding: 15px;
      margin-bottom: 15px;
      border-radius: 12px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.08);
    }

    .notification-info p {
      margin: 4px 0;
      font-size: 15px;
      color: #003366;
    }

    footer {
      background: #003366;
      color: #ccc;
      text-align: center;
      padding: 20px 0;
      font-size: 14px;
      margin-top: 50px;
    }

    @media (max-width: 600px) {
      nav {
        padding: 15px 25px;
        flex-direction: column;
        align-items: flex-start;
      }

      nav .left-nav, nav .right-nav {
        flex-direction: column;
        width: 100%;
        gap: 10px;
        margin-top: 10px;
      }

      nav a, nav button {
        width: 100%;
        text-align: left;
        font-size: 13px;
        padding: 8px 16px;
      }

      .page-container {
        padding: 100px 15px 40px;
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

<div class="page-container">
  <h2>Notifications</h2>
  <div class="notifications-container">
    <c:choose>
      <c:when test="${not empty notifications}">
        <c:forEach var="notification" items="${notifications}">
          <div class="notification-card">
            <div class="notification-info">
              <p><strong>Message:</strong>${notification.message}</p>
              <p><strong>Time:</strong> ${notification.timestamp}</p>
            </div>
          </div>
        </c:forEach>
      </c:when>
      <c:otherwise>
        <p style="text-align:center; color: #777;">No notifications found.</p>
      </c:otherwise>
    </c:choose>
  </div>
</div>

<footer>
  <p>&copy; 2025 DreamHome Real Estate. All rights reserved.</p>
</footer>

</body>
</html>

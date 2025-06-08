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
    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
    }

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

    nav .left-nav,
    nav .right-nav {
        display: flex;
        align-items: center;
        gap: 20px;
    }

    nav a,
    nav button {
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

    nav a:hover,
    nav button:hover {
        background: white;
        color: #003366;
        border-color: #003366;
    }

    nav form {
        margin: 0;
    }

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
        box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
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

    /* Spacing between user info and sidebar links */
    .profile-sidebar > h3,
    .profile-sidebar > p {
        margin-bottom: 10px;
    }

    .profile-sidebar > .spacer {
        margin-bottom: 40px;
    }

    /* Sidebar links container */
    .sidebar-links {
        margin-top: 20px;
        display: flex;
        flex-direction: column;
        gap: 12px;
        text-align: left;
    }

    .sidebar-link {
        color: #003366;
        font-weight: 600;
        font-size: 15px;
        text-decoration: none;
        padding: 10px 15px;
        border-radius: 10px;
        background: #e6f0ff;
        display: flex;
        align-items: center;
        gap: 10px;
        cursor: pointer;
        transition: background 0.3s ease;
        user-select: none;
    }

    .sidebar-link:hover {
        background: #cce0ff;
        color: #001f4d;
    }

    .sidebar-link.logout {
        background: #ff4d4d;
        color: white;
    }

    .sidebar-link.logout:hover {
        background: #cc0000;
        color: white;
    }

    /* Add Property form styling */
    .add-property-form {
        display: none;
        margin-top: 10px;
        background: white;
        padding: 15px 20px;
        border-radius: 12px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        text-align: left;
        font-size: 14px;
    }

    #addPropertyForm label {
        display: block;
        margin: 8px 0 4px;
        font-weight: 600;
        color: #003366;
    }

    #addPropertyForm input[type="text"],
    #addPropertyForm input[type="number"],
    #addPropertyForm select,
    #addPropertyForm input[type="file"],
    #addPropertyForm textarea {
        width: 100%;
        padding: 6px 8px;
        margin-bottom: 12px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-family: 'Poppins', sans-serif;
        box-sizing: border-box;
        height: 28px;
        font-size: 14px;
    }

    #addPropertyForm textarea {
        height: 60px;
        resize: vertical;
        padding-top: 6px;
        padding-bottom: 6px;
        font-size: 14px;
    }

    #addPropertyForm input[type="submit"] {
        background-color: #003366;
        color: white;
        padding: 8px 16px;
        border: none;
        border-radius: 20px;
        cursor: pointer;
        font-weight: 600;
        transition: background-color 0.3s ease;
    }

    #addPropertyForm input[type="submit"]:hover {
        background-color: #002244;
    }

    /* PROFILE CONTENT */
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
        box-shadow: 0 4px 14px rgba(0, 0, 0, 0.08);
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

    /* Nav profile avatar */
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
	/* Modal overlay */
	.modal {
	  display: none; /* Hidden by default */
	  position: fixed;
	  z-index: 2000;
	  left: 0; top: 0;
	  width: 100%; height: 100%;
	  background-color: rgba(0,0,0,0.5); /* dim background */
	  justify-content: center;
	  align-items: center;
	}

	/* Modal content box */
	.modal-content {
	  background: white;
	  border-radius: 12px;
	  padding: 25px 30px;
	  max-width: 400px;
	  text-align: center;
	  box-shadow: 0 8px 20px rgba(0,0,0,0.25);
	  font-family: 'Poppins', sans-serif;
	  color: #003366;
	  font-weight: 600;
	  font-size: 16px;
	}

	/* Buttons container */
	.modal-buttons {
	  margin-top: 20px;
	  display: flex;
	  justify-content: center;
	  gap: 15px;
	}

	/* Buttons styling */
	.btn {
	  padding: 10px 22px;
	  border-radius: 25px;
	  border: none;
	  cursor: pointer;
	  font-weight: 700;
	  font-size: 14px;
	  transition: background-color 0.3s ease;
	}

	.cancel-btn {
	  background-color: #ccc;
	  color: #333;
	}

	.cancel-btn:hover {
	  background-color: #b3b3b3;
	}

	.confirm-btn {
	  background-color: #003366;
	  color: white;
	}

	.confirm-btn:hover {
	  background-color: #002244;
	}

</style>
</head>
<body>
	
	<!-- Logout Confirmation Modal -->
	<div id="logoutModal" class="modal">
	  <div class="modal-content">
	    <p>Are you sure you want to log out?</p>
	    <div class="modal-buttons">
	      <button id="cancelLogout" class="btn cancel-btn">Cancel</button>
	      <button id="confirmLogout" class="btn confirm-btn">Logout</button>
	    </div>
	  </div>
	</div>


<!-- NAVBAR -->
<nav>
    <div class="left-nav">
        <form action="${pageContext.request.contextPath}/property/getAll" method="get">
            <button type="submit" title="Home"><i class="fas fa-house"></i></button>
        </form>
    </div>
    <div class="right-nav">
        <a href="${pageContext.request.contextPath}/interest/notification/${sessionScope.user.id}" title="Notifications">🔔</a>
        <div class="nav-profile" onclick="event.stopPropagation(); window.location.href='${pageContext.request.contextPath}/property/MyProfile'">    
            <div class="user-avatar">
                <img src="${pageContext.request.contextPath}/user/image/${sessionScope.user.id}" alt="profile photo" />
            </div>
        </div>
    </div>
</nav>

<!-- PROFILE WRAPPER -->
<div class="profile-wrapper">
    <!-- Sidebar -->
    <div class="profile-sidebar">
        <img src="${pageContext.request.contextPath}/user/image/${user.id}" alt="Profile Photo" />
        <h3>${sessionScope.user.name}</h3>
        <p>${sessionScope.user.userName}</p>

        <div class="spacer"></div>

        <!-- Sidebar Links with Add Property toggle -->
        <div class="sidebar-links">
            <div class="sidebar-link" onclick="toggleForm()" style="cursor:pointer;">
                <i class="fas fa-plus-circle"></i> Add Property
            </div>

            <div id="addPropertyForm" class="add-property-form">
                <form action="${pageContext.request.contextPath}/property/add" method="post" enctype="multipart/form-data">
                    <label>City:</label>
                    <input type="text" name="city" required>

                    <label>Area:</label>
                    <input type="text" name="area" required>

                    <label>Price:</label>
                    <input type="number" name="price" required>

                    <label>Type:</label>
                    <select name="type" required>
                        <option value="">Select</option>
                        <option value="Apartment">Apartment</option>
                        <option value="Villa">Villa</option>
                        <option value="Plot">Plot</option>
                    </select>

                    <label>Image:</label>
                    <input type="file" name="imageFile" required>

                    <label>Description:</label>
                    <textarea name="contant" rows="3" required></textarea>

                    <input type="submit" value="Submit Property">
                </form>
            </div>

            <a href="${pageContext.request.contextPath}/user/editProfile" class="sidebar-link">
                <i class="fas fa-user-edit"></i> Edit Profile
            </a>
            <a href="${pageContext.request.contextPath}/user/changePassword" class="sidebar-link">
                <i class="fas fa-key"></i> Change Password
            </a>
			<a href="${pageContext.request.contextPath}/logout" id="logoutLink" class="sidebar-link logout">
			   <i class="fas fa-sign-out-alt"></i> Logout
			</a>

        </div>
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
                                <div style="display: flex; align-items: center; gap: 10px;">
                                    <img src="${pageContext.request.contextPath}/user/image/${property.user.id}" alt="User Image"
                                         style="width: 40px; height: 40px; border-radius: 50%; border: 2px solid #004080;" />
                                    <strong>${sessionScope.user.name}</strong>
                                </div>
                                <h3>${property.city} - ${property.area}</h3>
                                <p><strong>Price:</strong> ₹${property.price}</p>
                                <p><strong>Type:</strong> ${property.type}</p>
                                <p><strong>Description:</strong> ${property.contant}</p>
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

<footer>
    &copy; 2025 DreamHome. All rights reserved.
</footer>

<script>
	document.addEventListener('DOMContentLoaded', () => {
	  const logoutLink = document.getElementById('logoutLink');
	  const modal = document.getElementById('logoutModal');
	  const cancelBtn = document.getElementById('cancelLogout');
	  const confirmBtn = document.getElementById('confirmLogout');

	  logoutLink.addEventListener('click', (e) => {
	    e.preventDefault();
	    modal.style.display = 'flex';
	  });

	  cancelBtn.addEventListener('click', () => {
	    modal.style.display = 'none';
	  });

	  confirmBtn.addEventListener('click', () => {
	    // Redirect to logout URL
	    window.location.href = logoutLink.href;
	  });

	  // Optional: Close modal if user clicks outside modal content
	  window.addEventListener('click', (e) => {
	    if (e.target === modal) {
	      modal.style.display = 'none';
	    }
	  });
	});


    function toggleForm() {
        const form = document.getElementById("addPropertyForm");
        if (form.style.display === "block") {
            form.style.display = "none";
        } else {
            form.style.display = "block";
        }
    }
</script>

</body>
</html>

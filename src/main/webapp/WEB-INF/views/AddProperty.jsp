<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Add Property - DreamHome</title>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;600;800&display=swap');

  * {
    box-sizing: border-box;
  }

  body {
    margin: 0; padding: 0;
    font-family: 'Poppins', sans-serif;
    background: #f9fafc;
    color: #222;
  }

  /* NAVIGATION BAR */
  nav {
    position: fixed;
    width: 100%;
    top: 0; left: 0;
    padding: 20px 40px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    background: #003366;
    z-index: 1000;
    box-shadow: 0 4px 12px rgb(0 0 0 / 0.15);
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
    background: rgba(255 255 255 / 0.15);
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
    background: rgba(255 255 255 / 0.15);
    border: none;
  }

  /* FORM CONTAINER */
  .form-container {
    max-width: 500px;
    margin: 120px auto 60px; /* top margin adjusted for fixed nav */
    padding: 30px 35px;
    background: white;
    border-radius: 18px;
    box-shadow: 0 16px 30px rgb(0 0 0 / 0.1);
  }

  .form-container h2 {
    text-align: center;
    color: #003366;
    font-weight: 800;
    font-size: 2rem;
    margin-bottom: 30px;
    user-select: none;
  }

  form label {
    display: block;
    font-weight: 600;
    color: #004080;
    margin-bottom: 6px;
    font-size: 14px;
  }

  form input, form textarea, form select {
    width: 100%;
    padding: 12px 14px;
    margin-bottom: 20px;
    border: 1.8px solid #ccc;
    border-radius: 10px;
    font-size: 14px;
    font-family: 'Poppins', sans-serif;
    transition: border-color 0.3s ease;
  }

  form input:focus, form textarea:focus, form select:focus {
    border-color: #0078d4;
    outline: none;
  }

  form input[type="submit"] {
    background-color: #0078d4;
    color: white;
    border: none;
    font-weight: 700;
    padding: 14px;
    cursor: pointer;
    border-radius: 30px;
    font-size: 16px;
    box-shadow: 0 8px 20px rgb(0 120 212 / 0.4);
    transition: background-color 0.3s ease, box-shadow 0.3s ease;
  }
  form input[type="submit"]:hover {
    background-color: #005fa3;
    box-shadow: 0 10px 30px rgb(0 95 163 / 0.6);
  }

  /* FOOTER */
  footer {
    text-align: center;
    font-size: 14px;
    padding: 30px 15px;
    color: #666;
    background: #f2f5f9;
    user-select: none;
    margin-top: 80px;
  }

  /* RESPONSIVE */
  @media (max-width: 600px) {
    nav {
      padding: 15px 25px;
    }
    nav .left-nav, nav .right-nav {
      gap: 12px;
    }
    nav a, nav button {
      font-size: 13px;
      padding: 8px 16px;
    }
    .form-container {
      margin: 100px 15px 40px;
      padding: 20px 20px;
      max-width: 90vw;
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
	<a href="${pageContext.request.contextPath}/interest/notification/${sessionScope.user.id}" title="Notifications" style="position: relative;">
			    🔔
			  </a>
    <a href="${pageContext.request.contextPath}/property/MyProfile">My Profile</a>
  </div>
</nav>

<div class="form-container">
  <h2>Add Property</h2>
  <form action="${pageContext.request.contextPath}/property/add" method="post" enctype="multipart/form-data">
    <label for="city">City:</label>
    <input type="text" name="city" id="city" placeholder="Enter city" required>

    <label for="area">Area:</label>
    <input type="text" name="area" id="area" placeholder="Enter area/locality" required>

    <label for="price">Price:</label>
    <input type="number" name="price" id="price" step="0.01" placeholder="Enter price" required>

    <label for="type">Property Type:</label>
    <select name="type" id="type" required>
      <option value="">--Select--</option>
      <option value="Flat">Flat</option>
      <option value="House">House</option>
      <option value="Plot">Plot</option>
    </select>

    <label for="image">Image:</label>
    <input type="file" name="imageFile" id="image" placeholder="Image" required>

    <label for="contant">About:</label>
    <textarea name="contant" id="contant" rows="4" placeholder="Describe your property..." required></textarea>

    <input type="submit" value="Submit Property">
  </form>
</div>

<footer>
  <p>&copy; 2025 DreamHome Real Estate. All rights reserved.</p>
</footer>

</body>
</html>

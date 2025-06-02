<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Login | DreamHome Real Estate</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <!-- Font and Icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;600;800&display=swap" rel="stylesheet">

  <style>
    :root {
      --primary: #003366;
      --light: #f9fafc;
      --white: #ffffff;
      --error: #ff4d4d;
    }

    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
      font-family: 'Poppins', sans-serif;
    }

    body {
      background: var(--light);
      color: var(--primary);
      min-height: 100vh;
      display: flex;
      flex-direction: column;
    }

    nav {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      padding: 20px 40px;
      background: var(--primary);
      color: var(--white);
      display: flex;
      justify-content: space-between;
      align-items: center;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
      z-index: 1000;
    }

    nav a {
      color: white;
      text-decoration: none;
      padding: 10px 20px;
      border-radius: 30px;
      background: rgba(255, 255, 255, 0.15);
      font-weight: 600;
      font-size: 14px;
      transition: background 0.3s ease, border-color 0.3s ease;
      margin-left: 10px;
    }

    nav a:hover {
      background: white;
      color: var(--primary);
      border: 1.5px solid var(--primary);
    }

    .main-content {
      flex: 1;
      display: flex;
      justify-content: center;
      align-items: center;
      padding-top: 120px;
      padding-bottom: 40px;
    }

    .card {
      background-color: var(--white);
      padding: 40px 35px 25px;
      border-radius: 16px;
      box-shadow: 0 8px 30px rgba(0,0,0,0.1);
      width: 100%;
      max-width: 420px;
      position: relative;
    }

    .card h2 {
      text-align: center;
      color: var(--primary);
      font-size: 28px;
      margin-bottom: 25px;
    }

    label {
      display: block;
      margin-bottom: 8px;
      font-weight: 600;
      color: #222;
    }

    .input-group {
      position: relative;
      margin-bottom: 20px;
    }

    .input-group i {
      position: absolute;
      top: 12px;
      left: 12px;
      color: #888;
    }

    .input-group input {
      width: 100%;
      padding: 12px 12px 12px 36px;
      border: 1px solid #ccc;
      border-radius: 8px;
      font-size: 15px;
    }

    input[type="submit"] {
      width: 100%;
      background: var(--primary);
      color: white;
      padding: 14px;
      font-size: 16px;
      font-weight: bold;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      transition: background 0.3s ease;
    }

    input[type="submit"]:hover {
      background: #00509E;
    }

    .register-text {
      margin-top: 20px;
      text-align: right;
      font-size: 13px;
    }

    .register-text a {
      color: var(--primary);
      text-decoration: none;
      font-weight: bold;
      margin-left: 5px;
      padding: 6px 14px;
      border-radius: 20px;
      background: rgba(0, 51, 102, 0.1);
      transition: background 0.3s ease;
    }

    .register-text a:hover {
      background: var(--primary);
      color: white;
    }

    .error {
      text-align: center;
      color: var(--error);
      margin-top: 10px;
      font-size: 14px;
    }

    footer {
      background: var(--primary);
      color: #ccc;
      text-align: center;
      padding: 16px 0;
      font-size: 14px;
    }

    @media (max-width: 600px) {
      nav {
        padding: 15px 25px;
        flex-direction: column;
        align-items: flex-start;
      }

      nav a {
        font-size: 13px;
        padding: 8px 16px;
        margin-top: 8px;
        margin-left: 0;
      }

      .card h2 {
        font-size: 22px;
      }

      .register-text {
        text-align: center;
      }
    }
  </style>
</head>
<body>

<!-- Navigation Bar -->
<nav>
  <div class="left-nav">
    <a href="${pageContext.request.contextPath}/home">Home</a>
  </div>
</nav>

<!-- Main Login Form -->
<div class="main-content">
  <div class="card">
    <h2><i class="fas fa-user-lock"></i> Login</h2>
    <form action="${pageContext.request.contextPath}/user/login" method="post">
      <label for="userName">Username</label>
      <div class="input-group">
        <i class="fas fa-user"></i>
        <input type="text" id="userName" name="userName" required>
      </div>

      <label for="password">Password</label>
      <div class="input-group">
        <i class="fas fa-lock"></i>
        <input type="password" id="password" name="password" required>
      </div>

      <input type="submit" value="Login">

      <% String errorMessage = (String) request.getAttribute("error");
         if (errorMessage != null) {
      %>
         <p class="error"><i class="fas fa-exclamation-circle"></i> <%= errorMessage %></p>
      <% } %>
    </form>

    <!-- Register Link -->
    <div class="register-text">
      Not registered?
      <a href="${pageContext.request.contextPath}/registration">Click here</a>
    </div>
  </div>
</div>

<!-- Footer -->
<footer>
  <p>&copy; 2025 DreamHome Real Estate. All rights reserved.</p>
</footer>

</body>
</html>

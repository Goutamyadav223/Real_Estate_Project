<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>User Registration | DreamHome Real Estate</title>
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
      background: var(--primary);
      padding: 20px 40px;
      color: var(--white);
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
      display: flex;
      align-items: center;
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
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
    }

    nav a:hover {
      background: white;
      color: var(--primary);
      border: 1.5px solid var(--primary);
    }

    .registration-container {
      margin: 120px auto 60px;
      padding: 40px 35px;
      background-color: var(--white);
      box-shadow: 0 8px 30px rgba(0,0,0,0.1);
      border-radius: 16px;
      max-width: 420px;
      width: 100%;
      position: relative;
    }

    .registration-container h2 {
      color: var(--primary);
      font-size: 28px;
      margin-bottom: 30px;
      text-align: center;
    }

    label {
      display: block;
      margin-bottom: 8px;
      font-weight: 600;
      color: #222;
    }

    input[type="text"], input[type="password"] {
      width: 100%;
      padding: 12px;
      margin-bottom: 20px;
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

    .login-text {
      margin-top: 20px;
      text-align: right;
      font-size: 14px;
      color: #444;
      user-select: none;
    }

    .login-text a {
      color: var(--primary);
      font-weight: 600;
      text-decoration: none;
      margin-left: 6px;
      padding: 6px 14px;
      border-radius: 20px;
      background: rgba(0, 51, 102, 0.1);
      transition: background 0.3s ease;
    }

    .login-text a:hover {
      background: var(--primary);
      color: white;
    }

    .error, .success {
      text-align: center;
      margin-top: 10px;
      font-size: 14px;
    }

    .error {
      color: var(--error);
    }

    .success {
      color: green;
    }

    footer {
      background: var(--primary);
      color: #ccc;
      text-align: center;
      padding: 16px 0;
      font-size: 14px;
      margin-top: auto;
    }
	
	input[type="file"] {
	  width: 100%;
	  padding: 12px;
	  margin-bottom: 20px;
	  border: 1px solid #ccc;
	  border-radius: 8px;
	  font-size: 15px;
	  background-color: white;
	  color: #333;
	}



    @media (max-width: 600px) {
      nav {
        padding: 15px 25px;
      }

      nav a {
        font-size: 13px;
        padding: 8px 16px;
      }

      .registration-container {
        margin: 100px 20px 40px;
        padding: 30px 25px;
      }

      .registration-container h2 {
        font-size: 22px;
      }

      .login-text {
        text-align: center;
      }
    }
  </style>
</head>
<body>

<nav>
  <a href="${pageContext.request.contextPath}/home">Home</a>
</nav>

<div class="registration-container">
  <h2><i class="fas fa-user-plus"></i> Registration Form</h2>

  <form action="${pageContext.request.contextPath}/user/create" method="post" enctype="multipart/form-data">
    <label for="name">Name</label>
    <input type="text" id="name" name="name" required />

    <label for="userName">Username</label>
    <input type="text" id="userName" name="userName" required />

    <label for="password">Password</label>
    <input type="password" id="password" name="password" required />


	<label for="image">Image</label>
	<input type="file" name="imageFile" id="image" accept="image/*" required />
    <input type="submit" value="Register" />
  </form>

  <div class="login-text">
    Already registered?
    <a href="${pageContext.request.contextPath}/login">Login</a>
  </div>
</div>

<footer>
  <p>&copy; 2025 DreamHome Real Estate. All rights reserved.</p>
</footer>

</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>User Registration | DreamHome Real Estate</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;600;800&display=swap" rel="stylesheet">

  <style>
    :root {
      --primary: #003366;
      --light: #f9fafc;
      --white: #ffffff;
      --error: #ff4d4d;
    }
    * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Poppins', sans-serif; }
    body { background: var(--light); color: var(--primary); min-height: 100vh; display: flex; flex-direction: column; }
    nav { background: var(--primary); padding: 20px 40px; color: var(--white); position: fixed; top: 0; left: 0; width: 100%; z-index: 1000; }
    nav a { color: white; text-decoration: none; padding: 10px 20px; border-radius: 30px; font-weight: 600; background: rgba(255,255,255,0.15); }
    nav a:hover { background: white; color: var(--primary); border: 1.5px solid var(--primary); }

    .registration-container {
      margin: 120px auto 60px;
      padding: 40px 35px;
      background-color: var(--white);
      box-shadow: 0 8px 30px rgba(0,0,0,0.1);
      border-radius: 16px;
      max-width: 420px;
      width: 100%;
    }

    label { display: block; margin-bottom: 8px; font-weight: 600; color: #222; }
    input[type="text"], input[type="password"], input[type="email"], input[type="number"] {
      width: 100%;
      padding: 12px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 8px;
      font-size: 15px;
    }

    input[type="file"] {
      width: 100%;
      padding: 12px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 8px;
      background-color: white;
      color: #333;
    }

    .otp-btn {
      width: 100%;
      background: #00509E;
      color: white;
      padding: 10px;
      font-size: 14px;
      border: none;
      border-radius: 6px;
      cursor: pointer;
      margin-bottom: 10px;
    }

    .otp-btn:hover {
      background: #003f7f;
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
    }

    input[type="submit"]:hover {
      background: #00509E;
    }

    .login-text { margin-top: 20px; text-align: right; font-size: 14px; color: #444; }
    .login-text a {
      color: var(--primary);
      font-weight: 600;
      text-decoration: none;
      margin-left: 6px;
      padding: 6px 14px;
      border-radius: 20px;
      background: rgba(0, 51, 102, 0.1);
    }

    .login-text a:hover {
      background: var(--primary);
      color: white;
    }

    .message {
      text-align: center;
      font-size: 14px;
      margin-bottom: 10px;
    }

    .error { color: var(--error); }
    .success { color: green; }

    footer {
      background: var(--primary);
      color: #ccc;
      text-align: center;
      padding: 16px 0;
      font-size: 14px;
      margin-top: auto;
    }
  </style>

</head>
<body>

<nav>
  <a href="${pageContext.request.contextPath}/home">Home</a>
</nav>

<div class="registration-container">
  <h2><i class="fas fa-user-plus"></i> Registration Form</h2>

  <c:if test="${not empty Notsuccess}">
      <div class="message error">${Notsuccess}</div>
    </c:if>
  
  <form action="${pageContext.request.contextPath}/user/create" method="post" enctype="multipart/form-data">
    <label for="name">Name</label>
    <input type="text" id="name" name="name" required />

    <label for="userName">Username</label>
    <input type="text" id="userName" name="userName" required />

    <label for="email">Email</label>
    <input type="email" id="email" name="email" required />

    <button type="button" class="otp-btn" onclick="sendOtp()">Send OTP</button>

    <label for="otp">Enter OTP</label>
    <input type="number" id="otp" name="otp" required />
    <button type="button" class="otp-btn" onclick="verifyOtp()">Verify OTP</button>

    <div id="otpStatus" class="message"></div>

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

<script>
  // JSP expression evaluated by server, output plain string value in JS variable
  const contextPath = '${pageContext.request.contextPath}';

  function sendOtp() {
    const email = document.getElementById('email').value;

    if (!email) {
      alert('Please enter your email before sending OTP.');
      return;
    }

    fetch(contextPath + '/otp/send?email=' + encodeURIComponent(email), {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      }
    })
    .then(response => {
      if (!response.ok) throw new Error('Network response was not ok');
      return response.text();
    })
    .then(data => {
      document.getElementById('otpStatus').textContent = data;
      document.getElementById('otpStatus').className = 'message success';
    })
    .catch(error => {
      document.getElementById('otpStatus').textContent = 'Failed to send OTP. Try again.';
      document.getElementById('otpStatus').className = 'message error';
      console.error('Error:', error);
    });
  }
  
  function verifyOtp() {
    const email = document.getElementById('email').value;
    const otp = document.getElementById('otp').value;

    if (!email || !otp) {
      alert('Please enter both email and OTP');
      return;
    }

    fetch(contextPath + '/otp/verify?email=' + encodeURIComponent(email) + '&otp=' + encodeURIComponent(otp), {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      }
    })
    .then(response => {
      if (!response.ok) throw new Error('Invalid OTP');
      return response.text();
    })
    .then(data => {
      document.getElementById('otpStatus').textContent = data;
      document.getElementById('otpStatus').className = 'message success';
    })
    .catch(error => {
      document.getElementById('otpStatus').textContent = error.message || 'OTP verification failed';
      document.getElementById('otpStatus').className = 'message error';
    });
  }
</script>



</body>
</html>

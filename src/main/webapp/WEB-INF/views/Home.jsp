<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>DreamHome Real Estate</title>
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
    justify-content: flex-start;
    align-items: center;
    background: transparent;
    z-index: 1000;
  }

  nav a.home-link {
    color: #fff;
    font-weight: 800;
    font-size: 22px;
    text-decoration: none;
    letter-spacing: 2px;
    user-select: none;
    margin-right: auto;
  }

  /* Login/Register Buttons on top right over hero */
  .auth-buttons {
    display: flex;
    gap: 15px;
  }

  .auth-buttons a {
    font-weight: 600;
    font-size: 14px;
    text-decoration: none;
    padding: 10px 26px;
    border-radius: 30px;
    transition: 0.3s ease;
    cursor: pointer;
    box-shadow: 0 4px 15px rgb(0 120 212 / 0.3);
  }

  .auth-buttons a.login {
    background: rgba(255 255 255 / 0.3);
    color: white;
    border: 1.5px solid white;
    backdrop-filter: blur(8px);
  }

  .auth-buttons a.login:hover {
    background: white;
    color: #0078d4;
    border-color: #0078d4;
    box-shadow: 0 8px 30px rgb(0 120 212 / 0.5);
  }

  .auth-buttons a.register {
	background: rgba(255 255 255 / 0.3);
	   color: white;
	   border: 1.5px solid white;
	   backdrop-filter: blur(8px);
  }
  .auth-buttons a.register:hover {
      background: white;
      color: #0078d4;
      border-color: #0078d4;
      box-shadow: 0 8px 30px rgb(0 120 212 / 0.5);
  }

  /* HERO SECTION WITH SLIDER */
  .hero {
    position: relative;
    height: 550px;
    width: 100vw;
    overflow: hidden;
  }

  .hero-slide {
    position: absolute;
    top: 0; left: 0; right: 0; bottom: 0;
    background-position: center;
    background-size: cover;
    opacity: 0;
    transition: opacity 1.5s ease;
  }

  .hero-slide.active {
    opacity: 1;
    z-index: 1;
  }

  .hero-overlay {
    position: absolute;
    inset: 0;
    background: linear-gradient(135deg, rgba(0, 120, 212, 0.75), rgba(0, 70, 140, 0.9));
    z-index: 2;
  }

  .hero-content {
    position: relative;
    z-index: 3;
    height: 100%;
    max-width: 700px;
    margin: 0 auto;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    text-align: center;
    padding: 0 20px;
    color: #f0f6fc;
    user-select: none;
  }

  .hero-content h1 {
    font-size: 4.5rem;
    font-weight: 800;
    line-height: 1.1;
    margin-bottom: 10px;
    letter-spacing: 3px;
    text-shadow: 3px 3px 20px rgba(0,0,0,0.5);
  }

  .hero-content p {
    font-weight: 400;
    font-size: 1.4rem;
    margin-bottom: 30px;
    letter-spacing: 0.6px;
    text-shadow: 1px 1px 10px rgba(0,0,0,0.4);
  }

  /* CONTAINER AND PROPERTIES */
  main.container {
    max-width: 1150px;
    margin: 80px auto 60px;
    padding: 0 25px;
  }

  main.container h2 {
    font-weight: 700;
    font-size: 2.7rem;
    color: #003366;
    border-left: 8px solid #0078d4;
    padding-left: 12px;
    margin-bottom: 30px;
    user-select: none;
  }

  .property-list {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
    gap: 28px;
  }

  .property-card {
    background: #fff;
    border-radius: 18px;
    box-shadow: 0 14px 28px rgb(0 0 0 / 0.12);
    overflow: hidden;
    transition: transform 0.4s ease, box-shadow 0.4s ease;
    cursor: pointer;
  }

  .property-card:hover {
    transform: translateY(-12px);
    box-shadow: 0 20px 40px rgb(0 0 0 / 0.18);
  }

  .property-image {
    position: relative;
    height: 200px;
    background-size: cover;
    background-position: center;
    transition: transform 0.5s ease;
  }

  .property-card:hover .property-image {
    transform: scale(1.05);
  }

  .property-details {
    padding: 20px 22px 26px;
  }

  .property-details h3 {
    font-weight: 700;
    font-size: 1.8rem;
    color: #004080;
    margin-bottom: 10px;
    user-select: none;
  }

  .property-details p {
    font-size: 1rem;
    color: #555;
    margin: 5px 0;
  }

  .property-details p.price {
    font-weight: 700;
    font-size: 1.3rem;
    color: #0078d4;
    margin-top: 12px;
  }

  /* FOOTER */
  footer {
    text-align: center;
    font-size: 14px;
    padding: 30px 15px;
    color: #666;
    background: #f2f5f9;
    user-select: none;
  }

  /* RESPONSIVE */
  @media (max-width: 700px) {
    .hero-content h1 {
      font-size: 2.8rem;
    }

    .hero-content p {
      font-size: 1rem;
    }
  }

  @media (max-width: 450px) {
    nav {
      padding: 12px 20px;
    }

    .auth-buttons a {
      padding: 8px 16px;
      font-size: 13px;
    }
  }
</style>
<script>
  // Simple hero slider cycling images every 5 seconds
  window.addEventListener('DOMContentLoaded', () => {
    const slides = document.querySelectorAll('.hero-slide');
    let currentIndex = 0;
    function showSlide(index) {
      slides.forEach((slide, i) => {
        slide.classList.toggle('active', i === index);
      });
    }
    showSlide(currentIndex);
    setInterval(() => {
      currentIndex = (currentIndex + 1) % slides.length;
      showSlide(currentIndex);
    }, 5000);
  });
</script>
</head>
<body>

<nav>
  <a href="${pageContext.request.contextPath}/home" class="home-link">DreamHome</a>
  <div class="auth-buttons">
    <a href="${pageContext.request.contextPath}/login" class="login">Login</a>
    <a href="${pageContext.request.contextPath}/registration" class="register">Register</a>
  </div>
</nav>

<section class="hero">
  <div class="hero-slide" style="background-image: url('images/image1.png');"></div>
  <div class="hero-slide" style="background-image: url('images/images2.png');"></div>
  <div class="hero-slide" style="background-image: url('images/images3.png');"></div>
  <div class="hero-overlay"></div>
  <div class="hero-content">
    <h1>Your Dream Home Awaits</h1>
    <p>Explore exclusive properties, find your perfect match, and live the lifestyle you deserve.</p>
  </div>
</section>

<main class="container">
  <h2>Featured Properties</h2>
  <div class="property-list">
    <div class="property-card">
      <div class="property-image" style="background-image: url('images/luxury_villa.png');"></div>
      <div class="property-details">
        <h3>Luxury Villa</h3>
        <p>4 Beds • 3 Baths • 3500 sqft</p>
        <p>Location: Beverly Hills, CA</p>
        <p class="price">$1,200,000</p>
      </div>
    </div>

    <div class="property-card">
      <div class="property-image" style="background-image: url('images/cozy_cottage.png');"></div>
      <div class="property-details">
        <h3>Cozy Cottage</h3>
        <p>3 Beds • 2 Baths • 1500 sqft</p>
        <p>Location: Austin, TX</p>
        <p class="price">$560,000</p>
      </div>
    </div>

    <div class="property-card">
      <div class="property-image" style="background-image: url('images/Modern_Apartment.png');"></div>
      <div class="property-details">
        <h3>Modern Apartment</h3>
        <p>2 Beds • 2 Baths • 1200 sqft</p>
        <p>Location: New York, NY</p>
        <p class="price">$850,000</p>
      </div>
    </div>
  </div>
</main>

<footer>
  <p>&copy; 2025 DreamHome Real Estate. All rights reserved.</p>
</footer>

</body>
</html>

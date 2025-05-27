<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Food Ordering System">
    <meta name="author" content="Vinod Madhuranga">

  <title>JUST YUMMY - Food Delivery</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Playfair+Display:wght@400;500;600&display=swap" rel="stylesheet">
  <style>
    :root {
      --primary-color: #ff6b6b;
      --secondary-color: #ffa502;
      --dark-color: #2f3542;
      --light-color: #f1f2f6;
      --gradient: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
    }

    body {
      font-family: 'Poppins', sans-serif;
      margin: 0;
      padding: 0;
      overflow-x: hidden;
      background: linear-gradient(135deg, #f8f9fa 0%, #e8f4ff 100%);
      min-height: 100vh;
      color: var(--dark-color);
    }

    .brand-text {
      font-family: 'Playfair Display', serif;
      font-weight: 600;
    }

    .navbar-menu {
      background: rgba(255, 255, 255, 0.98);
      box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
      backdrop-filter: blur(10px);
    }

    .navbar-brand {
      font-weight: 700;
      color: var(--dark-color) !important;
    }

    .nav-link {
      font-weight: 500;
      color: var(--dark-color) !important;
      position: relative;
      margin: 0 0.5rem;
    }

    .nav-link:after {
      content: '';
      position: absolute;
      width: 0;
      height: 2px;
      bottom: 0;
      left: 0;
      background: var(--gradient);
      transition: width 0.3s ease;
    }

    .nav-link:hover:after {
      width: 100%;
    }

    .badge-cart {
      font-size: 0.7rem;
      top: -8px;
      right: -8px;
    }

    /* Profile Dropdown */
    .profile-dropdown {
      border: none;
      border-radius: 15px;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
      padding: 0.5rem;
      min-width: 200px;
      margin-top: 10px;
    }

    .profile-dropdown .dropdown-item {
      border-radius: 10px;
      padding: 0.7rem 1rem;
      transition: all 0.3s ease;
    }

    .profile-dropdown .dropdown-item:hover {
      background: var(--gradient);
      color: white;
      transform: translateX(5px);
    }

    .profile-dropdown .dropdown-divider {
      margin: 0.5rem 0;
      opacity: 0.1;
    }

    .hero-section {
      background: url('https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80') no-repeat center center;
      background-size: cover;
      height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      text-align: center;
      position: relative;
    }

    .hero-section::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: rgba(0, 0, 0, 0.4);
    }

    .hero-content {
      position: relative;
      z-index: 1;
      color: white;
      max-width: 800px;
      padding: 0 20px;
    }

    .hero-title {
      font-family: 'Playfair Display', serif;
      font-size: 4rem;
      font-weight: 700;
      margin-bottom: 1.5rem;
      line-height: 1.2;
      text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
    }

    .hero-subtitle {
      font-size: 1.5rem;
      margin-bottom: 2.5rem;
      opacity: 0.9;
      text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);
    }

    .btn-shop {
      background: var(--gradient);
      border: none;
      border-radius: 30px;
      padding: 15px 40px;
      font-weight: 600;
      font-size: 1.2rem;
      text-transform: uppercase;
      letter-spacing: 1px;
      color: white;
      transition: all 0.3s;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
    }

    .btn-shop:hover {
      transform: translateY(-3px);
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
      color: white;
    }

    /* Responsive adjustments */
    @media (max-width: 768px) {
      .hero-title {
        font-size: 2.5rem;
      }
      
      .hero-subtitle {
        font-size: 1.1rem;
      }
      
      .btn-shop {
        padding: 12px 30px;
        font-size: 1rem;
      }
    }
  </style>
</head>
<body>
  <!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light navbar-menu sticky-top">
    <div class="container">
        <a class="navbar-brand brand-text" href="menu">
            <i class="fas fa-utensils me-2"></i>JUST YUMMY
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="menu"><i class="fas fa-list me-1"></i>Menu</a>
                </li>
                <li class="nav-item position-relative">
                    <a class="nav-link" href="cart">
                        <i class="fas fa-shopping-cart me-1"></i>Cart
                        <span class="position-absolute badge bg-danger rounded-pill badge-cart">${cart.itemCount}</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="order"><i class="fas fa-receipt me-1"></i>Orders</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="profileDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-user-circle me-1"></i>${user.firstName}
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end profile-dropdown" aria-labelledby="profileDropdown">
                        <li>
                            <a class="dropdown-item" href="profile">
                                <i class="fas fa-user me-2"></i>Profile
                            </a>
                        </li>
                        <li><hr class="dropdown-divider"></li>
                        <li>
                            <a class="dropdown-item text-danger" href="user-logout">
                                <i class="fas fa-sign-out-alt me-2"></i>Logout
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="about"><i class="fas fa-info-circle me-1"></i>About</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

  <!-- Hero Section -->
  <section class="hero-section">
    <div class="hero-content">
      <h1 class="hero-title">Discover the Best Flavors</h1>
      <p class="hero-subtitle">Enjoy a delicious meal delivered to your door with exclusive deals!</p>
      <a href="menu" class="btn btn-shop">Shop Now</a>
    </div>
  </section>

  <!-- Bootstrap Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
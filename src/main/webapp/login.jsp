<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Food Ordering System">
    <meta name="author" content="Vinod Madhuranga">

    <title>Login - JUST YUMMY</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Playfair+Display:wght@400;500;600&display=swap" rel="stylesheet">
    <!-- Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <!-- Custom CSS -->
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
            background-color: #f8f9fa;
            color: var(--dark-color);
            min-height: 100vh;
            overflow-x: hidden;
        }

        .brand-text {
            font-family: 'Playfair Display', serif;
            font-weight: 600;
        }

        .navbar {
            background: rgba(255, 255, 255, 0.95) !important;
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

        .login-container {
            min-height: calc(100vh - 72px);
            display: flex;
            align-items: center;
            padding: 2rem 0;
        }

        .login-card {
            border: none;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
            background: white;
            max-width: 450px;
            margin: 0 auto;
        }

        .login-card:hover {
            transform: translateY(-5px);
        }

        .card-header {
            background: var(--gradient);
            color: white;
            text-align: center;
            padding: 2rem 1rem;
            position: relative;
            overflow: hidden;
        }

        .card-header:before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.2) 0%, rgba(255,255,255,0) 70%);
            animation: pulse 8s infinite linear;
        }

        .card-title {
            font-weight: 700;
            font-size: 2rem;
            position: relative;
            margin-bottom: 0;
        }

        .card-body {
            padding: 2.5rem;
        }

        .form-control {
            border-radius: 10px;
            padding: 12px 15px;
            border: 1px solid #e0e0e0;
            transition: all 0.3s;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(255, 107, 107, 0.25);
        }

        .input-group-text {
            background-color: transparent;
            border-right: none;
            color: var(--primary-color);
        }

        .btn-login {
            background: var(--gradient);
            border: none;
            border-radius: 10px;
            padding: 12px;
            font-weight: 600;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            transition: all 0.3s;
            box-shadow: 0 4px 15px rgba(255, 107, 107, 0.3);
        }

        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(255, 107, 107, 0.4);
        }

        .divider {
            display: flex;
            align-items: center;
            margin: 1.5rem 0;
        }

        .divider:before, .divider:after {
            content: '';
            flex: 1;
            height: 1px;
            background: #e0e0e0;
        }

        .divider-text {
            padding: 0 1rem;
            color: #6c757d;
            font-size: 0.8rem;
        }

        .social-login {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }

        .social-btn {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            transition: all 0.3s;
        }

        .social-btn:hover {
            transform: translateY(-3px);
        }

        .bg-google {
            background: #db4437;
        }

        .bg-facebook {
            background: #4267B2;
        }

        .bg-apple {
            background: #000000;
        }

        .register-link {
            color: var(--primary-color);
            font-weight: 500;
            text-decoration: none;
            transition: all 0.3s;
        }

        .register-link:hover {
            color: var(--secondary-color);
            text-decoration: underline;
        }

        .food-decoration {
            position: absolute;
            opacity: 0.1;
            z-index: -1;
        }

        .food-1 {
            top: 10%;
            left: 5%;
            font-size: 8rem;
            color: var(--primary-color);
        }

        .food-2 {
            bottom: 10%;
            right: 5%;
            font-size: 8rem;
            color: var(--secondary-color);
        }

        @keyframes pulse {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        .floating {
            animation: float 3s ease-in-out infinite;
        }
    </style>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light sticky-top">
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
                    <a class="nav-link active" href="login.jsp"><i class="fas fa-sign-in-alt me-1"></i>Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="register.jsp"><i class="fas fa-user-plus me-1"></i>Register</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="about"><i class="fas fa-info-circle me-1"></i>About</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Food Decorations -->
<i class="fas fa-pizza-slice food-decoration food-1 floating"></i>
<i class="fas fa-hamburger food-decoration food-2 floating"></i>

<!-- Login Container -->
<div class="container login-container animate__animated animate__fadeIn">
    <div class="login-card">
        <div class="card-header">
            <h2 class="card-title"><i class="fas fa-sign-in-alt me-2"></i>Welcome Back!</h2>
        </div>
        <div class="card-body">
            <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-danger d-flex align-items-center animate__animated animate__shakeX" role="alert">
                <i class="fas fa-exclamation-circle me-2"></i>
                <div>
                    <%= request.getAttribute("error") %>
                </div>
            </div>
            <% } %>

            <form action="login" method="post">
                <div class="mb-4">
                    <label for="email" class="form-label">Email Address</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                        <input type="email" id="email" name="email" class="form-control" placeholder="Enter your email" required>
                    </div>
                </div>
                <div class="mb-4">
                    <label for="password" class="form-label">Password</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-lock"></i></span>
                        <input type="password" id="password" name="password" class="form-control" placeholder="Enter your password" required>
                    </div>
                </div>
                <button type="submit" class="btn btn-login btn-primary w-100 mb-3">
                    <i class="fas fa-sign-in-alt me-2"></i>Login
                </button>
            </form>
            <p class="text-center mt-4">
                New to JUST YUMMY? <a href="register.jsp" class="register-link">Create an account</a>
            </p>
        </div>
    </div>
</div>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Custom JS -->
<script>
    // Add animation class when elements are in viewport
    document.addEventListener('DOMContentLoaded', function() {
        const animateElements = document.querySelectorAll('.animate-on-scroll');

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('animate__animated', 'animate__fadeInUp');
                    observer.unobserve(entry.target);
                }
            });
        }, { threshold: 0.1 });

        animateElements.forEach(el => observer.observe(el));
    });
</script>
</body>
</html>
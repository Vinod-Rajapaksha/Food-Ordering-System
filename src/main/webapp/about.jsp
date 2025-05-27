<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Food Ordering System">
    <meta name="author" content="Vinod Madhuranga">

    <title>About Us - JUST YUMMY</title>
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

        .nav-link.active {
            font-weight: 600;
        }

        .nav-link.active:after {
            width: 100%;
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

        /* Hero Section */
        .hero-section {
            background: var(--gradient);
            color: white;
            padding: 5rem 0;
            text-align: center;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            position: relative;
            overflow: hidden;
        }

        .hero-section h1 {
            font-family: 'Playfair Display', serif;
            font-size: 3rem;
            font-weight: 700;
            margin-bottom: 1rem;
            animation: fadeIn 1s ease;
        }

        .hero-section p {
            font-size: 1.2rem;
            max-width: 800px;
            margin: 0 auto;
            animation: fadeIn 1.5s ease;
        }

        /* Review Section */
        .review-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            background: white;
            padding: 1.5rem;
        }

        .review-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(255, 107, 107, 0.2);
        }

        .review-card .review-text {
            font-style: italic;
            color: #6c757d;
            margin-bottom: 1rem;
        }

        .review-card .review-author {
            font-weight: 600;
            color: var(--primary-color);
        }

        .review-card .review-rating {
            color: #f1c40f;
        }

        /* Carousel Styling */
        .review-carousel .carousel-inner {
            padding: 0 1rem;
        }

        .review-carousel .carousel-item {
            transition: transform 0.5s ease;
        }

        .review-carousel .carousel-control-prev,
        .review-carousel .carousel-control-next {
            width: 5%;
            background: var(--gradient);
            opacity: 0.7;
            border-radius: 15px;
            margin: 0 1rem;
        }

        .review-carousel .carousel-control-prev-icon,
        .review-carousel .carousel-control-next-icon {
            background-size: 100%, 100%;
        }

        .review-carousel .carousel-control-prev:hover,
        .review-carousel .carousel-control-next:hover {
            opacity: 1;
        }

        /* Map Section */
        .map-section {
            background: var(--light-color);
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }

        .map-section iframe {
            border-radius: 10px;
            width: 100%;
            height: 400px;
        }

        /* Page Title */
        .page-title {
            position: relative;
            display: inline-block;
            margin-bottom: 2rem;
        }

        .page-title:after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 0;
            width: 50%;
            height: 4px;
            background: var(--gradient);
            border-radius: 2px;
        }

        /* Toast Notification */
        .toast-custom {
            position: fixed;
            bottom: 20px;
            right: 20px;
            z-index: 1100;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.15);
        }

        .toast-header-custom {
            background: var(--gradient);
            color: white;
            border: none;
        }

        /* Food Animation */
        .food-animation {
            position: fixed;
            pointer-events: none;
            z-index: 9999;
            animation: floatFood 3s ease-in-out forwards;
        }

        @keyframes floatFood {
            0% {
                transform: translateY(0) rotate(0deg);
                opacity: 1;
            }
            100% {
                transform: translateY(-100vh) rotate(360deg);
                opacity: 0;
            }
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .hero-section h1 {
                font-size: 2rem;
            }
            .hero-section p {
                font-size: 1rem;
            }
            .map-section iframe {
                height: 300px;
            }
            .review-carousel .carousel-control-prev,
            .review-carousel .carousel-control-next {
                width: 10%;
            }
        }
        
        .contact-section {
            background: white;
            border-radius: 15px;
            padding: 2.5rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            margin-top: 3rem;
        }
        
        .contact-card {
            background: var(--light-color);
            border-radius: 12px;
            padding: 1.5rem;
            height: 100%;
            transition: all 0.3s ease;
            border-left: 4px solid var(--primary-color);
        }
        
        .contact-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(255, 107, 107, 0.1);
        }
        
        .contact-icon {
            font-size: 2rem;
            color: var(--primary-color);
            margin-bottom: 1rem;
        }
        
        .contact-title {
            font-weight: 600;
            margin-bottom: 0.5rem;
            color: var(--dark-color);
        }
        
        .contact-value {
            color: #6c757d;
            font-weight: 500;
        }
        
        .contact-value a {
            color: var(--primary-color);
            text-decoration: none;
            transition: all 0.3s ease;
        }
        
        .contact-value a:hover {
            color: var(--secondary-color);
            text-decoration: underline;
        }
        
        .whatsapp-btn {
            background-color: #25D366;
            color: white;
            border-radius: 8px;
            padding: 0.5rem 1rem;
            display: inline-block;
            margin-top: 0.5rem;
            transition: all 0.3s ease;
        }
        
        .whatsapp-btn:hover {
            background-color: #128C7E;
            color: white;
            transform: translateY(-2px);
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
                    <a class="nav-link" href="menu"><i class="fas fa-list me-1"></i>Menu</a>
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
                    <a class="nav-link active" href="about"><i class="fas fa-info-circle me-1"></i>About</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container py-5">
    <!-- Hero Section -->
    <section class="hero-section mb-5">
        <h1>Our Story at JUST YUMMY</h1>
        <p>
            Welcome to JUST YUMMY, where passion for food meets the vibrant spirit of Colombo!
            Since our inception, we've been dedicated to crafting unforgettable culinary experiences
            with fresh ingredients, bold flavors, and a sprinkle of love. Join us on a delicious journey
            that celebrates taste, community, and joy.
        </p>
    </section>

    <!-- Reviews Section -->
    <section class="mb-5">
        <h2 class="page-title"><i class="fas fa-star me-2"></i>What Our Customers Say</h2>
        <div id="reviewCarousel" class="carousel slide review-carousel" data-bs-ride="carousel">
            <div class="carousel-inner">
                <c:choose>
                    <c:when test="${not empty reviews}">
                        <c:forEach var="review" items="${reviews}" varStatus="loop">
                            <c:if test="${loop.index % 3 == 0}">
                                <div class="carousel-item ${loop.index == 0 ? 'active' : ''}">
                                    <div class="row g-4">
                                        <c:forEach var="innerReview" items="${reviews}" begin="${loop.index}" end="${loop.index + 2}">
                                            <div class="col-md-4 review-item" style="animation-delay: ${(innerReview == loop.current ? loop.index : loop.index + (innerReview == loop.current ? 0 : 1)) * 0.2}s;">
                                                <div class="review-card">
                                                    <p class="review-text">"${innerReview.comment}"</p>
                                                    <div class="review-rating">
                                                        <c:forEach begin="1" end="${innerReview.rating}">
                                                            <i class="fas fa-star"></i>
                                                        </c:forEach>
                                                        <c:forEach begin="${innerReview.rating + 1}" end="5">
                                                            <i class="far fa-star"></i>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <!-- Fallback reviews -->
                        <div class="carousel-item active">
                            <div class="row g-4">
                                <div class="col-md-4 review-item" style="animation-delay: 0.2s;">
                                    <div class="review карточка">
                                        <p class="review-text">"The best dining experience in Colombo! The flavors are out of this world."</p>
                                        <p class="review-author">Ayesha Perera</p>
                                        <div class="review-rating">
                                            <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 review-item" style="animation-delay: 0.4s;">
                                    <div class="review-card">
                                        <p class="review-text">"Amazing service and delicious food. A must-visit!"</p>
                                        <p class="review-author">Nimal Fernando</p>
                                        <div class="review-rating">
                                            <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 review-item" style="animation-delay: 0.6s;">
                                    <div class="review-card">
                                        <p class="review-text">"Loved the ambiance and the food. Perfect for any occasion."</p>
                                        <p class="review-author">Sanjana Wijesinghe</p>
                                        <div class="review-rating">
                                            <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#reviewCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#reviewCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </section>

    <!-- Map Section -->
    <section class="map-section">
        <h2 class="page-title"><i class="fas fa-map-marker-alt me-2"></i>Find Us in Colombo</h2>
        <p>Visit us at our prime location near Galle Face Green, Colombo, for a meal that delights the senses.</p>
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3960.902800151418!2d79.84361401477283!3d6.921838695001297!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zNsKwNTUnMTguNiJOIDc5wrA1MCc0My4zIkU!5e0!3m2!1sen!2slk!4v1697641234567"
                allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    </section>
    
    <!-- Contact Information Section -->
    <section class="contact-section">
        <h2 class="page-title"><i class="fas fa-address-book me-2"></i>Contact Us</h2>
        <p class="mb-4">We'd love to hear from you! Reach out to us through any of these channels.</p>
        
        <div class="row g-4">
            <div class="col-md-6 col-lg-3">
                <div class="contact-card">
                    <div class="contact-icon">
                        <i class="fas fa-phone-alt"></i>
                    </div>
                    <h4 class="contact-title">Phone</h4>
                    <p class="contact-value">
                        <a href="tel:0113478469">011 347 8469</a>
                    </p>
                </div>
            </div>
            
            <div class="col-md-6 col-lg-3">
                <div class="contact-card">
                    <div class="contact-icon">
                        <i class="fas fa-map-marker-alt"></i>
                    </div>
                    <h4 class="contact-title">Address</h4>
                    <p class="contact-value">
                        123 Galle Road, Colombo, Sri Lanka
                    </p>
                </div>
            </div>
            
            <div class="col-md-6 col-lg-3">
                <div class="contact-card">
                    <div class="contact-icon">
                        <i class="fas fa-envelope"></i>
                    </div>
                    <h4 class="contact-title">Email</h4>
                    <p class="contact-value">
                        <a href="mailto:JUSTYUMMY@gmail.com">JUSTYUMMY@gmail.com</a>
                    </p>
                </div>
            </div>
            
            <div class="col-md-6 col-lg-3">
                <div class="contact-card">
                    <div class="contact-icon">
                        <i class="fab fa-whatsapp"></i>
                    </div>
                    <h4 class="contact-title">WhatsApp</h4>
                    <p class="contact-value">
                        <a href="https://wa.me/94774369432" class="whatsapp-btn">
                            <i class="fab fa-whatsapp me-1"></i> 077 436 9432
                        </a>
                    </p>
                </div>
            </div>
        </div>
    </section>
    
</div>

<!-- Toast Notification for Errors -->
<c:if test="${not empty message}">
    <div class="toast toast-custom show" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="true" data-bs-delay="5000">
        <div class="toast-header toast-header-custom">
            <i class="fas ${messageType == 'error' ? 'fa-exclamation-circle' : 'fa-check-circle'} me-2"></i>
            <strong class="me-auto">Notification</strong>
            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="toast"></button>
        </div>
        <div class="toast-body bg-white">
                ${message}
        </div>
    </div>
</c:if>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- TouchSwipe JS for swipe support -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.touchswipe/1.6.19/jquery.touchSwipe.min.js"></script>
<script>
    // Initialize toast notifications
    document.addEventListener('DOMContentLoaded', function() {
        var toastEl = document.querySelector('.toast');
        if (toastEl) {
            var toast = new bootstrap.Toast(toastEl);
            toast.show();
            setTimeout(function() {
                toast.hide();
            }, 5000);
        }

        // Create food animations
        const foodIcons = ['🍕', '🍔', '🍟', '🌮', '🍜', '🍣', '🍦', '🍩'];

        function createFoodAnimation() {
            const food = document.createElement('div');
            food.className = 'food-animation';
            food.style.left = Math.random() * window.innerWidth + 'px';
            food.style.bottom = '-50px';
            food.style.fontSize = (Math.random() * 20 + 20) + 'px';
            food.textContent = foodIcons[Math.floor(Math.random() * foodIcons.length)];
            document.body.appendChild(food);

            setTimeout(() => {
                food.remove();
            }, 3000);
        }

        // Create food animations periodically
        setInterval(createFoodAnimation, 2000);

        // Initialize swipe support for carousel
        $("#reviewCarousel").swipe({
            swipeLeft: function() {
                $(this).carousel('next');
            },
            swipeRight: function() {
                $(this).carousel('prev');
            },
            threshold: 50
        });
    });
</script>
</body>
</html>
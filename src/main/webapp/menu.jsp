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

    <title>Menu - JUST YUMMY</title>
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

        .badge-cart {
            font-size: 0.7rem;
            top: -8px;
            right: -8px;
        }

        /* Category Sidebar */
        .category-card {
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            border: none;
        }

        .category-list .list-group-item {
            border: none;
            padding: 0.75rem 1.25rem;
            background: transparent;
        }

        .category-list .list-group-item.active {
            background: var(--gradient);
            color: white !important;
        }

        .category-list .list-group-item.active a {
            color: white !important;
        }

        .category-list a {
            text-decoration: none;
            color: var(--dark-color);
            display: block;
            transition: all 0.3s;
        }

        .category-list a:hover {
            color: var(--primary-color);
            transform: translateX(5px);
        }

        /* Menu Items */
        .menu-card {
            border: none;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            height: 100%;
        }

        .menu-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(255, 107, 107, 0.2);
        }

        .menu-card img {
            height: 200px;
            object-fit: cover;
            transition: transform 0.5s ease;
        }

        .menu-card:hover img {
            transform: scale(1.05);
        }

        .menu-card .card-body {
            display: flex;
            flex-direction: column;
        }

        .menu-card .card-title {
            font-weight: 600;
            margin-bottom: 0.5rem;
        }

        .menu-card .card-text {
            color: #6c757d;
            font-size: 0.9rem;
            flex-grow: 1;
        }

        .price {
            font-size: 1.25rem;
            font-weight: 700;
            color: var(--primary-color);
            margin: 0.5rem 0;
        }

        .quantity-control {
            width: 80px;
            text-align: center;
            border-radius: 10px;
            border: 1px solid #dee2e6;
        }

        .btn-add-to-cart {
            background: var(--gradient);
            border: none;
            border-radius: 10px;
            padding: 10px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            transition: all 0.3s;
            margin-top: auto;
        }

        .btn-add-to-cart:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 107, 107, 0.3);
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

        /* Responsive Adjustments */
        @media (max-width: 992px) {
            .category-card {
                margin-bottom: 2rem;
            }
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .menu-item {
            animation: fadeIn 0.5s ease forwards;
        }

        .menu-item:nth-child(1) { animation-delay: 0.1s; }
        .menu-item:nth-child(2) { animation-delay: 0.2s; }
        .menu-item:nth-child(3) { animation-delay: 0.3s; }
        .menu-item:nth-child(4) { animation-delay: 0.4s; }
        .menu-item:nth-child(5) { animation-delay: 0.5s; }
        .menu-item:nth-child(6) { animation-delay: 0.6s; }

        /* Add these styles to your existing CSS */
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

<div class="container py-5">
    <div class="row">
        <!-- Categories Sidebar -->
        <div class="col-lg-3">
            <div class="card category-card">
                <div class="card-body">
                    <h5 class="card-title mb-3"><i class="fas fa-filter me-2"></i>Categories</h5>
                    <ul class="list-group category-list">
                        <li class="list-group-item ${empty selectedCategory ? 'active' : ''}">
                            <a href="menu" class="${empty selectedCategory ? 'text-white' : ''}"><i class="fas fa-th-large me-1"></i>All Items</a>
                        </li>
                        <c:forEach var="category" items="${categories}">
                            <li class="list-group-item ${selectedCategory == category ? 'active' : ''}">
                                <a href="menu?category=${category}" class="${selectedCategory == category ? 'text-white' : ''}"><i class="fas fa-tag me-1"></i>${category}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Menu Items Grid -->
        <div class="col-lg-9">
            <h2 class="page-title">
                <i class="fas fa-hamburger me-2"></i>${param.category != null ? param.category : 'All Menu Items'}
            </h2>
            <div class="row g-4">
                <c:forEach var="item" items="${menuItems}" varStatus="loop">
                    <div class="col-md-6 col-lg-4 menu-item" style="animation-delay: ${loop.index * 0.1}s;">
                        <div class="card menu-card h-100">
                            <img src="${item.imageUrl}" class="card-img-top" alt="${item.name}">
                            <div class="card-body d-flex flex-column">
                                <h5 class="card-title">${item.name}</h5>
                                <p class="card-text">${item.description}</p>
                                <div class="price">$${item.price}</div>
                                <form action="menu" method="post" class="mt-auto">
                                    <input type="hidden" name="menuId" value="${item.menuId}">
                                    <div class="mb-3 d-flex align-items-center">
                                        <label for="quantity-${item.menuId}" class="form-label mb-0 me-2">Qty:</label>
                                        <input type="number" id="quantity-${item.menuId}" name="quantity"
                                               value="1" min="1" max="10" class="form-control quantity-control">
                                    </div>
                                    <button type="submit" class="btn btn-add-to-cart text-white">
                                        <i class="fas fa-cart-plus me-2"></i>Add to Cart
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<c:if test="${not empty message}">
    <div class="toast toast-custom show" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="true" data-bs-delay="3000">
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
<script>
    // Initialize toast notifications
    document.addEventListener('DOMContentLoaded', function() {
        var toastEl = document.querySelector('.toast');
        if (toastEl) {
            var toast = new bootstrap.Toast(toastEl);
            toast.show();

            // Auto-hide after 5 seconds
            setTimeout(function() {
                toast.hide();
            }, 5000);
        }

        // Quantity input validation
        document.querySelectorAll('.quantity-control').forEach(input => {
            input.addEventListener('change', function() {
                if (this.value < 1) this.value = 1;
                if (this.value > 10) this.value = 10;
            });
        });

        // Create food animations
        //const foodIcons = ['🍕', '🍔', '🍟', '🌮', '🍜', '🍣', '🍦', '🍩'];
        
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
    });
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Food Ordering System">
    <meta name="author" content="Vinod Madhuranga">

    <title>User Profile - JUST YUMMY</title>
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

        .admin-navbar {
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

        .dropdown-item.active {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
        }


        /* Profile Dropdown */
        .profile-dropdown .dropdown-menu {
            border-radius: 10px;
            border: none;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            margin-top: 10px;
        }

        .profile-dropdown .dropdown-item {
            font-weight: 500;
            padding: 10px 20px;
            transition: background 0.3s ease;
        }

        .profile-dropdown .dropdown-item:hover {
            background: var(--gradient);
            color: white;
        }

        /* Profile Card */
        .profile-card {
            border: none;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            margin-bottom: 2rem;
            transition: transform 0.3s ease;
        }

        .profile-card:hover {
            transform: translateY(-5px);
        }

        .card-header {
            background: var(--gradient);
            color: white;
            padding: 1.5rem;
        }

        .card-title {
            font-weight: 600;
            margin-bottom: 0;
        }

        /* Form Styles */
        .form-control, .form-select {
            border-radius: 10px;
            padding: 12px 15px;
            border: 1px solid #e0e0e0;
            transition: all 0.3s;
        }

        .form-control:focus, .form-select:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(255, 107, 107, 0.25);
        }

        .btn-admin {
            border-radius: 10px;
            padding: 12px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            transition: all 0.3s;
        }

        .btn-add {
            background: var(--gradient);
            border: none;
            color: white;
            box-shadow: 0 4px 15px rgba(255, 107, 107, 0.3);
        }

        .btn-add:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(255, 107, 107, 0.4);
            color: white;
        }

        .btn-delete {
            background-color: rgba(220, 53, 69, 0.1);
            color: #dc3545;
            border: none;
        }

        .btn-delete:hover {
            background-color: rgba(220, 53, 69, 0.2);
            color: #dc3545;
        }

        /* Toast Notification */
        .toast-admin {
            position: fixed;
            bottom: 20px;
            right: 20px;
            z-index: 1100;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.15);
        }

        .toast-header-admin {
            background: var(--gradient);
            color: white;
            border: none;
        }

        .btn-close-white {
            filter: invert(1);
        }

        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .btn-admin {
                display: block;
                width: 100%;
                margin: 0.2rem 0;
            }
        }

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
                            <a class="dropdown-item active" href="profile">
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
    <!-- Page Header -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="mb-0"><i class="fas fa-user me-2"></i>User Profile</h2>
    </div>

    <!-- Profile Card -->
    <div class="card profile-card">
        <div class="card-header">
            <h5 class="card-title mb-0"><i class="fas fa-user-edit me-2"></i>Profile Details</h5>
        </div>
        <div class="card-body">
            <form action="profile" method="post">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="userId" value="${user.userId}">
                <div class="row g-3">
                    <div class="col-md-6">
                        <label for="firstName" class="form-label">First Name</label>
                        <input type="text" id="firstName" name="firstName" class="form-control" value="${user.firstName}" required>
                    </div>
                    <div class="col-md-6">
                        <label for="lastName" class="form-label">Last Name</label>
                        <input type="text" id="lastName" name="lastName" class="form-control" value="${user.lastName}" required>
                    </div>
                    <div class="col-md-6">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" id="email" name="email" class="form-control" value="${user.email}" required>
                    </div>
                    <div class="col-md-6">
                        <label for="phoneNumber" class="form-label">Phone Number</label>
                        <input type="text" id="phoneNumber" name="phoneNumber" class="form-control" value="${user.phoneNumber}">
                    </div>
                    <div class="col-12">
                        <label for="address" class="form-label">Address</label>
                        <textarea id="address" name="address" class="form-control" rows="3">${user.address}</textarea>
                    </div>
                    <div class="col-md-6">
                        <label for="gender" class="form-label">Gender</label>
                        <select id="gender" name="gender" class="form-select">
                            <option value="" ${user.gender == null ? 'selected' : ''}>Select Gender</option>
                            <option value="Male" ${user.gender == 'Male' ? 'selected' : ''}>Male</option>
                            <option value="Female" ${user.gender == 'Female' ? 'selected' : ''}>Female</option>
                            <option value="Other" ${user.gender == 'Other' ? 'selected' : ''}>Other</option>
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" id="password" name="password" class="form-control" placeholder="Enter new password to change">
                    </div>
                    <div class="col-12">
                        <label class="form-label">Joined On</label>
                        <input type="text" class="form-control" value="<fmt:formatDate value='${user.createdAt}' pattern='dd MMMM yyyy'/>" readonly>
                    </div>
                </div>
                <div class="d-flex justify-content-end gap-2 mt-4">
                    <button type="submit" class="btn btn-add btn-admin"><i class="fas fa-save me-2"></i>Update Profile</button>
                </div>
            </form>
            <form action="deleteUser" method="post" style="display: inline;">
    					<input type="hidden" name="userId" value="${user.userId}">
    					<button type="submit" class="btn btn-delete btn-admin"
        				onclick="return confirm('Are you sure you want to delete your account? This action cannot be undone.')">
        				<i class="fas fa-trash me-2"></i>Delete Account
    					</button>
			</form>
        </div>
    </div>

    <!-- Toast Notification -->
    <c:if test="${not empty message}">
        <div class="toast toast-admin show" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="true" data-bs-delay="5000">
            <div class="toast-header toast-header-admin">
                <i class="fas ${messageType == 'error' ? 'fa-exclamation-circle' : 'fa-check-circle'} me-2"></i>
                <strong class="me-auto">Notification</strong>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="toast"></button>
            </div>
            <div class="toast-body bg-white">
                    ${message}
            </div>
        </div>
    </c:if>
</div>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Initialize Bootstrap components
    document.addEventListener('DOMContentLoaded', function() {
        // Initialize toast
        const toastEl = document.querySelector('.toast');
        if (toastEl) {
            const toast = new bootstrap.Toast(toastEl);
            toast.show();
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
    });
</script>
</body>
</html>
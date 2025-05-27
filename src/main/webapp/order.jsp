<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Food Ordering System">
    <meta name="author" content="Vinod Madhuranga">

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

        /* Order Cards */
        .order-card {
            border: none;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            margin-bottom: 2rem;
        }

        .order-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(255, 107, 107, 0.2);
        }

        .order-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #eee;
            padding-bottom: 0.5rem;
        }

        .order-status {
            text-transform: uppercase;
            font-size: 0.9rem;
            font-weight: 600;
        }

        .order-status.delivered { color: #198754; }
        .order-status.placed { color: #0d6efd; }
        .order-status.pending { color: #ffc107; }
        .order-status.cancelled { color: #dc3545; }

        .order-details, .order-items {
            margin-top: 1rem;
        }

        .order-items ul {
            padding-left: 1.2rem;
        }

        /* Rating System */
        .order-rating {
            margin-top: 1rem;
        }

        .rating-stars {
            display: flex;
            flex-direction: row-reverse;
            gap: 5px;
        }

        .order-rating input[type="radio"] {
            display: none;
        }

        .order-rating label {
            font-size: 1.5rem;
            color: #dee2e6;
            cursor: pointer;
            transition: color 0.2s ease;
        }

        .order-rating input:checked ~ label,
        .order-rating label:hover,
        .order-rating label:hover ~ label {
            color: #ffc107;
        }

        .btn-rate {
            background: var(--gradient);
            border: none;
            border-radius: 10px;
            padding: 5px 15px;
            color: white;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            transition: all 0.3s;
        }

        .btn-rate:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 107, 107, 0.3);
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

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .order-card {
            animation: fadeIn 0.5s ease forwards;
        }

        .order-card:nth-child(1) { animation-delay: 0.1s; }
        .order-card:nth-child(2) { animation-delay: 0.2s; }
        .order-card:nth-child(3) { animation-delay: 0.3s; }
        .order-card:nth-child(4) { animation-delay: 0.4s; }
        .order-card:nth-child(5) { animation-delay: 0.5s; }

        /* Responsive Adjustments */
        @media (max-width: 576px) {
            .order-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 0.5rem;
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
                    <a class="nav-link active" href="order"><i class="fas fa-receipt me-1"></i>Orders</a>
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
    <c:if test="${not empty sessionScope.message}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <i class="fas fa-check-circle me-2"></i>
            ${sessionScope.message}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <c:remove var="message" scope="session"/>
    </c:if>
    <h2 class="page-title"><i class="fas fa-receipt me-2"></i>Your Orders</h2>
    <c:if test="${empty orders}">
        <div class="alert alert-info">
            <i class="fas fa-info-circle me-2"></i>
            You haven't placed any orders yet. <a href="menu" class="alert-link">Browse our menu</a> to place your first order.
        </div>
    </c:if>
    <c:if test="${not empty orders}">
        <div class="row">
            <c:forEach var="order" items="${orders}" varStatus="loop">
                <div class="col-12">
                    <div class="card order-card">
                        <div class="card-body">
                            <div class="order-header">
                                <h5>Order #${order.orderId}</h5>
                                <span class="order-date text-muted"><i class="fas fa-calendar-alt me-1"></i>${order.orderDate}</span>
                                <span class="order-status ${order.status.toLowerCase()}"><i class="fas fa-circle me-1"></i>${order.status}</span>
                            </div>
                            <div class="order-details">
                                <c:set var="itemCount" value="0" />
                                <c:forEach var="item" items="${order.orderItems}">
                                    <c:set var="itemCount" value="${itemCount + item.quantity}" />
                                </c:forEach>
                                <p><strong>Total Items:</strong> ${itemCount}</p>
                                <p><strong>Total Amount:</strong> $<fmt:formatNumber value="${order.totalAmount}" type="number" minFractionDigits="2" /></p>
                            </div>
                            <div class="order-items">
                                <h6>Items:</h6>
                                <ul>
                                    <c:forEach var="item" items="${order.orderItems}">
                                        <li>
                                            ${item.menuItem.name} x ${item.quantity} = $<fmt:formatNumber value="${item.price * item.quantity}" type="number" minFractionDigits="2" />
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <c:if test="${order.status == 'Delivered'}">
                                <c:choose>
                                    <c:when test="${not empty reviewedOrderIds && reviewedOrderIds.contains(order.orderId.toString())}">
                                        <c:set var="review" value="${reviewsMap[order.orderId]}" />
                                        <div class="order-rating mt-3">
                                            <p class="mb-1"><strong>Your Rating:</strong>
                                                <c:forEach begin="1" end="5" var="i">
                                                    <i class="fas fa-star ${i <= review.rating ? 'text-warning' : 'text-muted'}"></i>
                                                </c:forEach>
                                            </p>
                                            <c:if test="${not empty review.comment}">
                                                <p class="mb-2"><strong>Your Comment:</strong> ${review.comment}</p>
                                            </c:if>
                                            <button type="button" class="btn btn-sm btn-primary" 
                                                onclick="document.getElementById('edit-form-${order.orderId}').style.display='block'">
                                                Edit Review
                                            </button>
                                            <form action="review" method="post" class="d-inline">
                                                <input type="hidden" name="action" value="delete">
                                                <input type="hidden" name="order_id" value="${order.orderId}">
                                                <input type="hidden" name="user_id" value="${sessionScope.user.userId}">
                                                <button type="submit" class="btn btn-sm btn-danger ms-2" 
                                                    onclick="return confirm('Are you sure you want to delete this review?')">
                                                    Delete Review
                                                </button>
                                            </form>
                                            <div id="edit-form-${order.orderId}" class="edit-review-form mt-3" style="display:none;">
                                                <h6>Edit Your Review</h6>
                                                <form action="review" method="post">
                                                    <input type="hidden" name="action" value="edit">
                                                    <input type="hidden" name="order_id" value="${order.orderId}">
                                                    <input type="hidden" name="user_id" value="${sessionScope.user.userId}">
                                                    <div class="mb-3">
                                                        <label class="form-label">Rating:</label>
                                                        <div class="rating-stars">
                                                            <input type="radio" id="edit-star5-${order.orderId}" name="rating" value="5" ${review.rating == 5 ? 'checked' : ''}>
                                                            <label for="edit-star5-${order.orderId}">★</label>
                                                            <input type="radio" id="edit-star4-${order.orderId}" name="rating" value="4" ${review.rating == 4 ? 'checked' : ''}>
                                                            <label for="edit-star4-${order.orderId}">★</label>
                                                            <input type="radio" id="edit-star3-${order.orderId}" name="rating" value="3" ${review.rating == 3 ? 'checked' : ''}>
                                                            <label for="edit-star3-${order.orderId}">★</label>
                                                            <input type="radio" id="edit-star2-${order.orderId}" name="rating" value="2" ${review.rating == 2 ? 'checked' : ''}>
                                                            <label for="edit-star2-${order.orderId}">★</label>
                                                            <input type="radio" id="edit-star1-${order.orderId}" name="rating" value="1" ${review.rating == 1 ? 'checked' : ''}>
                                                            <label for="edit-star1-${order.orderId}">★</label>
                                                        </div>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="edit-comment-${order.orderId}" class="form-label">Comment:</label>
                                                        <textarea class="form-control" id="edit-comment-${order.orderId}" 
                                                            name="comment" rows="3">${review.comment}</textarea>
                                                    </div>
                                                    <div class="d-flex gap-2">
                                                        <button type="submit" class="btn btn-primary">Update Review</button>
                                                        <button type="button" class="btn btn-secondary" 
                                                            onclick="document.getElementById('edit-form-${order.orderId}').style.display='none'">
                                                            Cancel
                                                        </button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                       <c:if test="${not empty order.orderId and (empty reviewedOrderIds or not reviewedOrderIds.contains(order.orderId))}">
                                            <div class="order-rating mt-3">
                                                <form action="review" method="post" class="rating-form d-flex flex-column gap-2">
                                                    <input type="hidden" name="action" value="rate">
                                                    <input type="hidden" name="order_id" value="${order.orderId}">
                                                    <input type="hidden" name="user_id" value="${sessionScope.user.userId}">
                                                    <div class="d-flex align-items-center mb-2 gap-2">
                                                        <h6 class="mb-0 me-2" style="min-width: 120px;">Rate this order:</h6>
                                                        <div class="rating-stars">
                                                            <input type="radio" id="star5-${order.orderId}" name="rating" value="5">
                                                            <label for="star5-${order.orderId}">★</label>
                                                            <input type="radio" id="star4-${order.orderId}" name="rating" value="4">
                                                            <label for="star4-${order.orderId}">★</label>
                                                            <input type="radio" id="star3-${order.orderId}" name="rating" value="3">
                                                            <label for="star3-${order.orderId}">★</label>
                                                            <input type="radio" id="star2-${order.orderId}" name="rating" value="2">
                                                            <label for="star2-${order.orderId}">★</label>
                                                            <input type="radio" id="star1-${order.orderId}" name="rating" value="1">
                                                            <label for="star1-${order.orderId}">★</label>
                                                        </div>
                                                    </div>
                                                    <textarea name="comment" class="form-control mb-2" rows="2" placeholder="Write a review (optional)"></textarea>
                                                    <button type="submit" class="btn btn-rate btn-sm align-self-start">Submit Rating</button>
                                                </form>
                                            </div>
                                        </c:if>
                                    </c:otherwise>
                                </c:choose>
                            </c:if>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:if>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Toast notifications
    document.addEventListener('DOMContentLoaded', function() {
        var toastEl = document.querySelector('.toast');
        if (toastEl) {
            var toast = new bootstrap.Toast(toastEl);
            toast.show();
            setTimeout(function() { toast.hide(); }, 5000);
        }
    });
    // Food animation
    document.addEventListener('DOMContentLoaded', function() {
        const foodIcons = ['🍕', '🍔', '🍟', '🌮', '🍜', '🍣', '🍦', '🍩'];
        function createFoodAnimation() {
            const food = document.createElement('div');
            food.className = 'food-animation';
            food.style.left = Math.random() * window.innerWidth + 'px';
            food.style.bottom = '-50px';
            food.style.fontSize = (Math.random() * 20 + 20) + 'px';
            food.textContent = foodIcons[Math.floor(Math.random() * foodIcons.length)];
            document.body.appendChild(food);
            setTimeout(() => { food.remove(); }, 3000);
        }
        setInterval(createFoodAnimation, 2000);
    });
</script>
</body>
</html>
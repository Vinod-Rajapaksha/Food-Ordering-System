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

    <title>Manage Orders - JUST YUMMY</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Playfair+Display:wght@400;500;600&display=stylesheet">
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

        /* Order Table */
        .order-table {
            background: white;
            border: none;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
        }

        .order-table:hover {
            box-shadow: 0 15px 30px rgba(255, 107, 107, 0.2);
        }

        .table {
            margin-bottom: 0;
        }

        .table thead {
            background: var(--light-color);
        }

        .table th {
            font-weight: 600;
            color: var(--dark-color);
            padding: 1rem;
        }

        .table td {
            vertical-align: middle;
            padding: 1rem;
        }

        .table tr {
            transition: background 0.2s ease;
            animation: fadeIn 0.5s ease forwards;
        }

        .table tr:hover {
            background: rgba(255, 107, 107, 0.05);
        }

        .status-placed { color: #0d6efd; }
        .status-pending { color: #ffc107; }
        .status-delivered { color: #198754; }
        .status-cancelled { color: #dc3545; }

        .order-status-select {
            width: 150px;
            border-radius: 10px;
            border: 1px solid #dee2e6;
            padding: 0.5rem;
            font-size: 0.9rem;
        }

        .order-status-select:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 5px rgba(255, 107, 107, 0.3);
        }

        .btn-update {
            background: var(--gradient);
            border: none;
            border-radius: 10px;
            padding: 0.5rem 1rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            color: white;
            transition: all 0.3s;
        }

        .btn-update:hover {
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

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .table tr:nth-child(1) { animation-delay: 0.1s; }
        .table tr:nth-child(2) { animation-delay: 0.2s; }
        .table tr:nth-child(3) { animation-delay: 0.3s; }
        .table tr:nth-child(4) { animation-delay: 0.4s; }
        .table tr:nth-child(5) { animation-delay: 0.5s; }

        /* Responsive Adjustments */
        @media (max-width: 992px) {
            .order-table {
                overflow-x: auto;
            }
            .order-status-select {
                width: 120px;
            }
        }

        @media (max-width: 576px) {
            .order-status-select {
                width: 100px;
            }
            .btn-update {
                padding: 0.4rem 0.8rem;
                font-size: 0.8rem;
            }
        }
    </style>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light admin-navbar sticky-top">
    <div class="container">
        <a class="navbar-brand brand-text" href="dashboard">
            <i class="fas fa-user-shield me-2"></i>JUST YUMMY Admin
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="dashboard"><i class="fas fa-tachometer-alt me-1"></i>Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="manage-menu"><i class="fas fa-utensils me-1"></i>Menu</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="manage-order"><i class="fas fa-receipt me-1"></i>Orders</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="admin-logout"><i class="fas fa-sign-out-alt me-1"></i>Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container py-5">
    <h2 class="page-title"><i class="fas fa-receipt me-2"></i>Manage Orders</h2>

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

    <c:if test="${empty orders}">
        <div class="alert alert-info">
            <i class="fas fa-info-circle me-2"></i>No orders found.
        </div>
    </c:if>

    <c:if test="${not empty orders}">
        <div class="order-table">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>Order ID</th>
                    <th>User ID</th>
                    <th>Date</th>
                    <th>Total Amount</th>
                    <th>Items</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="order" items="${orders}" varStatus="loop">
                    <tr style="animation-delay: ${loop.index * 0.1}s;">
                        <td>#${order.orderId}</td>
                        <td>${order.userId}</td>
                        <td>${order.orderDate}</td>
                        <td>$<fmt:formatNumber value="${order.totalAmount}" type="number" minFractionDigits="2" /></td>
                        <td>
                            <ul>
                                <c:forEach var="item" items="${order.orderItems}">
                                    <li>${item.menuItem.name} x ${item.quantity}</li>
                                </c:forEach>
                            </ul>
                        </td>
                        <td>
                            <span class="status-${order.status.toLowerCase()}">${order.status}</span>
                        </td>
                        <td>
                            <form action="manage-order" method="post">
                                <input type="hidden" name="action" value="updateStatus">
                                <input type="hidden" name="orderId" value="${order.orderId}">
                                <select name="status" class="form-select order-status-select">
                                    <option value="Placed" ${order.status == 'Placed' ? 'selected' : ''}>Placed</option>
                                    <option value="Pending" ${order.status == 'Pending' ? 'selected' : ''}>Pending</option>
                                    <option value="Delivered" ${order.status == 'Delivered' ? 'selected' : ''}>Delivered</option>
                                    <option value="Cancelled" ${order.status == 'Cancelled' ? 'selected' : ''}>Cancelled</option>
                                </select>
                                <button type="submit" class="btn btn-update btn-sm mt-2">Update</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </c:if>
</div>

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
    });
</script>
</body>
</html>
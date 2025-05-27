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

    <title>Admin Dashboard - JUST YUMMY</title>
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

        /* Stats Cards */
        .stat-card {
            border: none;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            background: white;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.12);
        }

        .stat-card-header {
            background: var(--gradient);
            color: white;
            padding: 1.5rem;
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .stat-card-body {
            padding: 1.5rem;
        }

        .stat-value {
            font-size: 2rem;
            font-weight: 700;
            color: var(--dark-color);
        }

        /* Table Styles */
        .admin-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            background: white;
            border-radius: 15px;
            overflow: hidden;
        }

        .admin-table thead th {
            background-color: #f8f9fa;
            border-bottom: 2px solid #dee2e6;
            padding: 1rem;
            font-weight: 600;
        }

        .admin-table tbody td {
            padding: 1rem;
            vertical-align: middle;
            border-bottom: 1px solid #e9ecef;
        }

        .admin-table tbody tr:last-child td {
            border-bottom: none;
        }

        .admin-table tbody tr:hover {
            background-color: rgba(255, 107, 107, 0.05);
        }

        .status {
            padding: 0.4rem 0.8rem;
            border-radius: 20px;
            font-size: 0.85rem;
            text-transform: capitalize;
        }

        .status.pending {
            background-color: rgba(255, 193, 7, 0.1);
            color: #ffc107;
        }

        .status.completed {
            background-color: rgba(40, 167, 69, 0.1);
            color: #28a745;
        }

        .status.cancelled {
            background-color: rgba(220, 53, 69, 0.1);
            color: #dc3545;
        }

        /* Buttons */
        .btn-admin {
            border-radius: 10px;
            padding: 0.5rem 1rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            transition: all 0.3s;
        }

        .btn-view {
            background-color: rgba(13, 110, 253, 0.1);
            color: #0d6efd;
            border: none;
        }

        .btn-view:hover {
            background-color: rgba(13, 110, 253, 0.2);
            color: #0d6efd;
        }

        .btn-edit {
            background-color: rgba(13, 110, 253, 0.1);
            color: #0d6efd;
            border: none;
        }

        .btn-edit:hover {
            background-color: rgba(13, 110, 253, 0.2);
            color: #0d6efd;
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

        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .stat-card {
                margin-bottom: 1.5rem;
            }

            .admin-table {
                font-size: 0.9rem;
            }

            .btn-admin {
                display: block;
                width: 100%;
                margin: 0.2rem 0;
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
                    <a class="nav-link active" href="dashboard"><i class="fas fa-tachometer-alt me-1"></i>Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="manage-menu"><i class="fas fa-utensils me-1"></i>Menu</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="manage-order"><i class="fas fa-receipt me-1"></i>Orders</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="admin-logout"><i class="fas fa-sign-out-alt me-1"></i>Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container py-5">
    <!-- Page Header -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="mb-0"><i class="fas fa-tachometer-alt me-2"></i>Admin Dashboard</h2>
    </div>

    <!-- Stats Section -->
    <div class="row mb-5">
        <div class="col-md-3">
            <div class="stat-card">
                <div class="stat-card-header">
                    <i class="fas fa-shopping-cart fa-2x"></i>
                    <h3 class="mb-0">Total Orders</h3>
                </div>
                <div class="stat-card-body">
                    <p class="stat-value">${totalOrders}</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="stat-card">
                <div class="stat-card-header">
                    <i class="fas fa-hourglass-half fa-2x"></i>
                    <h3 class="mb-0">Pending Orders</h3>
                </div>
                <div class="stat-card-body">
                    <p class="stat-value">${pendingOrders}</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="stat-card">
                <div class="stat-card-header">
                    <i class="fas fa-dollar-sign fa-2x"></i>
                    <h3 class="mb-0">Total Revenue</h3>
                </div>
                <div class="stat-card-body">
                    <p class="stat-value">$${totalRevenue}</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="stat-card">
                <div class="stat-card-header">
                    <i class="fas fa-users fa-2x"></i>
                    <h3 class="mb-0">Total Users</h3>
                </div>
                <div class="stat-card-body">
                    <p class="stat-value">${totalUsers}</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Dashboard Sections -->
    <div class="row">
        <!-- Recent Orders -->
        <div class="col-lg-6 mb-4">
            <div class="card management-card">
                <div class="card-header">
                    <h5 class="card-title mb-0"><i class="fas fa-receipt me-2"></i>Recent Orders</h5>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="admin-table">
                            <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Customer</th>
                                <th>Date</th>
                                <th>Amount</th>
                                <th>Status</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="order" items="${recentOrders}">
                                <tr>
                                    <td>#${order.orderId}</td>
                                    <td>${order.userId}</td>
                                    <td>
                                        <fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd HH:mm" />
                                    </td>
                                    <td>
                                        $<fmt:formatNumber value="${order.totalAmount}" type="number" minFractionDigits="2" />
                                    </td>
                                    <td>
                                        <span class="status ${order.status.toLowerCase()}">${order.status}</span>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- Popular Items -->
        <div class="col-lg-6 mb-4">
            <div class="card management-card">
                <div class="card-header">
                    <h5 class="card-title mb-0"><i class="fas fa-star me-2"></i>Popular Items</h5>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="admin-table">
                            <thead>
                            <tr>
                                <th>Item</th>
                                <th>Category</th>
                                <th>Price</th>
                                <th>Orders</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${popularItems}">
                                <tr>
                                    <td>${item.name}</td>
                                    <td>${item.category}</td>
                                    <td>$${item.price}</td>
                                    <td>${item.orderCount}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
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
    });
</script>
</body>
</html>
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

    <title>Manage Menu - JUST YUMMY Admin</title>
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

        /* Management Cards */
        .management-card {
            border: none;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            margin-bottom: 2rem;
            transition: transform 0.3s ease;
        }

        .management-card:hover {
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

        /* Table Styles */
        .admin-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
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

        .admin-table img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .admin-table img:hover {
            transform: scale(1.05);
        }

        /* Action Buttons */
        .btn-action {
            padding: 0.5rem 1rem;
            border-radius: 8px;
            font-size: 0.85rem;
            margin: 0.2rem;
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

        .btn-delete {
            background-color: rgba(220, 53, 69, 0.1);
            color: #dc3545;
            border: none;
        }

        .btn-delete:hover {
            background-color: rgba(220, 53, 69, 0.2);
            color: #dc3545;
        }

        /* Modal Styles */
        .modal-content {
            border: none;
            border-radius: 15px;
            overflow: hidden;
        }

        .modal-header {
            background: var(--gradient);
            color: white;
            border-bottom: none;
        }

        .modal-title {
            font-weight: 600;
        }

        .btn-close-white {
            filter: invert(1);
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
            .admin-table img {
                width: 60px;
                height: 60px;
            }

            .btn-action {
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
                    <a class="nav-link" href="dashboard"><i class="fas fa-tachometer-alt me-1"></i>Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="manage-menu"><i class="fas fa-utensils me-1"></i>Menu</a>
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
        <h2 class="mb-0"><i class="fas fa-utensils me-2"></i>Menu Management</h2>
        <div class="d-flex gap-2">
            <button class="btn btn-add" data-bs-toggle="modal" data-bs-target="#addItemModal">
                <i class="fas fa-plus me-2"></i>Add New Item
            </button>
        </div>
    </div>

    <!-- Add New Item Modal -->
    <div class="modal fade" id="addItemModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"><i class="fas fa-plus me-2"></i>Add New Menu Item</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="manage-menu" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="action" value="add">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label for="name" class="form-label">Name</label>
                                <input type="text" id="name" name="name" class="form-control" required>
                            </div>
                            <div class="col-md-6">
                                <label for="category" class="form-label">Category</label>
                                <input type="text" id="category" name="category" class="form-control" required>
                            </div>
                            <div class="col-12">
                                <label for="description" class="form-label">Description</label>
                                <textarea id="description" name="description" class="form-control" rows="3" required></textarea>
                            </div>
                            <div class="col-md-6">
                                <label for="price" class="form-label">Price</label>
                                <div class="input-group">
                                    <span class="input-group-text">$</span>
                                    <input type="number" id="price" name="price" step="0.01" min="0" class="form-control" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label for="imageFile" class="form-label">Image</label>
                                <input type="file" id="imageFile" name="imageFile" accept="image/*" class="form-control" required>
                            </div>
                        </div>
                        <div class="d-flex justify-content-end gap-2 mt-4">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-add">Add Item</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Menu Items Table -->
    <div class="card management-card">
        <div class="card-header">
            <h5 class="card-title mb-0"><i class="fas fa-list me-2"></i>Current Menu Items</h5>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="admin-table">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Category</th>
                        <th>Image</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${menuItems}">
                        <tr>
                            <td>${item.menuId}</td>
                            <td>${item.name}</td>
                            <td>${item.description}</td>
                            <td>$${item.price}</td>
                            <td>${item.category}</td>
                            <td>
                                <img src="${pageContext.request.contextPath}/${item.imageUrl}" alt="${item.name}" class="img-thumbnail">
                            </td>
                            <td>
                                <button class="btn btn-action btn-edit" onclick="editItem('${item.menuId}')">
                                    <i class="fas fa-edit me-1"></i>Edit
                                </button>
                                <form action="manage-menu" method="post" style="display: inline;">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="menuId" value="${item.menuId}">
                                    <button type="submit" class="btn btn-action btn-delete" onclick="return confirm('Are you sure you want to delete this item?')">
                                        <i class="fas fa-trash me-1"></i>Delete
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Edit Item Modal -->
    <div class="modal fade" id="editItemModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"><i class="fas fa-edit me-2"></i>Edit Menu Item</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="manage-menu" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="menuId" id="editMenuId">
                        <input type="hidden" name="currentImage" id="editCurrentImage">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label for="editName" class="form-label">Name</label>
                                <input type="text" id="editName" name="name" class="form-control" required>
                            </div>
                            <div class="col-md-6">
                                <label for="editCategory" class="form-label">Category</label>
                                <input type="text" id="editCategory" name="category" class="form-control" required>
                            </div>
                            <div class="col-12">
                                <label for="editDescription" class="form-label">Description</label>
                                <textarea id="editDescription" name="description" class="form-control" rows="3" required></textarea>
                            </div>
                            <div class="col-md-6">
                                <label for="editPrice" class="form-label">Price</label>
                                <div class="input-group">
                                    <span class="input-group-text">$</span>
                                    <input type="number" id="editPrice" name="price" step="0.01" min="0" class="form-control" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label for="editImageFile" class="form-label">New Image (optional)</label>
                                <input type="file" id="editImageFile" name="imageFile" accept="image/*" class="form-control">
                                <div id="currentImagePreview" class="mt-3">
                                    <p class="small text-muted mb-1">Current Image:</p>
                                    <img id="editImagePreview" src="" style="max-width: 150px; max-height: 150px;" class="img-thumbnail">
                                </div>
                            </div>
                        </div>
                        <div class="d-flex justify-content-end gap-2 mt-4">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-add">Update Item</button>
                        </div>
                    </form>
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

    // Edit item function
    function editItem(menuId) {
        const row = event.target.closest('tr');
        const cells = row.cells;

        // Populate form fields
        document.getElementById('editMenuId').value = menuId;
        document.getElementById('editName').value = cells[1].textContent;
        document.getElementById('editDescription').value = cells[2].textContent;
        document.getElementById('editPrice').value = cells[3].textContent.replace('$', '');
        document.getElementById('editCategory').value = cells[4].textContent;

        // Set current image
        const currentImage = cells[5].querySelector('img').getAttribute('src');
        document.getElementById('editCurrentImage').value = currentImage.replace('${pageContext.request.contextPath}/', '');
        document.getElementById('editImagePreview').setAttribute('src', currentImage);

        // Show modal
        const editModal = new bootstrap.Modal(document.getElementById('editItemModal'));
        editModal.show();
    }
</script>
</body>
</html>
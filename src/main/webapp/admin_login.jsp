<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Food Ordering System">
    <meta name="author" content="Vinod Madhuranga">

    <title>Admin Login - JUST YUMMY</title>
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
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }

        .brand-text {
            font-family: 'Playfair Display', serif;
            font-weight: 600;
        }

        .login-card {
            border: none;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            background: white;
            width: 100%;
            max-width: 400px;
            animation: fadeIn 0.5s ease forwards;
        }

        .login-card .card-body {
            padding: 2rem;
        }

        .login-card h2 {
            font-size: 1.75rem;
            font-weight: 600;
            text-align: center;
            margin-bottom: 1.5rem;
            position: relative;
        }

        .login-card h2:after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 50px;
            height: 4px;
            background: var(--gradient);
            border-radius: 2px;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            font-weight: 500;
            margin-bottom: 0.5rem;
            display: block;
        }

        .form-group input {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #dee2e6;
            border-radius: 10px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }

        .form-group input:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 5px rgba(255, 107, 107, 0.3);
        }

        .btn-login {
            background: var(--gradient);
            border: none;
            border-radius: 10px;
            padding: 0.75rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            color: white;
            width: 100%;
            transition: all 0.3s;
        }

        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 107, 107, 0.3);
        }

        .alert-error {
            background: rgba(220, 53, 69, 0.1);
            border: 1px solid #dc3545;
            border-radius: 10px;
            padding: 0.75rem;
            margin-bottom: 1.5rem;
            color: #dc3545;
            font-size: 0.9rem;
            text-align: center;
        }

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Responsive Adjustments */
        @media (max-width: 576px) {
            .login-card {
                margin: 1rem;
            }
        }
    </style>
</head>
<body>
<div class="card login-card">
    <div class="card-body">
        <h2 class="brand-text"><i class="fas fa-lock me-2"></i>Admin Login</h2>
        <% if (request.getAttribute("error") != null) { %>
        <div class="alert-error">
            <i class="fas fa-exclamation-circle me-2"></i><%= request.getAttribute("error") %>
        </div>
        <% } %>
        <form action="admin-login" method="post">
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit" class="btn-login">Login</button>
        </form>
    </div>
</div>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
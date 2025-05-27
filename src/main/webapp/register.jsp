<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Food Ordering System">
    <meta name="author" content="Vinod Madhuranga">

    <title>Register - JUST YUMMY</title>
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

        .register-container {
            min-height: calc(100vh - 72px);
            display: flex;
            align-items: center;
            padding: 2rem 0;
        }

        .register-card {
            border: none;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
            background: white;
            max-width: 500px;
            margin: 0 auto;
        }

        .register-card:hover {
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

        .input-group-text {
            background-color: transparent;
            border-right: none;
            color: var(--primary-color);
        }

        .btn-register {
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

        .btn-register:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(255, 107, 107, 0.4);
        }

        .login-link {
            color: var(--primary-color);
            font-weight: 500;
            text-decoration: none;
            transition: all 0.3s;
        }

        .login-link:hover {
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

        .invalid-feedback {
            display: none;
            color: var(--primary-color);
            font-size: 0.9rem;
        }

        .is-invalid .invalid-feedback {
            display: block;
        }

        .valid-feedback {
            display: none;
            color: #28a745;
            font-size: 0.9rem;
        }

        .is-valid .valid-feedback {
            display: block;
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

        .password-strength {
            height: 5px;
            background-color: #e9ecef;
            border-radius: 3px;
            margin-top: 5px;
            overflow: hidden;
        }

        .password-strength-bar {
            height: 100%;
            width: 0;
            transition: width 0.3s ease;
        }

        .strength-weak {
            background-color: #dc3545;
        }

        .strength-medium {
            background-color: #ffc107;
        }

        .strength-strong {
            background-color: #28a745;
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
                    <a class="nav-link" href="login.jsp"><i class="fas fa-sign-in-alt me-1"></i>Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="register.jsp"><i class="fas fa-user-plus me-1"></i>Register</a>
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

<!-- Register Container -->
<div class="container register-container animate__animated animate__fadeIn">
    <div class="register-card">
        <div class="card-header">
            <h2 class="card-title"><i class="fas fa-user-plus me-2"></i>Join JUST YUMMY!</h2>
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

            <form action="register" method="post" id="registerForm" novalidate>
                <div class="mb-4">
                    <label for="gender" class="form-label">Title</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-venus-mars"></i></span>
                        <select id="gender" name="gender" class="form-select" required>
                            <option value="">Select Title</option>
                            <option value="Male">Mr</option>
                            <option value="Female">Ms</option>
                        </select>
                    </div>
                    <div class="invalid-feedback">Please select a title</div>
                </div>
                <div class="mb-4">
                    <label for="firstName" class="form-label">First Name</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                        <input type="text" id="firstName" name="firstName" class="form-control" placeholder="Enter your first name" required minlength="2" maxlength="50">
                    </div>
                    <div class="invalid-feedback">Please enter a valid first name (2-50 characters)</div>
                    <div class="valid-feedback">Looks good!</div>
                </div>
                <div class="mb-4">
                    <label for="lastName" class="form-label">Last Name</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                        <input type="text" id="lastName" name="lastName" class="form-control" placeholder="Enter your last name" required minlength="2" maxlength="50">
                    </div>
                    <div class="invalid-feedback">Please enter a valid last name (2-50 characters)</div>
                    <div class="valid-feedback">Looks good!</div>
                </div>
                <div class="mb-4">
                    <label for="phoneNumber" class="form-label">Phone Number</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-phone"></i></span>
                        <input type="tel" id="phoneNumber" name="phoneNumber" class="form-control" placeholder="Enter your phone number" pattern="[0-9]{10}" required>
                    </div>
                    <div class="invalid-feedback">Please enter a valid 10-digit phone number</div>
                    <div class="valid-feedback">Looks good!</div>
                </div>
                <div class="mb-4">
                    <label for="email" class="form-label">Email Address</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                        <input type="email" id="email" name="email" class="form-control" placeholder="Enter your email" required>
                    </div>
                    <div class="invalid-feedback">Please enter a valid email address</div>
                    <div class="valid-feedback">Looks good!</div>
                </div>
                <div class="mb-4">
                    <label for="address" class="form-label">Address</label>
                    <textarea id="address" name="address" class="form-control" placeholder="Enter your address" required minlength="10" maxlength="200"></textarea>
                    <div class="invalid-feedback">Please enter a valid address (10-200 characters)</div>
                    <div class="valid-feedback">Looks good!</div>
                </div>
                <div class="mb-4">
                    <label for="password" class="form-label">Password</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-lock"></i></span>
                        <input type="password" id="password" name="password" class="form-control" placeholder="Enter your password" required minlength="8" maxlength="30">
                    </div>
                    <div class="password-strength">
                        <div class="password-strength-bar" id="passwordStrengthBar"></div>
                    </div>
                    <div class="invalid-feedback">Password must be 8-30 characters and contain at least one uppercase, one lowercase, one number and one special character</div>
                    <div class="valid-feedback">Strong password!</div>
                    <small class="form-text text-muted">Use 8-30 characters with a mix of letters, numbers & symbols</small>
                </div>
                <div class="mb-4">
                    <label for="confirmPassword" class="form-label">Confirm Password</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-lock"></i></span>
                        <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" placeholder="Confirm your password" required>
                    </div>
                    <div class="invalid-feedback">Passwords do not match</div>
                    <div class="valid-feedback">Passwords match!</div>
                </div>
                <button type="submit" class="btn btn-register btn-primary w-100 mb-3">
                    <i class="fas fa-user-plus me-2"></i>Register
                </button>
            </form>

            <p class="text-center mt-4">
                Already have an account? <a href="login.jsp" class="login-link">Login here</a>
            </p>
        </div>
    </div>
</div>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Custom JS -->
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const form = document.getElementById('registerForm');
        const password = document.getElementById('password');
        const confirmPassword = document.getElementById('confirmPassword');
        const passwordStrengthBar = document.getElementById('passwordStrengthBar');
        const phoneNumber = document.getElementById('phoneNumber');
        
        // Password strength indicator
        password.addEventListener('input', function() {
            const strength = checkPasswordStrength(password.value);
            updatePasswordStrengthIndicator(strength);
            validatePassword();
        });
        
        // Confirm password validation
        confirmPassword.addEventListener('input', function() {
            validateConfirmPassword();
        });
        
        // Phone number validation (only allow numbers)
        phoneNumber.addEventListener('input', function() {
            this.value = this.value.replace(/[^0-9]/g, '');
        });
        
        // Form submission validation
        form.addEventListener('submit', function(event) {
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
            
            validateAllFields();
            
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
            
            form.classList.add('was-validated');
        });
        
        // Validate all fields on blur
        const inputs = form.querySelectorAll('input, select, textarea');
        inputs.forEach(input => {
            input.addEventListener('blur', function() {
                validateField(this);
            });
        });
        
        function validateAllFields() {
            validateField(document.getElementById('gender'));
            validateField(document.getElementById('firstName'));
            validateField(document.getElementById('lastName'));
            validateField(document.getElementById('phoneNumber'));
            validateField(document.getElementById('email'));
            validateField(document.getElementById('address'));
            validatePassword();
            validateConfirmPassword();
        }
        
        function validateField(field) {
            if (field.id === 'password') {
                validatePassword();
            } else if (field.id === 'confirmPassword') {
                validateConfirmPassword();
            } else {
                if (field.checkValidity()) {
                    field.classList.remove('is-invalid');
                    field.classList.add('is-valid');
                } else {
                    field.classList.remove('is-valid');
                    field.classList.add('is-invalid');
                }
            }
        }
        
        function validatePassword() {
            const strength = checkPasswordStrength(password.value);
            const isValid = strength.score >= 2 && password.value.length >= 8;
            
            if (isValid) {
                password.classList.remove('is-invalid');
                password.classList.add('is-valid');
            } else {
                password.classList.remove('is-valid');
                password.classList.add('is-invalid');
            }
            
            return isValid;
        }
        
        function validateConfirmPassword() {
            const isValid = confirmPassword.value === password.value && password.value !== '';
            
            if (isValid) {
                confirmPassword.classList.remove('is-invalid');
                confirmPassword.classList.add('is-valid');
            } else {
                confirmPassword.classList.remove('is-valid');
                confirmPassword.classList.add('is-invalid');
            }
            
            return isValid;
        }
        
        function checkPasswordStrength(password) {
            let score = 0;
            
            // Length check
            if (password.length >= 8) score++;
            if (password.length >= 12) score++;
            
            // Character diversity
            if (/[A-Z]/.test(password)) score++; // Uppercase letter
            if (/[a-z]/.test(password)) score++; // Lowercase letter
            if (/[0-9]/.test(password)) score++; // Number
            if (/[^A-Za-z0-9]/.test(password)) score++; // Special character
            
            // Deduct points for common patterns
            if (password.length < 8) score = 0;
            if (password === 'password' || password === '12345678') score = 0;
            
            return {
                score: Math.min(score, 4),
                maxScore: 4
            };
        }
        
        function updatePasswordStrengthIndicator(strength) {
            const percentage = (strength.score / strength.maxScore) * 100;
            passwordStrengthBar.style.width = percentage + '%';
            
            // Update color based on strength
            passwordStrengthBar.className = 'password-strength-bar';
            
            if (strength.score <= 1) {
                passwordStrengthBar.classList.add('strength-weak');
            } else if (strength.score <= 2) {
                passwordStrengthBar.classList.add('strength-medium');
            } else {
                passwordStrengthBar.classList.add('strength-strong');
            }
        }
        
        // Add animation class when elements are in viewport
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
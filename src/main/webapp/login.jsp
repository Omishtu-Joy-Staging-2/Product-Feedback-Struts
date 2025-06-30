<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="Product Feedback Collector Login" />
    <meta name="author" content="" />

    <title>Feedback Portal | Login</title>

    <!-- Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3f37c9;
            --accent-color: #4895ef;
            --light-color: #f8f9fa;
            --dark-color: #212529;
            --success-color: #4cc9f0;
            --error-color: #f72585;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            margin: 0;
        }
        
        .login-container {
            width: 90%;
            max-width: 1000px;
        }
        
        .login-card {
            border-radius: 20px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            transition: all 0.3s ease;
            border: none;
            display: flex;
            min-height: 600px; /* Set a fixed height for the card */
        }
        
        .login-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.25);
        }
        
        .login-image {
            background: linear-gradient(rgba(67, 97, 238, 0.7), rgba(63, 55, 201, 0.7)), 
                        url('https://images.unsplash.com/photo-1551288049-bebda4e38f71?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80');
            background-size: cover;
            background-position: center;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: white;
            padding: 2rem;
            position: relative;
            flex: 1;
        }
        
        .login-image::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(135deg, rgba(67, 97, 238, 0.8) 0%, rgba(63, 55, 201, 0.8) 100%);
            z-index: 0;
        }
        
        .login-image-content {
            position: relative;
            z-index: 1;
            text-align: center;
            padding: 2rem;
        }
        
        .login-image h2 {
            font-weight: 700;
            margin-bottom: 1rem;
            font-size: 2rem;
        }
        
        .login-image p {
            font-weight: 300;
            opacity: 0.9;
        }
        
        .login-form {
            padding: 3rem;
            background-color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            flex: 1;
        }
        
        .login-header {
            text-align: center;
            margin-bottom: 2rem;
        }
        
        .login-header h1 {
            font-weight: 700;
            color: var(--dark-color);
            margin-bottom: 0.5rem;
            font-size: 2rem;
        }
        
        .login-header p {
            color: #6c757d;
            font-weight: 400;
        }
        
        .form-control-user {
            border-radius: 50px;
            padding: 15px 20px;
            border: 2px solid #e9ecef;
            transition: all 0.3s ease;
            font-size: 0.9rem;
            width: 100%;
        }
        
        .form-control-user:focus {
            border-color: var(--accent-color);
            box-shadow: 0 0 0 0.2rem rgba(72, 149, 239, 0.25);
        }
        
        .btn-user {
            border-radius: 50px;
            padding: 12px;
            font-weight: 600;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            font-size: 0.9rem;
            transition: all 0.3s ease;
            background-color: var(--primary-color);
            border: none;
            width: 100%;
            color: white;
        }
        
        .btn-user:hover {
            background-color: var(--secondary-color);
            transform: translateY(-2px);
            color: white;
        }
        
        .login-footer {
            text-align: center;
            margin-top: 1.5rem;
            color: #6c757d;
            font-size: 0.9rem;
        }
        
        .login-footer a {
            color: var(--primary-color);
            font-weight: 500;
            text-decoration: none;
            transition: all 0.3s ease;
        }
        
        .login-footer a:hover {
            color: var(--secondary-color);
            text-decoration: underline;
        }
        
        .login-error {
            border-radius: 10px;
            padding: 1rem;
            margin-bottom: 1.5rem;
            background-color: rgba(247, 37, 133, 0.1);
            border-left: 4px solid var(--error-color);
            color: var(--error-color);
            font-size: 0.9rem;
            animation: fadeIn 0.5s ease;
        }
        
        .floating-label {
            position: relative;
            margin-bottom: 1.5rem;
        }
        
        .floating-label label {
            position: absolute;
            top: -10px;
            left: 20px;
            background-color: white;
            padding: 0 5px;
            font-size: 0.8rem;
            color: var(--accent-color);
            font-weight: 500;
            z-index: 1;
        }
        
        .remember-me {
            display: flex;
            align-items: center;
            margin-bottom: 1.5rem;
        }
        
        .remember-me input {
            margin-right: 8px;
        }
        
        .social-login {
            display: flex;
            justify-content: center;
            margin: 1.5rem 0;
        }
        
        .social-btn {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 5px;
            color: white;
            transition: all 0.3s ease;
        }
        
        .social-btn:hover {
            transform: translateY(-3px);
        }
        
        .social-btn.google {
            background-color: #db4437;
        }
        
        .social-btn.facebook {
            background-color: #4267b2;
        }
        
        .social-btn.twitter {
            background-color: #1da1f2;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        /* Particles animation */
        .particles {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
        }
        
        .particle {
            position: absolute;
            background-color: rgba(255, 255, 255, 0.5);
            border-radius: 50%;
            animation: float 15s infinite linear;
        }
        
        @keyframes float {
            0% { transform: translateY(0) rotate(0deg); opacity: 1; }
            100% { transform: translateY(-1000px) rotate(720deg); opacity: 0; }
        }
        
        /* Responsive adjustments */
        @media (max-width: 768px) {
            .login-card {
                flex-direction: column;
                min-height: auto;
            }
            
            .login-image {
                padding: 2rem 1rem;
                min-height: 250px;
            }
            
            .login-form {
                padding: 2rem;
            }
        }
    </style>
</head>
<body>
    <!-- Animated Background Particles -->
    <div class="particles" id="particles"></div>
    
    <div class="login-container">
        <div class="card login-card">
            <!-- Left Side - Visual -->
            <div class="login-image">
                <div class="login-image-content">
                    <h2>Product Feedback Collector</h2>
                    <p>Share your experience and help us improve our products</p>
                    <div class="mt-4">
                        <i class="fas fa-comments fa-4x mb-3"></i>
                        <p>Your feedback matters! Join thousands of users shaping better products.</p>
                    </div>
                </div>
            </div>
            
            <!-- Right Side - Form -->
            <div class="login-form">
                <div class="login-header">
                    <h1>Welcome Back</h1>
                    <p>Sign in to access your feedback dashboard</p>
                </div>
                
                <!-- Error Messages -->
                <s:actionerror cssClass="login-error animate__animated animate__fadeIn"/>
                
                <!-- Login Form -->
                <s:form action="login" method="post" theme="simple">
                    <div class="form-group floating-label">
                        <label for="email">Email Address</label>
                        <s:textfield name="email" cssClass="form-control form-control-user" id="email" placeholder=" " required="true"/>
                    </div>
                    
                    <div class="form-group floating-label">
                        <label for="password">Password</label>
                        <s:password name="password" cssClass="form-control form-control-user" id="password" placeholder=" " required="true"/>
                    </div>
                    
                    <s:submit cssClass="btn btn-user btn-block" value="Login"/>
                </s:form>
                
                <div class="login-footer">
                    Don't have an account? <a href="registration.jsp">Create one</a>
                </div>
            </div>
        </div>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Create animated particles
        function createParticles() {
            const particlesContainer = document.getElementById('particles');
            const particleCount = 20;
            
            for (let i = 0; i < particleCount; i++) {
                const particle = document.createElement('div');
                particle.classList.add('particle');
                
                // Random properties
                const size = Math.random() * 10 + 5;
                const posX = Math.random() * 100;
                const delay = Math.random() * 15;
                const duration = Math.random() * 10 + 10;
                
                particle.style.width = `${size}px`;
                particle.style.height = `${size}px`;
                particle.style.left = `${posX}%`;
                particle.style.bottom = `-${size}px`;
                particle.style.animationDelay = `${delay}s`;
                particle.style.animationDuration = `${duration}s`;
                
                particlesContainer.appendChild(particle);
            }
        }
        
        // Input focus effects
        $(document).ready(function() {
            createParticles();
            
            $('.form-control-user').focus(function() {
                $(this).parent().find('label').css('color', '#4361ee');
            }).blur(function() {
                $(this).parent().find('label').css('color', '#4895ef');
            });
            
            // Form submission animation
            $('form').submit(function(e) {
                $('.btn-user').html('<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Authenticating...');
                $('.btn-user').prop('disabled', true);
            });
        });
    </script>
</body>
</html>
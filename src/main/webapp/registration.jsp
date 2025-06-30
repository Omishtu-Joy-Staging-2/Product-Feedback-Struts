<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="Product Feedback Collector Registration" />
    <title>Feedback Portal | Register</title>

    <!-- Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3f37c9;
            --accent-color: #4895ef;
            --light-color: #f8f9fa;
            --dark-color: #212529;
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
        
        .register-container {
            width: 90%;
            max-width: 1000px;
        }
        
        .register-card {
            display: flex;
            border-radius: 20px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            min-height: 600px;
        }
        
        .register-image {
            flex: 1;
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
        }
        
        .register-image::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(135deg, rgba(67, 97, 238, 0.8) 0%, rgba(63, 55, 201, 0.8) 100%);
            z-index: 0;
        }
        
        .register-image-content {
            position: relative;
            z-index: 1;
            text-align: center;
            padding: 2rem;
        }
        
        .register-image h2 {
            font-weight: 700;
            margin-bottom: 1rem;
            font-size: 2rem;
        }
        
        .register-image p {
            font-weight: 300;
            opacity: 0.9;
        }
        
        .register-form {
            flex: 1;
            padding: 3rem;
            background-color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        
        .register-header {
            text-align: center;
            margin-bottom: 2rem;
        }
        
        .register-header h1 {
            font-weight: 700;
            color: var(--dark-color);
            margin-bottom: 0.5rem;
            font-size: 2rem;
        }
        
        .register-header p {
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
        }
        
        .register-footer {
            text-align: center;
            margin-top: 1.5rem;
            color: #6c757d;
            font-size: 0.9rem;
        }
        
        .register-footer a {
            color: var(--primary-color);
            font-weight: 500;
            text-decoration: none;
        }
        
        .register-error {
            border-radius: 10px;
            padding: 1rem;
            margin-bottom: 1.5rem;
            background-color: rgba(247, 37, 133, 0.1);
            border-left: 4px solid var(--error-color);
            color: var(--error-color);
            font-size: 0.9rem;
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
        }
        
        @media (max-width: 768px) {
            .register-card {
                flex-direction: column;
                min-height: auto;
            }
            
            .register-image {
                min-height: 250px;
                padding: 1rem;
            }
            
            .register-form {
                padding: 2rem;
            }
        }
    </style>
</head>
<body>
    <div class="register-container">
        <div class="register-card">
            <!-- Left Side - Image -->
            <div class="register-image">
                <div class="register-image-content">
                    <h2>Join Our Community</h2>
                    <p>Become part of our feedback network</p>
                    <div class="mt-4">
                        <i class="fas fa-user-plus fa-4x mb-3"></i>
                        <p>Your opinion helps us improve!</p>
                    </div>
                </div>
            </div>
            
            <!-- Right Side - Form -->
            <div class="register-form">
                <div class="register-header">
                    <h1>Create Account</h1>
                    <p>Fill in your details to get started</p>
                </div>
                
                <s:actionerror cssClass="register-error"/>
                
                <s:form action="register" method="post" theme="simple">
                    <div class="form-row">
                        <div class="form-group col-md-6 floating-label">
                            <label for="firstName">First Name</label>
                            <s:textfield name="firstName" cssClass="form-control form-control-user" id="firstName" placeholder=" " required="true"/>
                        </div>
                        <div class="form-group col-md-6 floating-label">
                            <label for="lastName">Last Name</label>
                            <s:textfield name="lastName" cssClass="form-control form-control-user" id="lastName" placeholder=" " required="true"/>
                        </div>
                    </div>
                    
                    <div class="form-group floating-label">
                        <label for="email">Email Address</label>
                        <s:textfield name="email" cssClass="form-control form-control-user" id="email" placeholder=" " type="email" required="true"/>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group col-md-6 floating-label">
                            <label for="password">Password</label>
                            <s:password name="password" cssClass="form-control form-control-user" id="password" placeholder=" " required="true"/>
                        </div>
                        <div class="form-group col-md-6 floating-label">
                            <label for="confirmPassword">Confirm Password</label>
                            <s:password name="confirmPassword" cssClass="form-control form-control-user" id="confirmPassword" placeholder=" " required="true"/>
                        </div>
                    </div>
                    
                    <s:submit cssClass="btn btn-user btn-block" value="Register Account"/>
                </s:form>
                
                <div class="register-footer">
                    Already have an account? <a href="login.jsp">Login here</a>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            $('.form-control-user').focus(function() {
                $(this).parent().find('label').css('color', '#4361ee');
            }).blur(function() {
                $(this).parent().find('label').css('color', '#4895ef');
            });
            
            $('form').submit(function(e) {
                $('.btn-user').html('<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Registering...');
                $('.btn-user').prop('disabled', true);
            });
        });
    </script>
</body>
</html>
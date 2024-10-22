<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - Create Account</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 350px;
        }
        h1 {
            font-size: 22px;
            margin-bottom: 30px;
            font-weight: normal;
            color: #333;
        }
        .form-group {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            margin-bottom: 20px;
            text-align: left;
        }
        label {
            font-size: 14px;
            margin-bottom: 8px;
            color: #555;
        }
        input[type="text"], input[type="password"], input[type="number"], input[type="email"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
        }
        input[type="radio"] {
            margin-right: 10px;
        }
        input[type="submit"] {
            background-color: #f58220;
            color: white;
            padding: 12px;
            width: 100%;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #e76e00;
        }
        .footer {
            margin-top: 20px;
            font-size: 12px;
            color: #777;
        }
        .footer a {
            color: #4285f4;
            text-decoration: none;
        }
        .footer a:hover {
            text-decoration: underline;
        }
        .error {
            color: red;
            font-size: 14px;
            margin-top: 10px;
        }
    </style>
    <script>
        function validateForm() {
        	// 이코드 무슨 코드 인지 확인하기 
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirm_password").value;
	
            if (password !== confirmPassword) {
                document.getElementById("error-message").innerText = "Password does not match. Please try again.";
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Sign Up</h1>
        <form action="insertPro.jsp" method="POST" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="id">ID</label>
                <input type="text" id="id" name="id" value="<%=request.getParameter("id") != null ? request.getParameter("id") : ""%>" required autofocus="autofocus"> 
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="pass" required>
            </div>
            <div class="form-group">
                <label for="confirm_password">Confirm Password</label>
                <input type="password" id="confirm_password" name="confirm_pass" required>
            </div>
            <div class="error" id="error-message"></div>
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" value="<%=request.getParameter("name") != null ? request.getParameter("name") : ""%>" required>
            </div>
            <div class="form-group">
                <label for="age">Age</label>
                <input type="number" id="age" name="age" value="<%=request.getParameter("age") != null ? request.getParameter("age") : ""%>" required>
            </div>
            <div class="form-group">
                <label>Gender</label>
                <label><input type="radio" name="gender" value="male" <% if ("male".equals(request.getParameter("gender"))) { %>checked<% } %> required>Male</label>
                <label><input type="radio" name="gender" value="female" <% if ("female".equals(request.getParameter("gender"))) { %>checked<% } %>>Female</label>
            </div>
            <div class="form-group">
                <label for="email">E-mail</label>
                <input type="email" id="email" name="email" value="<%=request.getParameter("email") != null ? request.getParameter("email") : ""%>" required>
            </div>
            <input type="submit" value="Create Account">
        </form>
        <script>
        window.onload = function() {
            var idInput = document.getElementById('id');
            var emailInput = document.getElementById('email');
            
            // Focus on the ID input field if it has no value (when redirected due to existing ID)
            if (!idInput.value) {
                idInput.focus();
            } else if (!emailInput.value) {
                // Focus on the email input field if it has no value (when redirected due to existing email)
                emailInput.focus();
            }
        };
        </script>
        <div class="footer">
            <p>Already have an account? <a href="loginForm.jsp">Sign in</a></p>
        </div>
    </div>
</body>
</html>
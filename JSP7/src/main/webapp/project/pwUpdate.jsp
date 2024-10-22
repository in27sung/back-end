<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign in - Enter Password</title>
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
        input[type="password"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
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
    </style>
</head>
<body>
	<% 
	String id = (String)session.getAttribute("id");
	String pw = (String)session.getAttribute("pass");
	
	if(id == null){
		// Expired session
		response.sendRedirect("loginForm");
	}
	// password session이 남아 있다면 바로 updateFrom으로 이동 
	if(pw != null){
		response.sendRedirect("updateForm.jsp");
	}
	%>

	
    <div class="container">
        <h1>Edit <%=id%>'s information</h1>
        <form action="pwUpdatePro.jsp" method="POST">
            <input type="hidden" name="username" value="<%=id%>">
            <div class="form-group">
                <label for="password">Enter your password</label>
                <input type="password" id="pass" name="pass" required autofocus placeholder="Enter your password">
            </div>
            <input type="submit" value="Next">
        </form>
    </div>
</body>
</html>
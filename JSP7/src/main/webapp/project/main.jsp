<%@page import="com.itwillbs.bean.MemberDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main Page</title>
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
        .btn {
            background-color: #f58220;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #e76e00;
        }
    </style>
</head>
<body>
	<div class="container">
		<h1>Welcome to the Main Page</h1>
        <h5>Session: <%=session.getAttribute("id") %></h5>
		<%
            String loggedIn = (String)session.getAttribute("id");
            if (loggedIn != null) {
        %>
            <a href="logout.jsp" class="btn">Logout</a>
        <%
            } else {
        %>
            <a href="loginForm.jsp" class="btn">Sign in</a>
        <%
            }
        %>
    </div>
</body>
</html>
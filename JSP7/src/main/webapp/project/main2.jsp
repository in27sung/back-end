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
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .header {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            top: 0;
            position: fixed;
        }
        .header-right {
            display: flex;
            justify-content: flex-end;
        }
        .btn {
            background-color: #f58220;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease;
            margin-left: 10px;
        }
        .btn:hover {
            background-color: #e76e00;
        }
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
            width: 100%;
            padding-top: 60px; /* Adjusted for fixed header */
            flex-direction: column;
        }
        .box {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 100%;
            max-width: 700px; /* Maximum width for large screens */
        }
        .btn-center {
            margin-top: 20px;
        }
        h1 {
            font-size: 22px;
            margin-bottom: 30px;
            font-weight: normal;
            color: #333;
        }
        h5 {
            font-size: 14px;
            color: #555;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <!-- Header section with Sign In/Logout button -->
    <div class="header">
        <div class="">
            <%	
                String loggedIn = (String)session.getAttribute("id");
            	System.out.print(loggedIn + "\n");
                if (loggedIn != null) {
            %>
                <a href="logout.jsp" class="btn">Sign out</a>
            <%
                } else {
            %>
                <a href="loginForm.jsp" class="btn">Sign In</a>
            <%
                }
            %>
        </div>
    </div>

    <!-- Main content -->
    <div class="container">
        <div class="box">
            <h1>Welcome to the Main Page</h1>
            <h5>Session: <%=session.getAttribute("id") %></h5>

            <!-- Personal Info button in the center -->
            <%
                if (loggedIn != null) {
            %>
                <a href="pwUpdate.jsp" class="btn btn-center">Edit Personal Info</a>
            <%
                }
            %>
        </div>
    </div>
</body>
</html>
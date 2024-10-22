<%@page import="com.itwillbs.bean.MemberBean"%>
<%@page import="com.itwillbs.bean.MemberDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Information</title>
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
    </style>
</head>
<body>
	<%
	String id = (String)session.getAttribute("id");
	
	System.out.println("session: " + id);
	
	if (id == null){
		System.out.println("로그인 정보 없음");
		response.sendRedirect("loginForm.jsp");
	}
	// Create DB instance 
	MemberDB memberDB = new MemberDB();
	
	MemberBean memberB = memberDB.getMember(id);
	%>
    <div class="container">
    <h1>Edit Information</h1>
    <form action="updatePro.jsp" method="POST">
        <div class="form-group">
            <label for="id">ID</label>
            <!-- ID is readonly to prevent changes -->
            <input type="text" id="id" name="id" value="<%=id%>" disabled="disabled">
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <!-- Password is editable and required -->
            <input type="password" id="password" name="password" value="" required placeholder="New password"/>
        </div>
        <div class="form-group">
            <label for="password"></label>
            <!-- Password is editable and required -->
            <input type="password" id="password" name="password" value="" required placeholder="Confirm new password"/>
        </div>
        <div class="form-group">
            <label for="name">Name</label>
            <!-- Name is editable -->
            <input type="text" id="name" name="name" value="<%=memberB.getName() %>" required>
        </div>
        <div class="form-group">
            <label for="age">Age</label>
            <!-- Age is readonly to prevent changes -->
            <input type="number" id="age" name="age" value="<%=memberB.getAge() %>" disabled="disabled">
        </div>
       <%--  <div class="form-group"> 
            <label>Gender</label> 
            <!-- Gender is disabled to prevent changes -->
            <label><input type="radio" name="gender" value="male" <%= memberB.getGender().equals("male") ? "checked" : "" %> disabled>Male</label>
            <label><input type="radio" name="gender" value="female" <%= memberB.getGender().equals("female") ? "checked" : "" %> disabled>Female</label>
        </div> --%>
        <div class="form-group">
            <label for="email">E-mail</label>
            <!-- Email is readonly to prevent changes -->
            <input type="email" id="email" name="email" value="<%=memberB.getEmail() %>" disabled="disabled">
        </div>
        <input type="submit" value="Update Information">
        <p><a href="main2.jsp">Back to Profile</a></p> <!-- 추후 수정 -->
    </form>
    <div class="footer">
        
    </div>
</div>
</body>
</html>
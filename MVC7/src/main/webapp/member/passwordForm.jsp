<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="member/loginStyle.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
		<c:if test="${empty sessionScope.id}">
			<c:redirect url="./MemberLogin.me" />
		</c:if>
		<h1>Welcome, ${dto.id}</h1>
		<form action="./MemberLoginAction.me" method="post">
		<input type="hidden" name="id" value="${dto.id}">
			<div class="form-group">
				<label for="password">Enter your password</label> 
				<input type="password" id="pass" name="pass" required autofocus>
			</div>
			<input type="submit" value="Sign in">
		</form>
		<div class="footer">
			<p>
				<a href="./MemberLogin.me">Use another account</a>
			</p>
		</div>
	</div>
</body>
</html>
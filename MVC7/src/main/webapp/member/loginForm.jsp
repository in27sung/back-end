<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-with, initial-scale=1.0">
<title>Sign in</title>
<link href="member/loginStyle.css" rel="stylesheet" type="text/css">
</head>
<body>

	<div class="container">
		<h1>Sign in</h1>
		<form action="./MemberPassword.me" method="post">
			<div class="form-group">
				<label for="username">User name</label> 
				<input type="text" id="username" name="id" autocomplete="off" required autofocus>
<!-- 					Password: <input type="password" name="pass"> -->
			</div>
			<input type="submit" value="Continue">
		</form>
		<div class="footer">
			<p>
				New to my page? <a href="./MemberJoin.me">Create account</a>
			</p>
		</div>
	</div>
</body>
</html>
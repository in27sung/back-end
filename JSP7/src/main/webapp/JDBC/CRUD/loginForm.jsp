<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>loginForm.jsp</h1>
	
	<fieldset>
		<legend>Sign in</legend>
		
		<form action="loginPro.jsp" method="post">
			ID: <input type="text" name="id"> <br>
			Password: <input type="password" name="password"> <br>
			<hr>
			<input type="submit" value="Sign in">
			<input type="button" value="Sign up" onclick="location.href='insertForm.jsp'">
		</form>
	</fieldset>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionLogin.jsp</h1>
	
	<fieldset>
		<legend>로그인</legend>
		<form action="sessionLoginPro.jsp" method="post">
		ID:
		<input type="text" name="id"> <br>
		PW: <input type="password" name="pw"><br>
		<input type="submit" value="Login">
		</form>
	</fieldset>
</body>
</html>
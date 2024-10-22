<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>deleteForm.jsp</h1>
	
	<h2>회원탈퇴</h2>
	<form action="deletePro.jsp" method="post">
		Password: <input type="password" name="pass">
		<input type="submit" value="delete account">
	</form>
</body>
</html>
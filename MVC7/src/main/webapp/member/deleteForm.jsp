<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/deleteForm.jsp</title>
</head>
<body>
	
	<h2>회원탈퇴</h2>
	<fieldset>
	<legend>회원 탈퇴</legend>
	<form action="./MemberDeleteAction.me" method="post">
		Password: <input type="password" name="pass">
		<input type="submit" value="delete account">
	</form>
	</fieldset>
</body>
</html>
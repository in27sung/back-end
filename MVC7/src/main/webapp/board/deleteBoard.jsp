<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/deleteBoard.jsp</title>
</head>
<body>
	<h2>게시판 글 삭제</h2>
	<fieldset>
	<legend>비밀번호 확인</legend>
	<form action="./BoardDeleteAction.bo?pageNum=${param.pageNum}" method="post">
		<input type="hidden" name="bno" value="${param.bno}">
		ID: <input type="text" name="id" value="${sessionScope.id}" disabled>
		Password: <input type="password" name="pass">
		<input type="submit" value="delete">
	</form>
	</fieldset>
</body>
</html>
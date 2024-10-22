<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/list.jsp</title>
<link href="board/boardList.css" rel="stylesheet">
</head>
<body>
<div id="container">
<header>
	<h1>회원정보 목록</h1>
</header>
	
<%-- 	${memberList} --%>
	<nav>
		<input type="button" onclick="location.href='./Main.me';" value="Main page">
	</nav>
	<hr>
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>나이</td>
			<td>성별</td>
			<td>이메일</td>
			<td>회원가입일</td>
		</tr>
		
		<c:forEach var="dto" items="${memberList}">
		<tr>
			<td>${dto.id}</td>
			<td>${dto.pass}</td>
			<td>${dto.name}</td>
			<td>${dto.age}</td>
			<td>${dto.gender}</td>
			<td>${dto.email}</td>
			<td>${dto.regdate}</td>
		</tr>
		</c:forEach>
	</table>
	
	</div>
</body>
</html>
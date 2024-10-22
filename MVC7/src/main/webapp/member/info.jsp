<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>/member/info.jsp(MVC)</h1>

	${dto}
	<hr>
	
	
	<h3>아이디: ${dto.id}</h3>
	<h3>비밀번호: ${dto.pass}</h3>
	<h3>이름: ${dto.name}</h3>
	<h3>나이: ${dto.age}</h3>
	<h3>성별: ${dto.gender}</h3>
	<h3>이메일: ${dto.email}</h3>
	<h3>가입일: ${dto.regdate}</h3>
	
	
	<h3><a href="./Main.me">메인 페이지</a></h3>
</body>
</html>
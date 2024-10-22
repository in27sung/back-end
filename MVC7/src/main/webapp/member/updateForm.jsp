<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>/member/insertUpdate.jsp</h1>

	<h2>회원수정(MVC)</h2>

	<fieldset>
		<legend>ITwill-Edit Information</legend>

		<form action="./MemberUpdatePro.me" method="post">
			ID <br> <input type="text" name="id" value="${dto.id}" readonly>
			<br> <label for="password">Password<br></label> <input
				type="password" id="password" name="pass" value="" required placeholder="password"> <br> 
				<!-- <input type="password" name="passC" value="" required placeholder="Confirm new password"> <br> --> 
			Name<br> <input type="text" name="name"
				value="${dto.name}" readonly> <br> Age<br> <input
				type="number" name="age" value="${dto.age}"> <br>
			Gender<br> <input type="radio" name="gender" value="male"
				<c:if test="${dto.gender.equals('male')}">
			checked
			</c:if>>Male
			<input type="radio" name="gender" value="female"
				<c:if test="${dto.gender.equals('female')}">
					checked
					</c:if>>Female
			<br> E-mail<br> <input type="email" name="email"
				value="${dto.email}" readonly>
			<hr>

			<input type="submit" value="정보 수정">
		</form>
	</fieldset>
</body>
</html>
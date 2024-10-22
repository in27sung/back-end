<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>paramForm.jsp</h1>
	
	<fieldset>
		<form action="paramPro.jsp" method="post">
			이름: <input type="text" name="name">
			<hr>
			좋아하는 음식1: <input type="text" name="food"> <br>
			좋아하는 음식2: <input type="text" name="food"> <br>
			<hr>
			<input type="checkbox" name="hobbies" value="게임"> 게임
			<input type="checkbox" name="hobbies" value="요리"> 요리
			<input type="checkbox" name="hobbies" value="운동"> 운동
			<input type="submit" value="submit parameter">
		</form>
	</fieldset>
</body>
</html>
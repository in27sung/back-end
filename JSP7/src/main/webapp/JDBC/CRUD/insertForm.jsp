<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>insertForm.jsp</h1>
	
	<h2> sign up </h2>
	
	<fieldset>
		<legend>ITwill-sign up</legend>
		
		<form action="insertPro.jsp" method="post">
			ID: <input type="text" name="id"> <br>
			Password: <input type="password" name="password"> <br>
			Name: <input type="text" name="name"> <br>
			Age: <input type="number" name="age"> <br>
			Gender: <input type="radio" name="gender" value="male">Male
					<input type="radio" name="gender" value="female">Female <br>
			E-mail: <input type="email" name="email">
			<hr>
		
			<input type="submit" value="회원가입">
		</form>
	</fieldset>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>javaBeanForm2.jsp</h1>
	
	<h2>JavaBean test</h2>
	
	<fieldset>
		<form action="javaBeanPro2.jsp" method="post">
			ID: <input type="text" name="id"> <br>
			Password: <input type="password" name="password"> <br>
			Birth: <input type="text" name="birth"> <br>
			
			<input type="submit" value="정보 전송">
			
		</form>
	</fieldset>
</body>
</html>
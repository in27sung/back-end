<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<h1>testForm2.jsp</h1>
	<!-- 이름, 나이 입력받아서 testPro2.jsp 페이지로 전달후 출력 -->
	<!-- 폼태그는 기본적으로 get방식으로 전송함 (생략시) -->
	<fieldset>
		<form action = "testPro2.jsp" method = "post">
		이름: <input type = "text" name = "name"> <br>
		나이: <input type = "number" name = "age"> <br> 
		
			<input type = "submit" value = "전송"> <!-- 전송버튼 -->
		</form>
	</fieldset>
</body>
</html>
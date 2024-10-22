<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function check(){
		if(document.forms[0].number.value == ""){
			alert(" Type the number ");
			document.forms[0].number.focus();
			return false;
		}
		
	}
</script>
</head>
<body>
	<h1>testForm1.jsp</h1>
	
	<fieldset>
		<form action = "testPro1.jsp" method = "get" onsubmit = " return check()">
			<!--좋아하는 숫자: <input type="text" name="number"> <br>-->			
				좋아하는 숫자: <input type="number" name="number"> <br>	 <!-- 숫자만 입력받  -->		
			<input type = "submit" value = "숫자 전달(submit)">
		
		</form>	
	</fieldset>
</body>
</html>
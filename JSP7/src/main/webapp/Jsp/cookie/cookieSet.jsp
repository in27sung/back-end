<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>cookieSet.jsp</h1>
	
	<h2> Server </h2>
	
	<%
		System.out.println("요청 정보를 처리중");
	
		//Create Cookie value(servlet API 사용)
		//Cookie cookie = new Cookie("name", "Cookie Value");
		Cookie cookie = new Cookie("cookieName", "cookieValue");
		
		// Cookie value 유효기간 setting
		cookie.setMaxAge(600); //600 seconds = 19 minutes 
		
		// Cookie정보를 클라이언트에게 전달 
		response.addCookie(cookie);
		
		System.out.println("요청 정보를 처리완료");
	%>
	<script type="text/javascript">
		alert("쿠키값 생성");
		location.href="cookieTest.jsp"
	
	</script>
</body>
</html>
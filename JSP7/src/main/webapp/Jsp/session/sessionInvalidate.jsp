<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionInvalidate.jsp</h1>
	
	<h2>Server</h2>
	
	<%
		System.out.println("요청된 정보를 처리중");
	
		//세션의 정보를 초기화(All)
		session.invalidate();
		
		System.out.println("요청된 정보를 처리완료");
	%>
	
	<script type="text/javascript">
		alert("session정보 초기화");
		location.href="sessionForm.jsp"
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>logout.jsp</h1>

	<h2> 서버 </h2>
	
	<%
	//세션의 정보를 초기화(ALL)
		session.invalidate();
		System.out.println("Session reset - Sign out");
	%>
	<!-- 페이지 이동 -->
	<script type="text/javascript">
		alert("Complete sign out");
		location.href="main.jsp";
		
		
	</script>
</body>
</html>
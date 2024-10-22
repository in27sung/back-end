<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionDelete.jsp</h1>
	
	<h2> Server </h2>
	
	<%
		System.out.println("요청된 정보를 받아서 처리");
		
		//기존에 생성된 세션정보를 제거
		session.removeAttribute("name");
		
		System.out.println("요청된 정보를 받아서 처리완료");
	%>
	
	<script type="text/javascript">
		alert("세션정보 삭제");
		location.href="sessionForm.jsp"
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 style="color:blue">sessionMain.jsp</h1>
	<!-- 로그인한 사요자만 이용가능 (OOO님 환영합니다 메시지 출력),
	로그인 없이 페이지 실행하는 경우 로그인 페이지로 이동 -->
	<h2> 메인페이지 </h2>
	<%
		String id = (String)session.getAttribute("id"); //영역객체는 object type!!
		
		if(id == null){ //로그인x
			System.out.println("로그인 정보x -> 로그인 페이지로 이동");
			response.sendRedirect("sessionLogin.jsp");
		}
	%>
	
	<h3><%=id %>님 환영합니다!</h3>
	
	<script type="text/javascript">
		alert("<%=id %>님 환영합니다!");
	</script>
	
	<input type="button" value="Logout" onclick="location.href='sessionLogout.jsp'">
</body>
</html>
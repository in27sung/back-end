<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>cookieProcess.jsp</h1>
	
	<%
		//폼태그에서 전달된 정보(parameter)를 저장
		String language = request.getParameter("language");
	%>
	language: <%=language %> <br>
	
	<%
		//전달받은 언어정보를 쿠키에 저장
		//쿠키객체 생성
		Cookie cookie = new Cookie("language", language);
	
		// 쿠키 사용 유효기간 설정 
		cookie.setMaxAge(3600); // 1hour
		
		// 쿠키정보를 클라이언트에게 전달
		response.addCookie(cookie);
	%>
	<script type="text/javascript">
		alert("언어정보 쿠키 생성 완료");
		location.href="cookieForm.jsp";
	</script>
	
	
</body>
</html>
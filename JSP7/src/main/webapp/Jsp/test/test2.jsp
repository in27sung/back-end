<%@page import="javax.naming.ldap.StartTlsRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test2.jsp</h1>
	
	<h2> JSP 내장객체javax.servlet 패키지 8개, java.lang 패키지 1개 (p177~)</h2>
	<!--JSP 페이지가 실행 (JSP 파일) -> java 파일 (서블릿))할 때 자동으로 객체 생-->
	
	<!--Qusestion: 퍼센트 와 퍼센트= 의 차이-->
	
	<hr>
		<h1> javax.servlet 패키지 (8)개 </h1>
		
		<h2>request 객체: 클라이언트의 HTTP프로토콜 요청을 지정한 곳(서버)로 보내는 객체</h2>
		서버도메인 : <%=request.getServerName() %> <br>
		URL: <%=request.getRequestURL() %> <br>
		URI: <%=request.getRequestURI() %> <br>
		클라이언트 IP: <%=request.getRemoteAddr() %> <br>
		서버의 물리적경로: <%=request.getRealPath("/") %> <br>
		http해더 (user-agent): <%=request.getHeader("user-agent") %> <br>
 		
 		<h2> response 객체: HTTP요청에 대한 응답정보를 저장하는 객체 </h2>
		<%
			//response.setContentType(" application/pdf ");
			//response.sendRedirect("test1.jsp");
			//response.sendRedirect("http://www.naver.com");
			//response.addHeader("Refresh", "3; url=test1.jsp"); //3초에 한번 새로고
		%>
		
		<h2> session 객체: 클라이언트의 세션정보를 저장하는 객체 </h2>
		세션ID: <%=session.getId() %> <br>
		세션생성 시간: <%=session.getCreationTime() %> <br>
		세션최종 접속시간: <%=session.getLastAccessedTime() %> <br>
		세션 유지시간(설정): <%=session.getMaxInactiveInterval() %> <br> <!-- 1800초(30분)-->
	
		<h2> pageContext 객체: 페이지를 실행할때 필요한 컨텍스트(프로젝트) 정보를 저장하는 객체 </h2>
		<h2> out 객체: 응답 페이지 전송을 위한 출력 스트림 객체</h2>
		<h2> application object: Save the information that the context(project) of application</h2>
		<h2> config object: Save the servlet setting information of current page </h2> 
		<h2> page object: 해당 페이지를 나타내는 객체 (서블릿 객체) </h2> 
		
	<hr>
		<h1> java.lang 패키지 (1개) </h1>
		
		<h2> exception object: 예외처리 위한 객체 </h2> <!-- 일반적이지 않은 상황 -->
		

</body>
</html>
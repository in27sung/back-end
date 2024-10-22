<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionForm.jsp</h1>
	<!-- 디도스: 끊임없이 사용자 요청을 하고 방화벽 해체상태일때 침투 -->
	
	<h2> HTTP(Hypertext Transfer Protocol)을 사용해서 통신진행 => 상태유지가 불가능</h2>
	
	<h2> Session: 클라이언트와 서버간의 접속을 유지시켜주는 역할</h2>
	
	<h3> 세션이 유지되는 동안(웹브라우저당 1개의 세션생성) </h3>
	
	<h1> 클라이언트 (고객)</h1>
	<!-- 세션값이 있을때는 해당정보를 출력, 없을때는 '세션값 없음' 출력 -->
	
	<%
		String name = (String)session.getAttribute("name");
		// Type mismatch: cannot conver from Object to String
		
		if(name == null){
			name="세션값 없음";
		}
	%>
	
	<%-- <h2>세션값: <%=session.getAttribute("name") %></h2> --%>
	<h2> 세션값 이름: <%=name %></h2>
	<h2> 세션값 번호: <%=session.getAttribute("tel") %></h2>
	
	<input type="button" value="세션값 생성(저장)"
		onclick="location.href='sessionProcess.jsp'">
		
	<input type="button" value="세션값 삭제"
		onclick="location.href='sessionDelete.jsp'">
		
	<input type="button" value="세션값 초기화"
		onclick="location.href='sessionInvalidate.jsp'">
</body>
</html>
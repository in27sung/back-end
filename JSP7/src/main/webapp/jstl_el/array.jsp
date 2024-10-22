<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>/jstl_el/array.jsp</h1>
	
	<h2> request 영역에 저장된 정보를 출력</h2>
	
	입력문: <%=request.getAttribute("sports") %> <br>
	<%
		String[] sports = (String[])request.getAttribute("sports");
	%>
	스포츠: <%=sports[0] %> <br>
	스포츠: <%=sports[1] %> <br>
	스포츠: <%=sports[2] %> <br>
	스포츠: <%=sports[3] %> <br>
	스포츠: <%=sports[4] %> <br>
	<!-- 비정상적인 종료 --> 
<%-- 	스포츠: <%=sports[5] %> <br> --%>
	
	<hr>
	<h2> EL 표현식은 JSP 반복문 사용불가</h2>
	<%
		for(int i = 0; i < sports.length;i++){
		pageContext.setAttribute("i", i);
	%>
			${sports[i]} <br>		
	<%
		}
	%>
	<hr>
	
	EL문: ${requestScope.sports} <br>
	
	스포츠: ${requestScope.sports[0]} <br>
	스포츠: ${sports[1]} <br>
	스포츠: ${requestScope.sports[2]} <br>
	스포츠: ${sports[3]} <br>
	스포츠: ${requestScope.sports[4]} <br>
	<h2> EL 표현식 데이터가 없을 때(null) 에러(예외)를 발생하지 않고 공백문자("")를 출력</h2>
	스포츠: ${sports[5]} <br>
	
	<hr>
	
	<h2> Array 배열에서 저장된 정보 출력</h2>
	
	<%=request.getAttribute("movieList")%> <br>
	
	<%
		ArrayList movieList = (ArrayList)request.getAttribute("movieList");
	%>
	
	영화: <%=movieList.get(0) %> <br>	
	영화: <%=movieList.get(1) %> <br>	
	영화: <%=movieList.get(2) %> <br>	
	영화: <%=movieList.get(3) %> <br>	
	영화: <%=movieList.get(4) %> <br>	
	
	<hr>
	
	${movieList[0]} <br>
	${movieList[1]} <br>
	${movieList[2]} <br>
	${movieList[3]} <br>
	${movieList[4]} <br>
	
</body>
</html>
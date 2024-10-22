<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>/jstl_el/core_foreach.jsp</h1>
	
	<h2> jsp-for 사용해서 "안녕하세요!" 10번 출력</h2>
	
	<%
	ArrayList list = new ArrayList();
	
	
	
		for(int i = 0; i < 10; i++){
		list.add(i);
	%>
		안녕하세요!<br>
		
	<%
		}
		session.setAttribute("list", list);
	%>	
	<hr>
	
	<h2> JSTL-foreach 반복문 사용</h2>
	
	<c:forEach begin="1" end="10" step="1">
		<c:out value="안녕하세요"/> <br>
	</c:forEach>
	
	<hr>

	1~10까지 숫자를 가로 출력
	<c:forEach var="i" begin="1" end="10" step="1">
		<c:out value="${i}"/>
	</c:forEach>
	
	<hr>
	session 영역에 저장된 배열의 값을 모두 출력 <br>
	<c:forEach var="i" begin="0" end="9" step="1">
		${sessionScope.list[i]}
	</c:forEach>
	
<%-- 	<c:forEach var="배열/리스트에서 꺼낸 데이터를 저장하는 변수" --%>
<%-- 			 items="배열/리스트명"> --%>
<%-- 	</c:forEach> --%>
	<hr>
	
	<c:forEach var="num" items="${sessionScope.list}">
		${num}
	</c:forEach>
	
	<hr>
	<%
		for(Object num:list){
			out.println(num);
		}
		
	%>
	

</body>
</html>
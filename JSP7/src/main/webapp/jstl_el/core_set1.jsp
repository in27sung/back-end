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
	<h1>core_set1.jsp</h1>
	
	<%
	// JSP(자바코드)로 변수를 선언
	// -> 단점: core_set1.jsp 페이지에서만 실행 가능한 정보
	int num1 = 10;
	int num2 = 20;
	int sum = num1 + num2;
	%>
	
	sum: <%="10 + 20 = " + sum %> <br>
	
	<h2> jstl을 사용해서 변수 선언 </h2>
<%-- 	<c:set var="변수명" value="변수 값"/> --%>
	<c:set var="num3" value="10" scope="page"/>	<!-- pageContext.setAttribute("num3",10); -->
	<c:set var="num4" value="20"/>
	<c:set var="sum2" value="${num3 + num4}"/>
	
	<c:out value="sum2"/> (x) <br>
	<c:out value="${sum2}"/> (o) <hr>
	
	<hr>
	
	<h2>request 영역에 데이터를 저장 (JSTL-c:set)</h2>
	<!--scope: 기본값 page, request, session, application -->
	<c:set var="name" value="컴퓨터" scope="request"/>
	<!-- request.setAttribute("name", "컴퓨터"); -->
	
	<!-- 가격정보 price 값 10000 정보 저장 (request 영역) -->
	<c:set var="price" value="10000" scope="request"/>
	<!-- 가격정보 price 값 20000 정보 저장 (session 영역) -->
	<c:set var="price" value="20000" scope="session"/>
	
	<!-- 페이지 이동 -->
	<jsp:forward page="core_set2.jsp"/>
	
	
	
</body>
</html>
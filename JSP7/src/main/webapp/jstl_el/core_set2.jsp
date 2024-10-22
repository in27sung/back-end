<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- core library 추가 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>/jstl_el/core_set2.jsp</h1>
	
	<h2>core_set1.jsp에서 전달해준 정보를 저장</h2>
	
	name: ${requestScope.name } <br>
	
	name(request): <c:out value="${name}"/> <br>
	
	price(request): ${requestScope.price} <br>
	price(session): ${sessionScope.price} <br>
	price: ${price}<br>
	
	<h2> request 영역에 저장된 price 정보를 제거(JSTL)</h2>
	
	<c:remove var="price" scope="request"/>
	<!-- request.removeAttribute(); -->
	price: ${price} (세션영역의 값 출력) <br>
	<c:remove var="price"/>
	<!-- 영역의 범위가 없다면 모든 대상을 찾아서 삭제 -->
	price: ${price} <br>
	
	<hr>
	<h2> TestServlet4(/test4)이 전달해준 정보를 출력</h2>
	
	<!-- 전달받은 정보 출력 -->
	
	ID: ${memberBean.id} <br>
	Password: ${memberBean.pass} <br>
	Name: ${memberBean.name} <br>
	
	<hr>
	
	<c:set var="mb" value="${requestScope.memberBean}"/>
	ID: ${mb.id} <br>
	Password: ${mb.pass} <br>
	Name: ${mb.name} <br>
	
	<hr>
	
	<c:set var="memberList" value="${requestScope.memberList}"/>
	
	${memberList} <br>
	
	ID: ${memberList[0].id} <br>
	Password: ${memberList[0].pass}<br>
	Name: ${memberList[0].name}<br>
	
	<c:set var="mb" value="${requestScope.memberList[0]}"/>
	아이디: ${mb.id} <br>
	
	<c:set var="list" value="${requestScope.memberList}"/>
	아이디: ${list[0].id} <br>
	
	
	
</body>
</html>
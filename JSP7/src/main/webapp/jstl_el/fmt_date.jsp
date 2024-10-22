<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>/jstl_el/fmt_date.jsp</h1>
	
	<%=new Date() %> <br>
	<c:set var="today" value="<%=new Date() %>"/>
	${today} <br>
	
	<h3> 기본날짜 형태 </h3>
	<fmt:formatDate value="${today}"/>
	<fmt:formatDate value="${today}" type="date"/> <br>
	
	<h3> 시간정보 형태</h3>
	<fmt:formatDate value="${today}" type="time"/> <br>
	
	<fmt:formatDate value="${today}" type="both"/> <br>
	<hr>
	
	<h3> 날짜 형태 변경</h3>
	<fmt:formatDate value="${today}" type="date" dateStyle="full"/> <br>
	<fmt:formatDate value="${today}" type="date" dateStyle="long"/> <br>
	<fmt:formatDate value="${today}" type="date" dateStyle="medium"/> <br>
	<fmt:formatDate value="${today}" type="date" dateStyle="short"/> <br>
	
	<hr>
	<h3> 시간 형태 변경</h3>
	<fmt:formatDate value="${today}" type="time" timeStyle="full"/> <br>
	<fmt:formatDate value="${today}" type="time" timeStyle="long"/> <br>
	<fmt:formatDate value="${today}" type="time" timeStyle="medium"/> <br>
	<fmt:formatDate value="${today}" type="time" timeStyle="short"/> <br>
	
	
	<fmt:formatDate value="${today}" type="date" pattern="yyyy/MM/dd(E)"/> <br>
	<fmt:formatDate value="${today}" type="time" pattern="(a) hh:mm:ss"/> <br>
	

	
	
</body>
</html>
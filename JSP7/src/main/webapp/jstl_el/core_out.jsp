<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl-core 사용하기위해 정보 추가 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>/jstl_el/core_out.jsp</h1>
	
	<h2> JSTL - core 라이브러리 사용</h2>
	
	<%-- <jsp: (액션태그) JSP제공기능 --%>
	
	<%
		out.println("출력1");
	%>
	
	<%="출력2" %>
	${"출력3"}
	<c:out value="출력4"/> <hr>
	
	<h2> 2 * 3의 결과를 출력 </h2>
	
	<%
		out.println("2 x 3 = " + 2 * 3);
	%>
	<br>
	<%="2 x 3 = " + 2 * 3%> <br>
	${"2 x 3 = " }${2 * 3} <br>
	<c:out value="2 x 3 = ${2 * 3}"/> <br>
	<c:out value="2 x 3 ="/> 
	<c:out value="<%=2 * 3%>"/>
	<hr>
	
	<h3> JSTL은 문자, 연산결과(el표현식, jsp표현식 사용) 출력가능</h3>
	
	member.name: ${member.name}<hr>
	member.name: <c:out value="${member.name}"/> (공백문자로 출력)<hr>
	member.name: <c:out value="${member.name}" default="Null값을 대신해서 출력"/> <hr>
	<!-- value 정보를 출력할때 공백문자를 포함하지 않도록 주의 -->
	member.name: <c:out value=" ${member.name}" default="Null값을 대신해서 출력"/> <hr>
	
	<hr>
	
	<abc>는 abc 입니다. (태그 출력x) <br>
	
	&lt;abc&gt;는 abc 입니다.<br>
	
	<c:out value="<abc>는 abc 입니다."/>
	
	
	
	
	
	
	
	
	
</body>
</html>
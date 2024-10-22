<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>/jstl_el/core_if.jsp</h1>
	
	
	<c:set var="i" value="itwillbs"/>
	
<%-- 	<c:if test="조건식"></c:if> --%>
	<c:if test="${i == 'itwill' }">
		<h2>변수 i값은 itwill 입니다.</h2>
	</c:if>
	
	<hr>
	
	<fieldset>
		<legend> 폼태그에 action 정보가 없으면 자신의 페이지를 호출</legend>
		<form action="">
			숫자 1: <input type="number" name="num1"> <br> 
			숫자 2: <input type="number" name="num2"> <br>
			
			<input type="submit" value="전송"> 
		</form>
	</fieldset>
	
	<hr>
	전달한 숫자1, 숫자2 중에 더 큰수를 찾아서 출력 <br>
	

	<!-- el표현식에서 숫자를 비교x, 문자데이터의 크기로 비교 -->
	<c:if test="${!empty param.num1 && !empty param.num2}">
	
	<c:if test="${Integer.parseInt(param.num1) > Integer.parseInt(param.num2)}">
		둘 중에 큰수: 숫자1(${param.num1}) <hr>
	</c:if>
	
	<c:if test="${Integer.parseInt(param.num1) < Integer.parseInt(param.num2)}">
		둘 중에 큰수: 숫자2(${param.num2}) <hr>
	</c:if>
	
	<c:if test="${Integer.parseInt(param.num1) == Integer.parseInt(param.num2)}">
		숫자1(${param.num1})과 숫자2(${param.num2})는 같다 <hr>
	</c:if>
	
	
	<hr>
	<h2> switch - case 동작을 c:choose로 구형</h2>
<%-- 	<c:choose> --%>
<%-- 		<c:when test=""></c:when> --%>
<%-- 		<c:when test=""></c:when> --%>
<%-- 		<c:when test=""></c:when> --%>
<%-- 		<c:otherwise></c:otherwise> --%>
<%-- 	</c:choose> --%>
	
	<!-- 전달받은 숫자(num1, num2)를 비교해서 값을 출력 -->
	
	<c:choose>
		<c:when test="${Integer.parseInt(param.num1) > Integer.parseInt(param.num2) }"> <br>
			${param.num1}이 더 큽니다.
		</c:when>
		<c:when test="${Integer.parseInt(param.num1) < Integer.parseInt(param.num2) }"> <br>
			${param.num2}이 더 큽니다.
		</c:when>
		<c:otherwise>
			${param.num1},${param.num2}은 같다<br>
		</c:otherwise>
	</c:choose>
	</c:if>
	
</body>
</html>
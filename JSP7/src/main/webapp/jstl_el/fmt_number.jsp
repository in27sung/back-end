<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>/jstl_el/fmt_number.jsp</h1>
	
	<h2>숫자 데이터를 특정 형태로 출력 하도록 하는 라이브러리</h2>
	
	숫자데이터를 출력 <hr>
	
	100000000 <hr>
	<h3>groupingUsed 속성을 사용해서 숫자의 세자리마다 콤마로 구분</h3>
	<fmt:formatNumber value="100000000"/> <br>
	<fmt:formatNumber value="100000000" groupingUsed="true"/> <br>
	<fmt:formatNumber value="100000000" groupingUsed="false"/> <br>
	
	<h3>3.141589 소수점 데이터를 자리수 2자리까지만 표시</h3>
	<h3> pattern 속성을 사용해서 자리수를 #으로 표시</h3>
	<fmt:formatNumber value="3.141589" pattern="#.##"/>
	
	<h3>10.5 소수점 데이터를 소수점 2자리까지 표현</h3>
	<fmt:formatNumber value="10.50" pattern="##.00"/>(숫자가 없는 자릿수에 0으로 채움) <br>
	<fmt:formatNumber value="10.50" pattern="##.55"/> <br>
	<fmt:formatNumber value="10.50" pattern="##.99"/> <br>
	
	<h3>데이터 수치를 %로 표시</h3>
	<fmt:formatNumber value="0.5" type="percent"/> <br>
	<fmt:formatNumber value="${13/17}" type="percent"/> <br>
	<fmt:formatNumber value="100000000" type="currency" currencySymbol="$"/> <br>
</body>
</html>
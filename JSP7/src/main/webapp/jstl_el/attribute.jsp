<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>attribute.jsp</h1>
	<%
		int variable = 100;
		pageContext.setAttribute("variable", variable);
// 		request.setAttribute(100, cnt);
// 		session.setAttribute(100, cnt)
// 		application.setAttribute(100, cnt)
	%>
	<h2>자바코드로 작성된 정보를 출력</h2>
	변수 cnt(JSP): <%=variable%> <br>
	변수 cnt(EL): ${variable} (변수 출력x) -> 속성(attribute)<br>
	
	<h2>자바코드로 작성된 영역에 저장된 정보를 출력</h2>
	속성 cnt(JSP): <%=request.getAttribute("cnt")%> <br>
	속성 cnt(EL): ${requestScope.cntr}<br>
	
	<h2> 각각의 영역에 저장된 세션 정보를 출력</h2>
	세션 cnt(JSP): <%=session.getAttribute("cnt") %> <br>
	세션 cnt(EL): ${sessionScope.cnt} <br>
	
	<!-- 생략시 rqeust 생성 -->
	속성 cnt(EL): ${cnt} <br> 
	
	<h3> el표현식으로 속성정보를 출력할 때 영역객체 정보를 생략가능</h3>
	<h4> el표현식으로 속성정보를 출력할 때 별도의 set/get 메서드 사용x</h4>
	
	- pageScope
	- requestScope
	- sessionScope
	- applicationScope
	-> el 표현식에 영역객체 정보가 없을 때(생략 시) 영역객체의 좁은범위부터 순서대로 찾는다
	-> 데이터를 사용하게되면 더이상 영역객체 접근x
	
</body>
</html>
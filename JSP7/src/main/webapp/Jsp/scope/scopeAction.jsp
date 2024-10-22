<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>scopeAction.jsp</h1>
	
	<h2>Parameter information</h2>
	<%
		String id = request.getParameter("id");
	%>
	<h3> ID(variable): <%=id %></h3>
	<h3> ID(direct): <%=request.getParameter("id")%></h3>
	<h3> PW: <%=request.getParameter("pw") %></h3>
	
	<h2>영역객체 정보</h2>
	
	pageContext implicitObject(내장객체) value: <%=pageContext.getAttribute("p") %> <br>
	request implicitObject value: <%=request.getAttribute("r") %> <br>
	session implicitObject value: <%=session.getAttribute("s") %> <br>
	application implicitObject value: <%=application.getAttribute("a") %> <br>
</body>
</html>
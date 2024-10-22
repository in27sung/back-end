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
	<h1>paramPro.jsp</h1>
	
	<h2>사용자가 전달한 정보 출력</h2>
	<%
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");	
	String food = request.getParameter("food");	
	String[] hobbies = request.getParameterValues("hobbies");

	%>
	이름(JSP):  <%=name%> <br>
	
	이름(JSP): <%=request.getParameter("name") %> <br>
	좋아하는 음식1(JSP): <%=request.getParameterValues("food")[0] %> <br>
	좋아하는 음식2(JSP): <%=request.getParameterValues("food")[1] %> <br>
	<%
	if(hobbies != null){ 
	for(int i = 0; i < hobbies.length; i++){
	%>
	취미(JSP): <%=hobbies[i]%> <br>
	<%
		}
	}
	else{
	%>
		<%= "취미없음" %> <br>
	<%
	}
	%>
	<hr>
	이름(EL): ${param.name} <br>
	좋아하는 음식1(EL): ${paramValues.food[0]} <br>
	좋아하는 음식2(EL): ${paramValues.food[1]} <br>
	
	
	<h2>jsp 코드 for문 사용 불가, JSTL-forEach문 사용가능</h2>
<%-- 	취미: ${paramValues.hobbies[0]} <br> --%>
<%-- 	취미: ${paramValues.hobbies[1]} <br> --%>
<%-- 	취미: ${paramValues.hobbies[2]} <br> --%>
	
	JSTL-forEach문 <br>
	
	<c:forEach var="hob" items="${paramValues.hobbies}">
	 	취미: ${hob} <br>
	</c:forEach>
	<hr>
</body>
</html>
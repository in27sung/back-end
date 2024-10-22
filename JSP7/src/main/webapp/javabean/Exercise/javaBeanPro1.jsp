<%@page import="com.itwillbs.bean.JavaBean1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>javaBeanPro1.jsp</h1>
	
	<%
	// korean encoding 
	request.setCharacterEncoding("UTF-8");
		
	String id = request.getParameter("id");
		
	%>
	전달정보(Parameter): <%=id %> <br>
	
	<hr>
	<h2>자바빈 객체 생성</h2>
	
	<%
	// 자바빈 객체 생성
	JavaBean1 jb1 = new JavaBean1();
	
	// 자바빈 객체에 전달받은 id정보를 저장 
	//jb1.setId(request.getParameter("id"));
	jb1.setId(id);
	
	//자바빈 객체에 저장된 정보id를 출력 
	out.println("ID(JavaBean): " + jb1.getId());

	
	%>
	<br>
	ID(JavaBean): <%=jb1.getId()%>
	
	<hr>
	<h2> 자바빈 객체 생성(액션태그)</h2>
	
<%-- 	<jsp:useBean id="객체명(reference)" class="객체의 이름" /> --%>
	JavaBean1 jb1_1 = new JavaBean1();<hr>
	<jsp:useBean id="jb1_1" class="com.itwillbs.bean.JavaBean1" />

	jb1_1.setID("id");<hr>
<%-- <jsp:setProperty property="속성명" name="객체명(레퍼런스)", param/> --%>
	 <jsp:setProperty property="id" name="jb1_1" param="id"/> <!-- property="member variable" -->	
	 
	 jb1_1.getId(); <hr>
<%-- <jsp:getProperty property="속성명" name="객체명(레퍼런스)" /%> --%>
	ID(Action tag): <jsp:getProperty property="id" name="jb1_1"/>













</html>
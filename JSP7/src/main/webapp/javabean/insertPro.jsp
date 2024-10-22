<%@page import="com.itwillbs.bean.MemberDB"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>javBean/insertPro.jsp</h1>
	
	<%
	// 한글 인코딩
	request.setCharacterEncoding("UTF-8");
	// 회원가입 처리 
	
	//1) insertForm.jsp에서 입력된 사용자의 정보를 받아서 저장 
	// Javabean(MemberBean) 객체저장
	%>
	<!-- Instance 생성 -->
	MemberBean memberB = new MemberBean(); <br>
	<jsp:useBean id="memberB" class="com.itwillbs.bean.MemberBean"/>
	
	<!-- 객체안에 정보(parameter) 저장 -->
	<jsp:setProperty property="*" name="memberB"/>
	
	<!-- memberB에 날짜 정보를 저장 -->
	<%
		memberB.setRegdate(new Timestamp(System.currentTimeMillis()));
	%>
	
	<!-- 객체 출력 -->
	<%=memberB.toString() %> <br>
	<%=memberB %> <br>
	
<%-- 	ID: <jsp:getProperty property="id" name="memberB"/> <br>
	Password: <jsp:getProperty property="password" name="memberB"/> <br>
	Name: <jsp:getProperty property="name" name="memberB"/> <br>
	Age: <jsp:getProperty property="age" name="memberB"/> <br>
	Gender: <jsp:getProperty property="gender" name="memberB"/> <br>
	Email: <jsp:getProperty property="email" name="memberB"/> <br>	 --%>
	<%
	//2) 전달받은 정보를 mysql(DB)에 저장

	// MemberDB객체 생성
	MemberDB memberDB = new MemberDB();
	
	memberDB.insertMember(memberB);
	
	System.out.println("Complete careate account(JavaBean)");
	
	// Login Page 이동 
	response.sendRedirect("loginForm.jsp");
	%>
	
	
	
	
	
</body>
</html>
<%@page import="com.itwillbs.bean.MemberBean"%>
<%@page import="com.itwillbs.bean.MemberDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>info.jsp</h1>
	
	<h2>My Account</h2>
	
	<!-- 로그인한 사용자의 정보를 화면에 출력 -->
	
	<%
	// 로그인 여부 체크
	String id = (String)session.getAttribute("id");
	
	if (id == null){
		System.out.println("로그인 정보 없음");
		response.sendRedirect("loginForm.jsp");
	}
	// 사용자의 모든 정보를 DB에서 가져오기 
	
	MemberDB memberDB = new MemberDB(); 
	
	MemberBean memberB = memberDB.getMember(id);
	
	%>
	
	ID: <%=memberB.getId()%> <br>
	Password: <%=memberB.getPass() %> <br>
	Name: <%=memberB.getName() %> <br>
	Age: <%=memberB.getAge() %> <br>
	Gender: <%=memberB.getGender() %> <br>
	Email: <%=memberB.getEmail() %> <br>
	Date: <%=memberB.getRegdate() %> <br>

	
	<h2><a href="main.jsp">메인페이지로 이동</a></h2>
</body>
</html>
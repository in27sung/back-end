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
	
	final String DRIVER = "com.mysql.cj.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "Dlstjd1915";
	
	// Load driver
	Class.forName(DRIVER);
	
	// Connect database
	Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
	System.out.println("Connection: " + con);
	
	// SQL 구문 & pstmt 객체 
	String sql = "select * from itwill_member where id=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, id);
	
	// SQL 실행
	ResultSet rs = pstmt.executeQuery();
	
	// 데이터 처리
	if(rs.next()){
		// 사용자가 필요한 정보를 화면에 모두 출력
		id = rs.getString(1);
		String password = rs.getString(2);
		String name = rs.getString("name");
		int age = rs.getInt(4);
		String gender = rs.getString("gender");
		String email = rs.getString(6);
		
		out.println("ID: " + rs.getString("id") + "<br>");
		out.println("ID: " + id + "<br>");
		%>
		Password: <%=password%> <br>
		Name: <%=name%> <br>
		Age: <%=age%> <br>
		Gender: <%=gender%> <br>
		Email: <%=email%> <br>
		<%

	}
	%>
	
	<h2><a href="main.jsp">메인페이지로 이동</a></h2>
</body>
</html>
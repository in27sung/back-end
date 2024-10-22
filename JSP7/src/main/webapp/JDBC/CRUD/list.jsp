<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.apache.catalina.connector.Response"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 style="color:red">list.jsp</h1>
	
	<h2>관리자 메뉴 - 회원목록 정보</h2>
	
	<%
		String id = (String)session.getAttribute("id");
	
		// Check Login + admin 
		if(id == null || !id.equals("admin")){
			response.sendRedirect("loginForm.jsp");
		}
		
		// print out account information from DB
		
		// DB conneted information 
		final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "Dlstjd1915";
		// Load Driver
		Class.forName(DRIVER);
		System.out.println("Success Driver load");
		// Connection DB
		Connection con = DriverManager.getConnection(DBURL,DBID,DBPW);
		System.out.println("Success DB connect");
		System.out.println("connection: " + con);
		// SQL statement & pstmt 객체
		//String sql = "select * from itwill_member";
		String sql = "select * from itwill_member where id != 'admin'";
		PreparedStatement pstmt = con.prepareStatement(sql);
		// Excute SQL
		ResultSet rs = pstmt.executeQuery();
		// data anylases 
		
		
	%>
	
	<table border="1">
		<tr>
			<td>ID</td>
			<td>PW</td>
			<td>Name</td>
			<td>Age</td>
			<td>Gender</td>
			<td>Email</td>
			<td>Start date</td>
		</tr>
		<%while(rs.next()){
			//if(!rs.getString("id").equals("admin")){ //or continue;
			%>
		<tr>
			<td><%=rs.getString("id") %></td>
			<td><%=rs.getString("pass") %></td>
			<td><%=rs.getString("name")%></td>
			<td><%=rs.getInt("age")%></td>
			<td><%=rs.getString("gender")%></td>
			<td><%=rs.getString("email")%></td>
			<td><%=rs.getTimestamp("regdate")%></td>			
		</tr>	
		<%
			//}
		}
		%>
	</table>
</body>
</html>
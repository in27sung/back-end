<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>dbConnect.jsp</h1>
	
	<h2> JSP - mysql 연결 </h2>
	
	<h3>1. JDBC(Java DataBase Connectivity) driver install (once a project)</h3>
	<h4>src/webapp/WEB-INF/lib/mysql-connector-j-8.0.33.jar copy</h4>
	
	<h3>2. load(불러오기) the installed driver</h3>
	<%
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("Driver load success");
	%>
	<h3>3. 드라이버를 사용해서 DB에 접속</h3>
	<%
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb", 
									"root",
									"Dlstjd1915");
	
		System.out.println("Success DB connection.");
	%>
	<h3>4. Use DB connect information </h3>
	<%
		System.out.println("con: " + con); // con: com.mysql.cj.jdbc.ConnectionImpl(type)@1f6a18b4(객체코드)
	%>
	
	
</body>
</html>
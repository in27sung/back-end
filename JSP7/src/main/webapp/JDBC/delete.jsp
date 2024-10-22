<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
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
	<h1>update.jsp</h1>
	
	<!-- 특정 사용자(1번)의 정보를 삭제 -->
	
	<%
	// DB연결에 필요한 정보
	final String DRIVER = "com.mysql.cj.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "Dlstjd1915";
	
	// 1. Driver load
	Class.forName(DRIVER);
	System.out.println("Success Driver load");
	
	// 2. Connect DB
	Connection con = DriverManager.getConnection(DBURL,DBID,DBPW);
	System.out.println("Success DB connect");
	System.out.println("con: " + con);
	
	// 3. Update SQL 구문 & pstmt 객체
	String sql = "delete from test3 where idx=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	// 3-1 ???
	pstmt.setInt(1, 1); //번호 (Order of ?, value of ?)
	
	
	// 4. SQL구문 실행
	int count = pstmt.executeUpdate(); //:insert, update, delete
	// return: 실행한 업데이트 횟수 
	if(count > 0){
		System.out.println("회원정보 "+ count +"번 삭제 완료!");
		System.out.println("SQL 실행 성공!");
	}
	else{
		System.out.println("삭제할 정보 없음");
	}
	 
	
	
		
	%>
</body>
</html>
<%@page import="java.sql.PreparedStatement"%>
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
	<h1>update.jsp</h1>
	
	<!-- 특정 사용자(1번)의 (DB에 저장된)이름을 수정하는 동작 -->

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
	System.out.println(" con: " + con);
	
	// 3. Update SQL 구문 & pstmt 객체
	String sql = "update test3 set name=? where idx=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	// 3-1 ???
	pstmt.setString(1, "수정된 이름"); //이름
	pstmt.setInt(2, 1); //번호 (두번째물음표, 선택값)
	
	
	// 4. SQL구문 실행
	int count = pstmt.executeUpdate(); //:insert, update, delete
	// return: 실행한 업데이트 횟수 
	System.out.println("Count: " + count);
	
	// pstmt.executeQuery(); :select 
	System.out.println("SQL 실행 성공!");
	System.out.println("회원정보 수정 완료!");
		
	%>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
</body>
</html>
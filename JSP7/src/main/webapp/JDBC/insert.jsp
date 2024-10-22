<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
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
	<h1>insert.jsp</h1>
	
	<h2>DB에 접속해서 정보를 저장 / 생성(Create)</h2>
	
	<%
		// Install Driver - 생략
		// 디비연결정보 저장
		final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "Dlstjd1915";
		
		// 1. Load Driver 
		Class.forName(DRIVER);
		System.out.println("Success driver load");
		
		// 2. connect DataBase
		Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
		System.out.println("Success DataBase connect");
		System.out.println(" con : " + con);
		
		int idx = 55;
		String name = "학생55";
		String jumin = "000505-5555555";
		
		// 3. SQL구문 작성 & stmt 객체 생성 
		// sql - Save information at test3
		//String sql = "insert into test3 (idx, name, jumin) values(10,'아이티윌','000101-1231231')";
		//String sql = "insert into test3 (idx, name, jumin) values("+idx+", '"+name+"', '"+jumin+"')";
		String sql = "insert into test3 (idx, name, jumin) values(?,?,?)";
		
		// DB관련 객체 사용시 java.sql or javax.sql 패키지 선택 
		//Statement stmt = con.createStatement();
		//=> Statement 객체는 SQL 구문을 실행 할 수 있는 객체
		PreparedStatement pstmt = con.prepareStatement(sql); // 프리스테이트먼트로 값의 data type 설정 가능 
		
		// 3-1. ??? 값 입력
		//pstmt.setInt(?위치,?에 들어갈 값);
		pstmt.setInt(1,idx); // set + datatype 
		pstmt.setString(2,name);
		pstmt.setString(3,jumin);
		
				
		// 4. SQL구문 실행 
		//stmt.executeUpdate(sql);
		pstmt.executeUpdate();
		System.out.println(" insert(SQL)구문 실행 완료!");
		
	%>
	
	
	
	
</body>
</html>
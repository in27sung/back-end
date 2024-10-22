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
	<h1>insertPro.jsp</h1>
	
	<%
	// 한글 인코딩
	request.setCharacterEncoding("UTF-8");
	// 회원가입 처리 
	
	//1) insertForm.jsp에서 입력된 사용자의 정보를 받아서 저장 
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String name = request.getParameter("name");
    int age = Integer.parseInt(request.getParameter("age")); //from String type to integer 형태로 변환 
    String gender = request.getParameter("gender");
    String eMail = request.getParameter("email");

    Timestamp regdate = new Timestamp(System.currentTimeMillis());
   	System.out.println("회원 입력정보");
   	System.out.println("ID: " + id + ", PW: " + password + ", Name: " + name);
   	System.out.println("Age: " + age + ", Gender: " + gender + ", Email: " + eMail);
   	System.out.println("regedent date: " + regdate);
   	
	//2) 전달받은 정보를 mysql(DB)에 저장
	final String DRIVER = "com.mysql.cj.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "Dlstjd1915";
	
	// 1. Driver load
	Class.forName(DRIVER);
	System.out.println("Success Driver load");
	
	// 2. Connect DB
	Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
	System.out.println("Success DataBase connect");
	
	// 3. SQL 구문 & pstmt 객체
	String sql = "insert into itwill_member (id, pass, name, age, gender, email, regdate) values(?, ?, ?, ?, ?, ?, ?)";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	// 3-1.? values
	pstmt.setString(1, id); // set + datatype 
	pstmt.setString(2, password);
	pstmt.setString(3, name);
	pstmt.setInt(4, age);
	pstmt.setString(5, gender);
	pstmt.setString(6, eMail);
	pstmt.setTimestamp(7, regdate);
	// 4. SQL 구문 실행
	pstmt.executeUpdate();
	System.out.println("Complete sign up");
	
	// 회원가입 성공 시 로그인 페이지로 이동
	response.sendRedirect("loginForm.jsp");
	%>

</body>
</html>
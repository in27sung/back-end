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
	<h1>updateForm.jsp</h1>
	
	<%
	//기존의 사용자의 정보를 가져와서 폼태그에 출력
		
	// Check sgin in information
	String id = (String)session.getAttribute("id");
	
	if (id == null){
		System.out.println("로그인 정보 없음");
		response.sendRedirect("loginForm");
	}
	// DB에 저장된 회원의 정보를 모두 가져오기 
	// DB information
	final String DRIVER = "com.mysql.cj.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "Dlstjd1915";
	
	// Load driver
	Class.forName(DRIVER);
	
	// Connect DB
	Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
	System.out.println("Connection: " + con);
	
	// SQL 구문 & pstmt 객체 
	String sql = "select * from itwill_member where id=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, id);
	
	// SQL 실행
	ResultSet rs = pstmt.executeQuery();
	
	String pass = "";
	String name = "";
	String gender = "";
	int age = 0;
	String email = "";
	
	// 데이터 처리
	if(rs.next()){
		// 사용자가 필요한 정보를 화면에 모두 출력
		// id 생략
		pass = rs.getString("pass");
		name = rs.getString("name");
		age = rs.getInt("age");
		gender = rs.getString("gender");
		email = rs.getString("email");
	
	// 비밀번호를 제외한 나머지 정보를 채우기 
	}
	%>
	
	<h2> Edit information </h2>
	
	<fieldset>
		<legend>ITwill-sign up</legend>
		
		<form action="updatePro.jsp" method="post">
			ID: <input type="text" name="id" value="<%=id%>" readonly="readonly"> <br>
			Password: <input type="password" name="password" placeholder=" 비밀번호를 입력하세요"> <br>
			Name: <input type="text" name="name" value="<%=name%>"> <br>
			Age: <input type="number" name="age" value="<%=age%>"> <br>
			Gender: <input type="radio" name="gender" value="male" 
					<% if(gender.equals("male")){ %>
						checked="checked"
					<% } %>
					>Male
					<input type="radio" name="gender" value="female"
					<% if(gender.equals("female")){ %>
						checked="checked"
					<% } %>
					>Female <br>
			E-mail: <input type="email" name="email" value="<%=email%>" disabled="disabled"> 
			<hr>
		
			<input type="submit" value="Edit information">
		</form>
	</fieldset>
</body>
</html>
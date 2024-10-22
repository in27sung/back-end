<%@page import="org.apache.catalina.connector.Response"%>
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
	<h1>loginPro.jsp</h1>
	
	<%
	// Form tag 정보를 post 방식으로 전송 => 한글 인코딩
	request.setCharacterEncoding("UTF-8");
	
	// 1) 전달받은 정보(id, password)를 저장 	
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	System.out.println("ID: " + id + ", Password: " + password);
	
	// 2) 사용자의 정보를 가지고 로그인 여부 판단 
	
	// Information for DB
	final String DRIVER = "com.mysql.cj.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "Dlstjd1915";
	
	// Driver load 
	Class.forName(DRIVER);
	System.out.println("Complete Driver load");
	
	// Connect Database
	Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
	System.out.println("Complete database connection");
	System.out.println("Connection: " + con);
	
	// SQL 작성 & pstmt 객체
	// ID(PK)에 해당하는 비밀번호(NN)를 조회 -> 아이디 여부 판단 
	String sql = "select pass from itwill_member where id=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	// 3-1 ?
	pstmt.setString(1,id);
	
	// execute SQL
	ResultSet rs = pstmt.executeQuery();	
	// Data processing
	if(rs.next()){ //resultSet(SQL에 실행한 결과가)에 데이터가 있으면
		// 회원의 ID(+Password)가 있음
	 	System.out.println("membership info exists");
	 	// 입력한 비밀번호와 디비에 저장된 비밀번호가 일치
		if(password.equals(rs.getString("pass"))){
			// 로그인 성공
			System.out.println("Complete sign in");
			
			// 로그인 성공한 사용자의 ID를 저장
			session.setAttribute("id", id);
			
			//로그인 성공시 다른페이지(main.jsp)로 이동
			response.sendRedirect("main.jsp");
		}
		else{
			// 입력한 비밀번호와 디비에 저장된 비밀번호가 다름
			System.out.println("Incomplete sign in");
			// 로그인 실패시 => 이전 페이지(로그인페이)로 이동
			// response.sendRedirect("loginForm.jsp");
		}
	 	%>
	 		<!-- HTML -->
	 		<script type="text/javascript">
	 			// JavaScript
	 			alert("Your password is incorrect");
	 			//이전 페이지 이동
	 			history.back(); 
	 		</script>
	 	<%
	}
	else{// 회원의 ID and Password가 없음 => 비회원 
		System.out.println("incorrect membership info");
	
	 	%>
 		<!-- HTML -->
 		<script type="text/javascript">
 			// JavaScript
 			//alert("We cannot find an account with that ID");
 			var result = confirm("We cannnot find an acoount with that ID \nCreate new account?");
 			
 			if(result){
 				location.href="insertForm.jsp";
 			}
 			else{
 				//이전 페이지로 이동
 				history.back();
 			}
 		</script>
 		<%
	}
	%>
</body>
</html>
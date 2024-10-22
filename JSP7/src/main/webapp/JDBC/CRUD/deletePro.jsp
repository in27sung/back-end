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
	<h1>deletePro.jsp</h1>
	
	<%
		//회원정보를 삭제(탈퇴)
		
		//session에 저장된 아이디
		String id = (String)session.getAttribute("id");
		if(id == null){
			System.out.println("로그인 정보 없음");
			response.sendRedirect("password");
			
		}
		// 1. deleteForm.jsp에서 전달해준 정보를 저장
		String password = request.getParameter("password");
		
		
		// 정보를사용해서 DB에 저장된 회원정보를 삭제 
		// 사용자의 로그인 여부 체크
	if(id == null){
		response.sendRedirect("loginForm");
	}
	
	// Get DB information 
	final String DRIVER = "com.mysql.cj.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "Dlstjd1915";
	
	// Load driver
	Class.forName(DRIVER);
	
	// Connect DB
	Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
	System.out.println("Connection: " + con);
	
	// Update SQL 구문 & pstmt 객체
	// 본인 여부 확인 후 정보 수정 
	String sql = "select pass from itwill_member where id=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	// Update ???
	pstmt.setString(1, id);
	
	//Excute DB 
	ResultSet rs = pstmt.executeQuery();
	
	//데이터 처리 
	if(rs.next()){
		//exist account information + 비밀번호 확인(수정 O/X)
		if(password.equals(rs.getString("pass"))){
			// correct password => 수정 O
			// SQL 작성(Delete) & pstmt 객체
			sql = "delete from itwill_member where id=?";
			pstmt = con.prepareStatement(sql); 
			
			// value of ?
			pstmt.setString(1, id); 
			
			// Excute SQL
			pstmt.executeUpdate();
			
			// 사용자 session reset 
			session.invalidate();
			%>
			<script type="text/javascript">
				alert("complete delete account");
				location.href="main.jsp";
			</script>
			<%
			
			System.out.println("complete edit information");
		}
		else{ // incorrect password => 수정x
			%>
			<script type="text/javascript">
				alert("incomplete delete account - Password Error");
				history.back();
			</script>
			<%
		}
		
	}
	else{
		//no exist acc info(예외상황/Error)
			%>
			<script type="text/javascript">
				alert("incomplete delete account - Error");
				history.back();
			</script>
			<%
	}
	
	//System.out.println("Complete edit information");
	
	%>
		

</body>
</html>
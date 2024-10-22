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
	<h1>updatePro.jsp</h1>
	
	<%
	// 한글 인코딩
	request.setCharacterEncoding("UTF-8");
	
	// get session id information 
	String id = (String)session.getAttribute("id");
	
	// 사용자의 로그인 여부 체크
	if(id == null){
		response.sendRedirect("loginForm");
	}
	
	//updateForm.jsp에서 전달된 정보를 저장(수정할 정보)
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String gender = request.getParameter("gender");
	
	//전달받은 정보를 DB에가서 수정
	request.setCharacterEncoding("UTF-8");
	
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
			// SQL 작성(Update) & pstmt 객체
			sql = "update itwill_member set name=?, age=?, gender=?  where id=?";
			pstmt = con.prepareStatement(sql); 
			
			// Update ?
			pstmt.setString(1, name); 
			pstmt.setInt(2, age); 
			pstmt.setString(3, gender);
			pstmt.setString(4, id);
			
			// Excute SQL
			pstmt.executeUpdate();
			
			%>
			<script type="text/javascript">
				alert("complete edit information");
				location.href="main.jsp";
			</script>
			<%
			
			System.out.println("complete edit information");
		}
		else{ // incorrect password => 수정x
			%>
			<script type="text/javascript">
				alert("incomplete edit information - Password Error");
				history.back();
			</script>
			<%
		}
		
	}
	else{
		//no exist acc info(예외상황/Error)
			%>
			<script type="text/javascript">
				alert("incomplete edit information - ID Error");
				history.back();
			</script>
			<%
	}
	
	//System.out.println("Complete edit information");
	
	%>
</body>
</html>
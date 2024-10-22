<%@page import="com.itwillbs.bean.MemberDB"%>
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
	
	// MemberBean에 저장 
	
	// MemberDB에 updateMember() 사용 
	
	
	// get session id information 
	String id = (String)session.getAttribute("id");
	
	// 사용자의 로그인 여부 체크
	if(id == null){
		response.sendRedirect("loginForm.jsp");
	}
	
	%>
	
	<jsp:useBean id="memberB" class="com.itwillbs.bean.MemberBean"/>
	
	<jsp:setProperty property="*" name="memberB"/>
	<%
	// MemberDB에 updateMember() 사용
	// 실행결과를 정수(-1, 0, 1)리턴해서 결과에 따른 페이지로 이동
	MemberDB memberDB = new MemberDB();
	
	int result = memberDB.updateMember(memberB);	
	
	System.out.println("result: " + result);
	
	if(result == -1){
		%>
		<script type="text/javascript">
			alert("incomplete edit information - ID Error");
			history.back();
		</script>
		<% 
		}
	else if(result == 0){
		%>
		<script type="text/javascript">
			alert("incomplete edit information - Password Error");
			history.back();
		</script>
		<% 
	}
	else { //result == 1
		%>
		<script type="text/javascript">
			alert("complete edit information");
			location.href="main.jsp";
		</script>
		<%
	}
	%>
	
	
</body>
</html>
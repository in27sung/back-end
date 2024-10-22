<%@page import="com.itwillbs.bean.MemberDB"%>
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
			response.sendRedirect("loginForm.jsp");
			
		}
		// 1. deleteForm.jsp에서 전달해준 정보를 저장
		//String password = request.getParameter("password");
	%>
	
	<jsp:useBean id="memberB" class="com.itwillbs.bean.MemberBean"/>
	
	<jsp:setProperty property="*" name="memberB"/>
	<% 	
	
	memberB.setId(id);
	System.out.println(memberB);
	
	// MemberDB객체 생성
	MemberDB memberDB = new MemberDB();
	
	
	int result = memberDB.deleteMember(memberB);
	
	if(result == -1){
		%>
		<script type="text/javascript">
			alert("incomplete delete account - Password Error");
			history.back();
		</script>
		<%
		}
	else if(result == 0){
		%>
		<script type="text/javascript">
			alert("incomplete delete account - Password Error");
			history.back();
		</script>
		<%
		}
	else{ //result == 1
			//로그인 정보 초기화
			session.invalidate();
			%>
			<script type="text/javascript">
			alert("complete delete account");
			location.href="main.jsp";
			</script>
			<%
			}
			%>
		

</body>
</html>
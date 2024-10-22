<%@page import="com.itwillbs.bean.MemberDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	//Korean encoding
	request.setCharacterEncoding("UTF-8");
	%>
	<!-- Create MemberBean instance  -->
	<jsp:useBean id="memberB" class="com.itwillbs.bean.MemberBean"/>

	<!-- Save Parameter -->
	<jsp:setProperty property="*" name="memberB"/>
	
	<%
	// Print memberBean values 
	System.out.println(memberB.toString());
	%>

	<%
	//Create MemberDB instance 
	MemberDB memberDB = new MemberDB();
	
	// Login check function
	int result = memberDB.loginCheck(memberB);
	
	if(result == 0){ // 비밀번호 오류	
	 %>
	 <!-- JavaScript -->
	 <script type="text/javascript">
 		alert("Your password is incorrect");
 		//이전 페이지 이동
 		history.back(); 
 	</script>
 	<%
	}
	else{ //result == 1	로그인 성공 
		// 세션영역에 사용자의 아이디정보를 저장
		session.setAttribute("id", memberB.getId());
		// Main page 
		response.sendRedirect("main2.jsp");
		}
	%>	
</body>
</html>

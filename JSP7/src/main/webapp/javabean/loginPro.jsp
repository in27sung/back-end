<%@page import="com.itwillbs.bean.MemberDB"%>
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
	<h1>javabean/loginPro.jsp</h1>
	
	<%
	// Form tag 정보를 post 방식으로 전송 => 한글 인코딩
	request.setCharacterEncoding("UTF-8");
	%>
	<!-- Action tag: Instance 생성 -->
	<jsp:useBean id="memberB" class="com.itwillbs.bean.MemberBean"/>
	
	<!-- Action tag: parameter 저장 -->
	<jsp:setProperty property="*" name="memberB" />
	
	<% 
	//System.out.println(memberB);
	System.out.println(memberB.toString());	
	%>
	
	<% 
	//System.out.println("ID: " + id + ", Password: " + password);
	
	//2) 사용자의 정보를 가지고 로그인 여부 판단 
	//2) 전달받은 정보를 mysql(DB)에 저장

	// MemberDB객체 생성
	MemberDB memberDB = new MemberDB();
	
	// 로그인 체크하는 method 실행
	int result = memberDB.loginCheck(memberB);
	System.out.println("Result: " + result);
	
	if(result == -1){ // 회원정보가 오류
		%>
		<!-- HTML code -->
		<script type="text/javascript">
			//JavaScript code
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
	else if(result == 0){ // 비밀번호 오류	
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
	else{ //result == 1	로그인 성공 
		//세션영역에 사용자의 아이디정보를 저장
		session.setAttribute("id",memberB.getId());
		//Main page 
		response.sendRedirect("main.jsp");
		}
	%>	

</body>
</html>
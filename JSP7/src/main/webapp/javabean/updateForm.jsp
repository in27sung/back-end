<%@page import="com.itwillbs.bean.MemberDB"%>
<%@page import="com.itwillbs.bean.MemberBean"%>
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
		response.sendRedirect("loginForm.jsp");
	}
	// DB에 저장된 회원의 정보를 모두 가져오기 
	// DB information
	MemberDB memberDB = new MemberDB();
	
	MemberBean memberB = memberDB.getMember(id);
	
	
	%>
	
	<h2> Edit information </h2>
	
	<fieldset>
		<legend>ITwill-sign up</legend>
		
		<form action="updatePro.jsp" method="post">
			ID: <input type="text" name="id" value="<%=id%>" readonly="readonly"> <br>
			Password: <input type="password" name="pass" placeholder=" 비밀번호를 입력하세요"> <br>
			Name: <input type="text" name="name" value="<%=memberB.getName()%>"> <br>
			Age: <input type="number" name="age" value="<%=memberB.getAge()%>"> <br>
			Gender: <input type="radio" name="gender" value="male" 
					<% if(memberB.getGender().equals("male")){ %>
						checked="checked"
					<% } %>
					>Male
					<input type="radio" name="gender" value="female"
					<% if(memberB.getGender().equals("female")){ %>
						checked="checked"
					<% } %>
					>Female <br>
			E-mail: <input type="email" name="email" value="<%=memberB.getEmail()%>" disabled="disabled"> 
			<hr>
		
			<input type="submit" value="Edit information">
		</form>
	</fieldset>
</body>
</html>
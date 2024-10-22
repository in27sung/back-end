<%@page import="com.itwillbs.bean.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwillbs.bean.MemberDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.apache.catalina.connector.Response"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 style="color:red">list.jsp</h1>
	
	<h2>관리자 메뉴 - 회원목록 정보</h2>
	
	<%
		String id = (String)session.getAttribute("id");
	
		// Check Login + admin 
		if(id == null || !id.equals("admin")){
			response.sendRedirect("loginForm.jsp");
		}
		
		// MemberDB객체 - getMemberList() 생성
		MemberDB memberDB = new MemberDB();
		
		ArrayList memberList = memberDB.getMemberList();
		
		System.out.println("Result: " + memberList);
		System.out.println("The number of result: " + memberList.size());
		
	%>
	
	<table border="1">
		<tr>
			<td>ID</td>
			<td>PW</td>
			<td>Name</td>
			<td>Age</td>
			<td>Gender</td>
			<td>Email</td>
			<td>Start date</td>
		</tr>
		<%//for(int i = 0; i < memberList.size(); i++)
		// for(배열안에 저장된 데이터 타입 변수:배열, 컬렉션 이름)
		for(Object obj:memberList){ //향상된 for문, foreach문 
			// ArraryList에서 정보를 하나씩 불러옴 
			//MemberBean memberB = (MemberBean)memberList.get(i);
			//object -> Memberbean
			MemberBean memberB = (MemberBean)obj;
		%>
		<tr>
			<td><%=memberB.getId() %></td>
			<td><%=memberB.getPass() %></td>
			<td><%=memberB.getName() %></td>
			<td><%=memberB.getGender() %></td>
			<td><%=memberB.getAge() %></td>
			<td><%=memberB.getEmail() %></td>
			<td><%=memberB.getRegdate() %></td>
		</tr>
		<%} %>
	</table>
	
	<a href="main.jsp">메인페이지로 이동..</a>
		
</body>
</html>
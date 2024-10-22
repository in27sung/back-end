<%@page import="com.itwillbs.bean.JavaBean2"%>
<%@page import="com.itwillbs.bean.JavaBean1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>javaBeanPro2.jsp</h1>
	
	<%
	// korean encoding 
	request.setCharacterEncoding("UTF-8");
		
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String birth = request.getParameter("birth");
		
	%>
	
	ID: <%=id %><br>
	Password: <%=password %><br>
	Birth: <%=birth %><br>

	<h2> 자바빈 객체를 사용해서 처리 </h2>
	<%
	//JavaBean2 객체 생성 (id,pw,birth)
	JavaBean2 jb2 = new JavaBean2();
	
	// 전달된 정보를 JavaBean 객체에 저장 
// 	jb2.setId(id);
// 	jb2.setPassword(password);
// 	jb2.setBirth(birth);
	jb2.setId(request.getParameter("id"));
	jb2.setPassword(request.getParameter("password"));
	jb2.setBirth(request.getParameter("birth"));
	
	// 전달된 정보를 JavaBean2 객체에서 꺼내 출력 
	%>	
	
	ID: <%=jb2.getId() %><br>
	Password: <%=jb2.getPassword() %><br>
	Birth: <%=jb2.getBirth() %><br>
	
	<%=jb2.toString() %><hr>
	<%=jb2 %><hr>
	
	<h2> 액션태그 사용 자바빈 객체로 전달 정보 처리 </h2>
	<!-- 객체 생성 -->
	<jsp:useBean id="jb2_1" class="com.itwillbs.bean.JavaBean2"/>
	
	<!-- 전달정보 저장 --> 
<%-- <jsp:setProperty property="id" name="jb2_1" param="id"/> --%>
<%-- 	<jsp:setProperty property="id" name="jb2_1" />  --%>
<%-- 	<jsp:setProperty property="password" name="jb2_1" param="password"/> --%>
<%-- 	<jsp:setProperty property="birth" name="jb2_1" param="birth"/> --%>
	<!-- property="id", param="id" 이름이 같을때 param정보를 생략가능 -->
	
	<!-- property="*" 사용하게되면 모든 파라메터 정보에 해당하는 각각의 변수(property)에 저장 -->
	<jsp:setProperty property="*" name="jb2_1"/>
	
	<!-- 정보 출력 -->
	ID:<jsp:getProperty property="id" name="jb2_1"/> <br>
	Password:<jsp:getProperty property="password" name="jb2_1"/> <br>
	Birth:<jsp:getProperty property="birth" name="jb2_1"/> <br>
	








</html>
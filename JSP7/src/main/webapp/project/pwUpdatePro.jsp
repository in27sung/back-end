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

<jsp:useBean id="memberB" class="com.itwillbs.bean.MemberBean"/>

<jsp:setProperty property="*" name="memberB"/>

<%
System.out.println(memberB.toString());
MemberDB memberDB = new MemberDB();

int result = memberDB.pwCheck(memberB);

System.out.println("result: " + result);

if(result == 0){
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
	//Main page 
	session.setAttribute("pass", memberB.getPass());
	session.setMaxInactiveInterval(600);
	response.sendRedirect("updateForm.jsp");
	}
%>	
</body>
</html>
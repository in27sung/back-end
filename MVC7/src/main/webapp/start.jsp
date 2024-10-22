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
	System.out.println("V: /member/inserForm.jsp 페이지 실행");
	%>
	<h1>start.jsp</h1>
	
	<h2>MVC 패턴에서 실행가능한 유일한 jsp 페이지</h2>
	<h2>만약 실행 주소가 ~~.jsp 끝나는 경우 잘못된 코드를 작성했음</h2>
	<%
	//response.sendRedirect("./itwillbs.me");
// 	response.sendRedirect("./Main.me");
// 	response.sendRedirect("./Main.bo");
//	response.sendRedirect("./BoardWrite.bo");
	response.sendRedirect("./BoardList.bo");
	System.out.println("\n\nView: start.jsp 페이지 실행");
	%>
	
</body>

</html>
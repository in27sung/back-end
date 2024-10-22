<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>testPro1.jsp</h1>
	
	<h2>testForm1.jsp 페이지에서 전달된 정보(parameter)를 저장 & 출력</h2>
	
	<% //scriptlet(실행만)
		// request.getParameter("전달받을 parameter");
		// request.getParameter("number");
		// * 폼태그로 전달된 모든 파라미터는 String타입.
	 	// int number = request.getParameter("number");
	 	//Type mismatch: cannot convert from String to 
		String number = request.getParameter("number");
		// 문자 -> 정수타입으로 변경 (remove "") parse
		int num = Integer.parseInt(request.getParameter("number"));
		
		out.print(num); //print in scriptlet 
	%>
	<%=number %> <hr>
	<%=num %> <hr>
	<%=request.getParameter("number")%> <!-- 화면에 출력 --> 
</body>
</html>
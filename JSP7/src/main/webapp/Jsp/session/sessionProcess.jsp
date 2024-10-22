<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionProcess.jsp</h1>
	
	<h2> Server(admin)</h2>
	
	<%
		System.out.println("사용자 요청을 처리중..."); //ex."아메리카노 주세요"
		// 카페 포인트적립 -> 내정보를 기억
		session.setAttribute("name", "ITWILL");
		
		session.setAttribute("tel", "051-803-0909");
		
		System.out.println("사용자 요청을 처리중..."); //커피 만들기
		
		session.setMaxInactiveInterval(3); //시간 설정
		
	%>
	<script type="text/javascript">
		alert("요청처리 완료")//커피 완료
		location.href="sessionForm.jsp";
	</script>
</body>
</html>
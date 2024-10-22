<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> testPro2.jsp </h1>
	
	<%
		// *폼태그를 POST방식으로 전송시 한글 깨짐 현상(인코딩오류)
		// 한글처리 인코딩(한글깨짐 처리)
		request.setCharacterEncoding("UTF-8");
		
		// 전달해준 parameter 정보를 저장 (이름, 나이)
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
	%>
	
	<h2> 사용자 이름: <%=name %></h2>
	<h2> 사용자 나이: <%=age %></h2>
	<%
		// 사용자의 나이가 20살 이상 "성인입니다"
		// 사용자의 나이가 20살 미만 "미성년자 입니다"
		if(age >= 20){// 간결한 연산으로 작성한다. (추가 연산 줄임)
			out.println("성인입니다.");
		}else{
			out.println("미성년자 입니다.");			
		}
	%>
</body>
</html>
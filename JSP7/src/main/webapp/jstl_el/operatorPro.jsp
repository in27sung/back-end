<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>operatorPro.jsp</h1>
	
	<h2>전달된 정보를 출력</h2>
	<% 
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
 	%> 
	
	<!-- 폼태그로 전송된 데이터는 String 타입 -->
	<!-- EL 표현식으로 전달받은 정보는 자동으로 형변환 -->
	숫자1: ${param.num1} (타입 int)<br>
	숫자2: ${param.num2} (타입 int)<br>
	<hr>
	<h2>EL표현식의 연산으로 $ { }안에 작성해야한다.</h2>
	숫자1 + 숫자2 = ${param.num1 + param.num2}<br>
	${param.num1} + ${param.num2} = ${param.num1 + param.num2}<br>
	
	<h3>숫자1, 숫자2 모두 양수인지 체크하는 동작 (true/false)</h3>
	양수(${param.num1} > 0) = ${param.num1 > 0} <br> 
	음수(${param.num2} < 0) = ${param.num2 < 0} <br>
	${param.num1 > 0 && param.num2 > 0}
	
	<h3>숫자1, 숫자2가 같은경우 (true/false)</h3>
	
<%-- 	숫자의 값이 같나요? ${(param.num1 == param.num2)? "예":"아니오"}(EL), --%>
	숫자의 값이 같나요? ${(param.num1 eq param.num2)? "예":"아니오"}(EL),
	
	<%
		if(num1 == num2){
		%>
			<%="예(JSP)" %>
		<%
		}
		else{
			%>
			<%="아니요(JSP)"%>
		<%
		}
		%>
	<hr>
	
	<h3>폼태그에서 ID정보를 하나 입력받아와서 아이디가 있으면 "OOO"님 안녕하세요, 없다면"게스트님 안녕하세요"</h3>
	
	아이디: ${param.id} <br>
	${(empty param.id)? "게스트" : param.id}님 안녕하세요
		
</body>
</html>
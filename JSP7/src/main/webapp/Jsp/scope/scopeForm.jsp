<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>scopeForm.jsp</h1>
	
	<h2>Scope(영역): 데이터가 공유가능한 범위</h2>
	<h2>Attribute(속성): 공유하는 데이터 값</h2>
	<h3>=> 데이터를 전달하는 '방법'</h3>
	
	영역 객체와 속성/p.209~
	<!-- 밑으로 갈수록범위가 커짐 -->
	<table border="1">
		<tr>
			<td>영역</td>
			<td>영역객체</td>
			<td>유효범위</td>
		</tr>
		<tr>
			<td>page</td>
			<td>pageContext</td>
			<td>해당 페이지가 실행하는 동안(servlet: _jspService()가 실행되는 동안)</td>
		</tr>
		<tr>
			<td>request</td>
			<td>request</td>
			<td>클라이언트의 요청이 처리되는 동안</td>
		</tr>
		<tr>
			<td>session</td>
			<td>session</td>
			<td>세션이 유지되는 동안(웹브라우저당 1개의 세션생성)</td>
		</tr>
		<tr>
			<td>application</td>
			<td>application</td>
			<td>해당 애플리케이션이 실행되는 동안 유효</td>
		</tr>
	</table>
	
	<h2>영역에 정보를 저장/사용</h2>
	<h3>공유데이터 생성: 영역객체.setAttribute("name, value");</h3>
	<h3>공유데이터 사용: 영역객체.getAttribute("name");</h3>
	<h3>공유데이터 삭제: 영역객체.removeAttribute("이름");</h3>
	
	<hr>
	
	<fieldset>
		<legend>정보전달(parameter)</legend> <!-- Defines the label for a set of form fields -->
		<form action="scopePro.jsp" method="get">
			아이디: <input type="text" name="id">
			<input type="submit" name="전송">
		</form>
	</fieldset>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>main2.jsp</h1>
	
	<!--3행 2열 테이블 -->
	
	<table border="1" width="600" height="800">
		<tr>
			<td colspan="2" height="100">
			<jsp:include page="../../include/top.jsp"/>
			</td>
		</tr>
		<tr>
			<td width="100">
				<h2>SubMenu</h2>
			</td>
			<td>
				<h2>Contents</h2>
			</td>
		</tr>
		<tr>
			<td colspan="2" height="100">
				<h2>Bottom</h2>
			</td>
		</tr>
	</table>
	
</body>
</html>
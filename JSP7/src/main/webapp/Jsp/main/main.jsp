<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- Add colour file -->
    <%@ include file="../../include/colour.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="<%=colour3%>">
	<h1>main.jsp</h1>
	
	<h2> &lt;%@ include %&gt;(JSP지시어) 사용할 페이지정보를 가져와서 생성(컴파일) 후 추가/p.229</h2>
	<h2> jsp:include (액션태그) 사용될 페이지 정보를 생성(컴파일)후 가져와서 추가/수정 </h2>
	
	<!--3행 2열 테이블 -->
	<table border="1" width="600" height="800">
		<tr>
			<td colspan="2" height="100">
			<!-- 액션태그 jsp:~ /p.222~ -->
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
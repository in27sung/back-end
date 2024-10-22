<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.Calendar"%>
<html>
<head>
<%
Calendar c=Calendar.getInstance();
int hour=c.get(Calendar.HOUR_OF_DAY);
int minute=c.get(Calendar.MINUTE);
int second=c.get(Calendar.SECOND);
%>
<meta charset="UTF-8">
<title>현재시각</title>
</head>
<body>
현재시간은 <%=hour %>시 <%=minute %>분 <%=second %>초 입니다.
<!-- %=로 묶인 부분을 통해 HTML 코드로 변환하여 용자에게 전송-->
</body>
</html>

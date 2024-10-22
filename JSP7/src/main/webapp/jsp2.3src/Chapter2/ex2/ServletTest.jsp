<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.Calendar"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.
dtd">
<html>
<head>
<%
Calendar c=Calendar.getInstance();
int hour=c.get(Calendar.HOUR_OF_DAY);
int minute=c.get(Calendar.MINUTE);
int second=c.get(Calendar.SECOND);
%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Servlet Test</title>
</head>
<body>
<h1>현재시간은 <%=hour %>시 <%=minute %>분 <%=second %>초 입니다.</h1>
</body>
</html>


<!-- URL 요청이 JSP파일이면 웹 컨터에너는 먼저 JSP파일을 파싱(Parsing)하여 자바 코드로 변환 -->
<!-- Parsing: 코드를 해석해서 그에 맞는 변환 코드로 바꾸는 작업 -->
<!-- 스크립틀릿% %= 등은 그대로 사용하고 HTML태그로 된 부분들은 위의 서블릿 소스처럼 write()메소드를 사용하는 방식으로 변환 한다
	이렇게 만들어진 자바 코드 파일을 컴파일하여 서블릿 클래스 파일을 만들게 된다.
	서블릿 클래스 실행 -> 인스터스 생성 -> int() method에 의해 초기화 
	그 후, 요청에 따른 스레드가 하나 생성되어 service()메소드를 호출 
	요청 방식에 따라 doGet() or doPost() 메소드 실행 
	HTML코드로 이루어진 결과 페이지 생성 
	웹 컨테이너 -> 웹 서버 -> 클라이언트 
	이러한 과정은 최초 요청이 이루어졌을 때 전부 거치고 두 번째 요청부터는 이미 생성된 인스터슨에서 
	스레드만 하나씩 생성되어 service()메소드 호출 처리 속도에 이점 
	
	jsp 페이지의 코딩 내용이 변경되면 다시 변환 과정수행 /p.66
 -->
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
<h1>����ð��� <%=hour %>�� <%=minute %>�� <%=second %>�� �Դϴ�.</h1>
</body>
</html>


<!-- URL ��û�� JSP�����̸� �� ���Ϳ��ʴ� ���� JSP������ �Ľ�(Parsing)�Ͽ� �ڹ� �ڵ�� ��ȯ -->
<!-- Parsing: �ڵ带 �ؼ��ؼ� �׿� �´� ��ȯ �ڵ�� �ٲٴ� �۾� -->
<!-- ��ũ��Ʋ��% %= ���� �״�� ����ϰ� HTML�±׷� �� �κе��� ���� ���� �ҽ�ó�� write()�޼ҵ带 ����ϴ� ������� ��ȯ �Ѵ�
	�̷��� ������� �ڹ� �ڵ� ������ �������Ͽ� ���� Ŭ���� ������ ����� �ȴ�.
	���� Ŭ���� ���� -> �ν��ͽ� ���� -> int() method�� ���� �ʱ�ȭ 
	�� ��, ��û�� ���� �����尡 �ϳ� �����Ǿ� service()�޼ҵ带 ȣ�� 
	��û ��Ŀ� ���� doGet() or doPost() �޼ҵ� ���� 
	HTML�ڵ�� �̷���� ��� ������ ���� 
	�� �����̳� -> �� ���� -> Ŭ���̾�Ʈ 
	�̷��� ������ ���� ��û�� �̷������ �� ���� ��ġ�� �� ��° ��û���ʹ� �̹� ������ �ν��ͽ����� 
	�����常 �ϳ��� �����Ǿ� service()�޼ҵ� ȣ�� ó�� �ӵ��� ���� 
	
	jsp �������� �ڵ� ������ ����Ǹ� �ٽ� ��ȯ �������� /p.66
 -->
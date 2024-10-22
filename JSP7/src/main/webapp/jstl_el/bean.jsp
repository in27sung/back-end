<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>/jstl_el/bean.jsp</h1>
	
	<h2> 전달받은 Person 객체 정보 출력</h2>
	
	<h3> EL 표현식으로 정보 출력시 get/set메서드 생략 가능, 변수이름을 직접 호출</h3>
	
	${personInfo} <br>
	
	이름: ${personInfo.getName()} <br>
	이름: ${personInfo.name} <br>
	이름: ${personInfo["name"]} <br>
	
	휴대폰모델: ${personInfo.getPhone().getModel()} <br>
	휴대폰모델: ${personInfo.phone.model} <br>
	
	휴대폰번호: ${personInfo.getPhone().getTel()} <br>
	휴대폰번호: ${personInfo.phone.tel} <br>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>cookieTest.jsp</h1>
	
	<h2> cookie/ p.279: 서버와 클라이언트의 상태를 유지하기 위한 도구</h2>
		이름, 값, 유효기간, 도메인, 경로 ... 정보를 포함하고 있음 <br>
		이름을 설정할 때 영문자, 숫자 형태로 작성 <br>
		
		<!-- 
		
		client  ->   |	
					 |
					 |		server
					 |
	response[c]	<-	 |
		
		* 전달받은 쿠키정보를 사용자의 HDD에 저장(유효기간 지정까지)
		
		 -->
		 <%
		 	//session cookie: 웹브라우저가 닫히기 전 까지 정보를 저장하는 쿠키
		 	//지속쿠키: HDD에 저장되어 지속 가능한 쿠키
		 	// 쿠키의 정보를 가져오기 
		 	Cookie[] cookies = request.getCookies(); //Array
		 	
		 	String name = "";
		 	String value = "";
		 	
		 	// 여러개의 쿠키정보(array) 중에서 내가 필요한 쿠키 정보를 찾기 
		 	if(cookies != null){ //쿠키 배열정보가 존재한다
		 		for(int i = 0; i < cookies.length; i++){
		 			// 쿠키 배열안에 내가 만든 쿠키 찾기 
		 			if(cookies[i].getName().equals("cookieName")){
		 				System.out.println(cookies[i].getName());
		 				//쿠키의 이름, 값을 저장 후 출력
		 				System.out.println(cookies[i].getValue());
		 				name = cookies[i].getName(); //local value
		 				value = cookies[i].getValue(); //local value 
		 			}
		 				
		 		}
		 	}
		 %>
		 
		 <h2>CookieName: <%=name %></h2>
		 <h2>CookieValue: <%=value %></h2>
		 
		 <input type="button" value="쿠키값 생성" onclick="location.href='cookieSet.jsp'">
	
		 <input type="button" value="쿠키값 삭제" onclick="location.href='cookieDelete.jsp'">
</body>
</html>
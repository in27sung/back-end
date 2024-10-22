<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>cookieForm.jsp</h1>
	
	<!-- 
		사용자가 라디오버튼을 사용해서 언어를 선택(Korean/English)
		선택한 언어의 정보를 쿠키로 저장(cookiePro.jsp에서 처리)
		
		사용자가 선택한 쿠키정보(언어정보)에 따른 메세지 출력
		korean = "안녕하세요. 쿠키 전송 완료"
		english = "Hello, complete submitting cookie" 
	 -->
	 
	 <%
	 	// 기존의 쿠키정보를 가져오기
	 	Cookie[] cookies = request.getCookies();
	 	
	 	String value ="";
	 	// 쿠키배열에 내가 생성한 정보가 있는지 확인
	 	if(cookies != null){
	 		//쿠키 배열 검색 
	 		for(int i = 0; i < cookies.length; i++){
	 			if(cookies[i].getName().equals("language")){
	 				
	 				value = cookies[i].getValue();
	 			}
	 		}
	 	}
	 %>
	 
	 <h2>쿠키값 : <%=value %></h2>
	 <%
	 	if(value.equals("한국어")){
	 		out.println(" <h2>안녕하세요! 쿠키연습. </h2>");
	 	}else if(value.equals("english")){
	 		out.println(" <h2>Hello, cookie test.</h2>");
	 	}
	 %>
	 <fieldset>
	 	<form action="cookieProcess.jsp">
	 		언어:
	 		<input type="radio" name="language" value="한국어"
	 			<% if(value.equals("korean")){ //이부분 이해가 안됨%>
	 				checked="checked"
	 			<%}	%> 
	 		> 한국어
	 		<input type="radio" name="language" value="english"
	 		<%if(value.equals("english")){%>
	 			checked="checked"
	 			<%} %>
	 		> English 
	 		<input type="submit" value="언어선택">
	 	</form>
	 </fieldset>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>cookieDelete.jsp</h1>
	
	<%
		//쿠키객체(특정 객체)정보를 제거
		
		//기존의 쿠키정보를 가져오기
		Cookie[] cookies = request.getCookies();
	
		//쿠키배열에 내가만든 쿠키가 있는지 없는지 체크
		if(cookies != null){
			for(int i = 0; i < cookies.length; i++){
				if(cookies[i].getName().equals("cookieName")){
					//-> 내가만든 쿠키
					// 해당쿠키가 있따면 쿠키정보를 제거
					cookies[i].setMaxAge(0);//기간설정 0
					// 다시 클라이언트에게 전달
					response.addCookie(cookies[i]);
				}
			}
		}
		// 페이지 이동
	%>
	<script type="text/javascript">
		alert("쿠키정보 삭제완료!");
		location.href='cookieTest.jsp';
	</script>
</body>
</html>
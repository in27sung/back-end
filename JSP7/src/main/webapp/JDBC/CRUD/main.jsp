<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>main.jsp</h1>
	
	<h2> 아이티윌 Main page </h2>
	
	<!-- 사용자가 로그린읠 성공했을 시  
	ID님 환영합니다! 화면에 출력 -->
	<% 
	String id = (String)session.getAttribute("id");
	
	if (id == null){ 
		// 로그인 정보 없음
		System.out.print("로그인 정보 없음 -> 로그인 페이지로 이동");
		//페이지 이동
		response.sendRedirect("loginForm.jsp");
	}
	
	%>
	
	<%=session.getAttribute("id")%>님 환영합니다! 
	<hr>
	<input type="button" value="Logout" onclick="location.href='logout.jsp'">
	
	<h2><a href="info.jsp">회원정보 조회(Personal information)</a></h2>
	
	<h2><a href="updateForm.jsp">회원정보 수정(Edit account)</a></h2>
	
	<h2><a href="deleteForm.jsp">회원정보 삭제(Delete account)</a></h2>
	
	<%
	// JSP(Java), HTML, JavaScirpt 각각의 동작을 모두 실행후에 처리
	if(id != null){ //데이터가 존재 하는지 아닌지 확인 필수
		
		if(id.equals("admin")){// null과 비교 불가 조건식을 통과하지 못함 
	%>
		<!-- admin(관리자) 아이디로 로그인 했을때만 메뉴 사용가능  -->
		<script type="text/javascript">
			alert("Signed in admin account");
		</script>
		<h2><a href="list.jsp">관리자 - 회원목록(List)</a></h2>
	<%
		}
	}
	%>
	
	
	</body>
</html>
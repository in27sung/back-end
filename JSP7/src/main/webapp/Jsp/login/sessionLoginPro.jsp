<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionLoginPro.jsp</h1>
	<%
		//폼태그를 post방식으로 전송시
		//폼태그의 데이터는 parameter 형태로만 받을 수 있고 String type이다.
		//한글처리 인코딩 필수
		request.setCharacterEncoding("UTF-8");
	
		//전달된 아이디, 비밀번호를 저장
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
	%>
	
	<h2>User ID: <%=id %></h2>
	<h2>User Password: <%out.println(pw);%></h2>
	
	<%
		String DBID = "admin";
		String DBPW = "1234";
		// 사용자 로그인 여부 체크
		// 아이디 -  			O			or 			X
		//				비밀번호 비교				회원정보(아이디) 없음
		//			  O			 x
		//			로그인o		로그인x
		
// 		if(id.equals(DBID) && pw.equals(DBPW)){
// 			System.out.println("로그인");
// 		}
// 		else if(id.equals(DBID)){
// 			System.out.println("아이디 있음");
// 		}
// 		else if(pw.equals(DBPW)){
// 			System.out.println("비밀번호 있음");
// 		}else{
// 			System.out.println("아이디 혹은 비밀번호 불일치");
// 		}
		if(id.equals(DBID)){
			System.out.println("아이디 있음");
			if(pw.equals(DBPW)){
				System.out.println("비밀번호 일치");
				System.out.println("로그인 성공");
				//사용자의 아이디정보를 세션 영역에 저장 공유
				session.setAttribute("id", id);
				//로그인 성공 후 메인페이지로 이동
				response.sendRedirect("sessionMain.jsp");
			}
			else{
				System.out.println("비밀번호 다름");
				System.out.println("로그인 실패");
				response.sendRedirect("sessionLogin.jsp");
			}
		}
		else{
			System.out.println("아이디 없음");
			System.out.println("로그인 실패");
			//response.sendRedifect("sessionLogin.jsp");
			%>
			<script type="text/javascript">
				alert("회원정보가 없습니다!");
				histroy.back();
			</script>
			<% 
		}
	%>
</body>
</html>
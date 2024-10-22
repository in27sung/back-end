<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>scopePro.jsp</h1>
	<h2>전달받은 정보(parameter)</h2>
	<%
		String id = request.getParameter("id");
	%>
	
	<h2>사용자 아이디: <%=id %></h2>
	
	<hr>
	<h2>영역의 범위가 커짐 page &lt; request &lt; session &lt; application </h2>
	<h2>영역객체 사용</h2>
	
	<% 
		// 영역객체를 생성
		pageContext.setAttribute("p", "pageContext value"); //("이름", "값")
		request.setAttribute("r", "request value");
		session.setAttribute("s", "session value");
		application.setAttribute("a", "application value");
	%>
	
	pageContext 내장객체 값: <%=pageContext.getAttribute("p") %> <br> <!-- set한 곳에서만 쓸 수 있음 -->
 	request 내장객체 값: <%=request.getAttribute("r") %> <br>
 	session 내장객체 값: <%=session.getAttribute("s") %> <br>
 	application 내장객체 값: <%=application.getAttribute("a") %> <br>
 	
 	<br>
 	
 	<h1> HTML(a tag)이동 - Parameter, session, application data 전달가능</h1>
 	
 	<a href="scopeAction.jsp?id=<%=id%>&pw=1234">scopeAction.jsp 페이지로 이동</a> <!-- hypertext reference(href) -->
	
	<h1> JavaScript 이동 -</h1>
	<script type="text/javascript">
		alert("JS사용해서 페이지 이동!");
		location.href="scopeAction.jsp?id=<%=id%>&pw=javascript"; 
		// ?form name= &lt; %= &rt; variable name% 
	</script>
	
	<h1> JSP 이동 - Parameter, session, application 데이터 전달가능</h1>
	<%
		//response.sendRedirect("scopeAction.jsp?id=" + id + "&pw = JSP");
	%>
	<h2>* JSP 페이지에서는 코드를 실행하는 순서가 지정되어 있음 <br>
		JAVA(JSP) -> html -> javascript <br>
		* JSP/Javascript를 사용하는 페이지이동은 동시에 사용x
	</h2>
	
	<h1> 액션태그(jsp:forward~)이동 parameter, request, session, application 데이터 전달가능</h1>
	
	<jsp:forward page="scopeAction.jsp?id=<%=id %>&pw=actionTag"/> 
	
	<h2>forward이동방식(forwarding) 특징
		1) request영역의 데이터를 전달가능 <br>
		2) 주소의 변경x, 화면데이터만 변경
	</h2>
</body>
</html>
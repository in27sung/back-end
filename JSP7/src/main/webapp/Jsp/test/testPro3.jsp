<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>testPro3.jsp</h1>
	<%
		// 인코딩 한글처리 (POST)
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
// 		String hobby = request.getParameter("hobby"); 
		String[] hobby = request.getParameterValues("hobby");
		
	%>
		<h2> 사용자 이름: <%=name %></h2>
		<h2> 사용자 나이: <%=age %></h2>
		<h2> 사용자 성별: <%=gender %></h2>
<%-- 		<h2> 사용자 취미: <%=hobby %></h2> --%>
	<%
// 		if(hobby != null){
// 		for(int i = 0; i < hobby.length; i++){
	%>
<%-- 			<h2> 사용자 취미<%=i+1 %>: <%=hobby[i]%></h2> --%>
	<%
// 			}
// 		}
	%>
	<h2>
		사용자 취미:
			<%
				if(hobby != null){
				for(int i = 0; i < hobby.length; i++){
					if(i == hobby.length - 1){
						out.print(hobby[i] + " ");
					}else{
						out.print(hobby[i] + ", ");
						}
					}
				}
			%>
	</h2>
		

</body>
</html>
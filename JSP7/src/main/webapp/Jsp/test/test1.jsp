<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test1.jsp</h1>
	
	<!--out.println("<h2> 서블릿 코드 내용</h2>"); -->	
	<!-- HTML 주석문 -->
	<h3> Servlet: Java code로 작성된 웹 페이지</h3>
	
	<h3> JSP(Java Server Page): HTML(JavaScript) + JAVA </h3>
	
	<script type="text/javascript">
		//JS코드 작성
		/* JS 주석문 */
	</script>

	<%-- JSP 주석문 --%>
		
	<%
		// JSP 코드(JAVA 코드)사용가능
		// JAVA 주석문 
		// 내용을 확인할 수 없음 
	%>
	
	<%!
		// 선언문 (전체 변수)
		int a;
	%>
	
	<%
		// 스크립틀릿(Scriptlet) - 주로 사용 (local variable)
		int b;
		int c;
		//서블릿 
	%>
	
	<%=100 %> <!-- 표현식(화면에 보이는 것) -->
	
	<%
		// 스크립틀릿(퍼센트태그)
		
		// 배열
		// var strArr = new Arrary(3); - JS
		String[] strArr = new String[3]; // JAVA
		
		strArr[0] = "JSP"; 
		strArr[1] = "JavaScript"; 
		strArr[2] = "JAVA";
		
		System.out.print(strArr[0]);
		out.print(strArr[0]); // JAVA -> HTML(화면) 전달 출력
		
		for(int i = 0; i < strArr.length; i++){
			out.print(strArr[i] + "<br>"); // JAVA -> HTML(화면) 전달 출력
		}
		//JSP(Java)
	%> 
	<!-- HTML -->
	<%
		//JSP(java)
		for(int i = 0; i < 3; i++){
	%>
			<!-- HTML -->
			<!-- <h2> 안녕하세요! </h2> -->	
			<%=strArr[i] %>	
	<%
		}
	
	%>
	
	
	
	<!-- 동적데이터(dynamic programming language)처리: DB에 있는 데이터 정보를 브라우저에 띄움 -->
</body>
</html>	
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>exFileUploadPro.jsp</title>
</head>
<body>
	<%
		// 1. 파일이 업로드 되는 장소(폴더)를 생성
		// -> /webapp/upload 폴더 생성 
		
		// 2. 파일이 저장되는 장소의 정보를 저장 
		String realPath = request.getRealPath("/upload");
		System.out.println(realPath);
		// 폴더경로: /Users/Insung/git/MVC/MVC7/src/main/webapp/upload << 파일이 저장되면 안됨 
		// 실제경로: /Users/Insung/workspace_jsp7/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/MVC7/upload
		
		// 3. 업로드될 파일의 크기
		int maxSize = 5 * 1024 * 1024; // 5MB
		
		// 4. 파일 업로드 (파일업로드 객체 생성)
		// cos.jar file에 잇음
		MultipartRequest multi = 
		new MultipartRequest(
				request, // 파일저장위치
				realPath, // 파일저장 크기
				maxSize, // 인코딩
				"UTF-8",
				new DefaultFileRenamePolicy() // 중복파일 이름을 처리 
				);
		System.out.println("MultipartRequest 객체 생성");
		System.out.println("파일 업로드 성공");
		
		
		
	%>
	<hr>
	<h2> 전달된 정보 출력 </h2>
	
<%-- 	<h3>이름: <%=request.getParameter("name") %></h3> --%>
	<h3>이름: <%=multi.getParameter("name") %></h3>
	
	<h3>전화번호: <%=multi.getParameter("tel") %></h3>
	
<%-- 	<h3>파일명: <%=multi.getParameter("file") %></h3> --%>
	<!-- 실제 서버에 저장된 파일 이름 -->
	<h3>파일명: <%=multi.getFilesystemName("file")%></h3>
	<!-- 원본 파일 이름 -->
	<h3>파일명: <%=multi.getOriginalFileName("file")%></h3>
	
	
	<hr>
	<hr>
		
	<h2> 파일 다운로드 </h2>
	
	<h3><a href="exFileDown.jsp?fileName=<%=multi.getFilesystemName("file")%>">파일다운로드 처리(JSP)</a></h3>
	
	
	<!-- 업로드된 파일의 정보에 접근해서 처리(가져오기) -->
<%-- 	<a href="../upload/<%=multi.getFilesystemName("file")%>"> --%>
<%-- 	<%=multi.getOriginalFileName("file")%>e --%>
<!-- 	</a> -->
	<a href="../upload/<%=multi.getFilesystemName("file")%>"
		download>
	<%=multi.getOriginalFileName("file")%>
	</a>
	
	<hr>
	<img src="../upload/<%=multi.getFilesystemName("file")%>">
	
	
	
</body>
</html>
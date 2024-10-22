<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/updateBoard.jsp</title>
</head>
<body>
	<h2>게시판 글 수정</h2>
	dto: ${dto}<hr>
	pageNum: ${pageNum}<hr>
	
		<c:if test="${!empty sessionScope.id && id.equals(dto.name)}">
			
		</c:if>
		
		<fieldset>
		<legend> 글수정 </legend>
		<form action="./BoardUpdatePro.bo?pageNum=${param.pageNum}" method="post">
			<!-- 글번호 bno 저장 -->
			<input type="hidden" name="bno" value="${dto.bno}">
			작성자: <input type="text" name="name" value="${dto.name}"> <br>
			비밀번호: <input type="password" name="pass"> <br>
			제목: <input type="text" name="subject" value="${dto.subject}"> <br>
			내용: <br>
			<textarea rows="10" cols="60" name="content">${dto.content}</textarea>
			
			<hr>
			<input type="submit" value="수정하기">
		</form>
	</fieldset>	
</body>
</html>
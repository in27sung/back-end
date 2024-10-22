<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/boardContents.jsp</title>
</head>
<body>
	<h2> 글 본문내용</h2>
	<h2> 로그인한 사용자 아이디: ${sessionScope.id}</h2>
	
<%-- 	${requestScope.dto} --%>
	
	<table border="1">
	<tr>
		<td>글번호</td>
		<td>${dto.bno}</td>
		<td>조회수</td>
		<td>${dto.readcount}</td>
	</tr>
	<tr>
		<td>작성자</td>
		<td>${dto.name}</td>
		<td>작성일</td>
		<td>${dto.date}</td>
	</tr>
	<tr>
		<td>글 제목</td>
		<td colspan="3">${dto.subject}</td>
	</tr>
	<tr>
		<td>첨부파일</td>
		<td colspan="3">
			<a href="./upload/${dto.file}" download>${dto.file}</a>
		</td>
	</tr>
	<tr>
		<td>글 내용</td>
		<td colspan="3">${dto.content}</td>
	</tr>
	<tr>
		
		<td colspan="4">
		<!-- 로그인한 사용자의 아이디와 작성자 이름이 같으면 보여주기 -->
		<c:if test="${!empty sessionScope.id && id.equals(dto.name)}"> <!-- null은 null 비교 불가 -->
			<input type="button" value="수정하기" 
				   onclick="location.href='./BoardUpdate.bo?bno=${dto.bno}&pageNum=${param.pageNum}';">
			<input type="button" value="삭제하기"
				   onclick="location.href='./BoardDelete.bo?bno=${dto.bno}&pageNum=${param.pageNum}';">
		</c:if>
			<input type="button" value="답글쓰기"
				   onclick="location.href='./BoardReWrite.bo?bno=${dto.bno}&pageNum=${param.pageNum}&re_ref=${dto.re_ref}&re_lev=${dto.re_lev}&re_seq=${dto.re_seq}';">
			<!-- 리스트 페이지로 이동할때 기존의 페이지로 이동 -->
			<input type="button" value="목록으로" 
				   onclick="location.href='./BoardList.bo?pageNum=${param.pageNum}';"> <!-- 현재주소의 잇는 파라미터 정보를 가져옴  -->
		</td>
	</tr>
	</table>
</body>
</html>
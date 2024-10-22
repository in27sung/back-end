<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board List</title>
<!-- <link href="board/boardStyle.css" rel="stylesheet"> -->
<link href="board/boardList.css" rel="stylesheet">
</head>
<body>
	<div id="container">
	<header>
		<h1>게시판 목록</h1>
	</header>
	<%-- 	${requestScope.boardList} --%>
	<nav>
		<input type="button" onclick="location.href='./Main.me';" value="Main page">
		<input type="button" onclick="location.href='./BoardWrite.bo';" value="Write board">
		<input type="button" onclick="location.href='./BoardFileWrite.bo';" value="File upload">
	</nav>
		<hr>
<!-- 		<a href="./Main.me">메인페이지</a> -->
<!-- 		<a href="./BoardWrite.bo">새 글쓰기</a> -->

	<table border="1">
		<tr>
			<td>글번호</td>
			<td>글제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
			<td>IP address</td>
		</tr>
		<c:forEach var="dto" items="${boardList}">
			<!-- items=갯수 -->
			<tr>
				<td>${dto.bno}</td>
				<td>
				<c:if test="${dto.re_lev > 0}">
				<img src="./board/level.gif" width="${dto.re_lev * 10}">
				<img src="./board/re.gif">
				</c:if>
				<a href="./BoardContents.bo?bno=${dto.bno}&pageNum=${pageNum}">${dto.subject}</a>
				<c:if test="${!empty dto.file}">
					<img src="./board/diskette.png" width="15">
				</c:if>
				</td>
				<td>${dto.name}</td>
				<td>${dto.date}</td>
				<td>${dto.readcount}</td>
				<td>${dto.ip}</td>
			</tr>
		</c:forEach>
	</table>
	<p id="page-list">
	<c:if test="${count != 0}">
		<!-- 이전 -->
		<c:if test="${startPage > pageBlock}">
		<a href="./BoardList.bo?pageNum=${startPage - pageBlock}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
			<a class="list" href="./BoardList.bo?pageNum=${i}">${i}</a>
			<!-- 1 2 3 4 5 6 7 8 9 10 -->
		</c:forEach>

		<!-- 다음 -->
		<c:if test="${endPage < pageCount}">
			<a href="./BoardList.bo?pageNum=${startPage + pageBlock}">[다음]</a>
		</c:if>
	</c:if>
	<p>
	</div>
</body>
</html>
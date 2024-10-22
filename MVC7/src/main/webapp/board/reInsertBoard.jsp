<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/reInsertBoard.jsp</title>
</head>
<body>
	
	<h2> 게시판 답글쓰기 </h2>
	
	<!-- 전달해준 정보 (파라메터) 저장 & 전달-->
	<!-- bno, pageNum, re_ref, re_lev, re_seq -->
	
	
	<fieldset>
		<legend> 답글쓰기 </legend>
		<form action="./BoardReWriteAction.bo?pageNum=${param.pageNum}" method="post">
			<input type="hidden" name="bno" value="${param.bno}">
			<input type="hidden" name="re_ref" value="${param.re_ref}">
			<input type="hidden" name="re_lev" value="${param.re_lev}">
			<input type="hidden" name="re_seq" value="${param.re_seq}">
			작성자: <input type="text" name="name" value="${sessionScope.id}" readonly> <br>
			비밀번호: <input type="password" name="pass"> <br>
			제목: <input type="text" name="subject" value="[답글]"> <br>
			내용: <br>
			<textarea rows="10" cols="60" name="content"></textarea>
			
			<hr>
			<input type="submit" value="글쓰기">
		</form>
	</fieldset>	
</body>
</html>
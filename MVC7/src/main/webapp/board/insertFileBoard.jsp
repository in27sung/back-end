<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/insertFileBoard.jsp</title>
</head>
<body>
	<header>	
	<h1> 게시판 파일업로드 글쓰기 </h1>
	</header>
	<fieldset>
		<legend> 파일업로드 글쓰기 </legend>
		<form action="./BoardFileWriteAction.bo" method="post" enctype="multipart/form-data">
			작성자: <input type="text" name="name" value="${sessionScope.id}" readonly> <br>
			비밀번호: <input type="password" name="pass"> <br>
			제목: <input type="text" name="subject"> <br>
			<hr>
			첨부파일: <input type="file" name="file">
			<hr>
			내용: <br>
			<textarea rows="10" cols="60" name="content"></textarea>
			
			<hr>
			<input type="submit" value="글쓰기">
		</form>
	</fieldset>	
</body>
</html>
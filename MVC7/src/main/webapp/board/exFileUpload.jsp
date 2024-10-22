<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>exFileUpload</title>
</head>
<body>
	<h1>File Upload</h1>
	
	<fieldset>
		<legend> 파일 업로드 </legend>
		<!-- 
			1) post 방식 전달
			2) enctype="mulitpart/form-data" 속성 
			3) input-file 태그
			 
		 -->
		<form action="exFileUploadPro.jsp" method="post" enctype="multipart/form-data">
			이름: <input type="text" name="name"> <br>
			
			전화번호: <input type="text" name="tel"> <br>
			
			파일 업로드: <input type="file" name="file">
			
			<hr>
			<input type="submit" value="파일 업로드">
		</form>
	</fieldset>
	
</body>
</html>
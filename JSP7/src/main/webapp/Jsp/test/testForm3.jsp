<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

// 	function str(){
// 		for(int i = 0; i < document.forms[0].name.length; i++){
// 				if(!(document.forms[0].name[i].value > 'A' 
// 				   && document.forms[0].name[i].value < 'z')){
// 					alert("영어만 입력해주세요");
// 					document.forms[0].name.focus();
// 					return false;
// 					}
// 				}
// 		}

	function check(){
		if(document.forms[0].name.value == ""){
			alert("이름을 입력해주세요.");
			document.forms[0].name.focus();
			return false;
			}
		else if(document.forms[0].age.value == ""){
			alert("나이를 입력해주세요.");
			document.forms[0].age.focus();
			return false;
			}
		else if(document.forms[0].gender[0].checked == false && document.forms[0].gender[1].checked == false){
			alert("성별을 선택해주세요.");
			return false;
			}
		else if(document.forms[0].hobby[0].checked == false
				&& document.forms[0].hobby[1].checked == false
				&& document.forms[0].hobby[2].checked == false){
			alert("취미를 선택해주세요.");
			return false;
			}
		}
	
</script>
</head>
<body>
	<h1>testForm3.jsp</h1>
	
	<fieldset>
		<form action="testPro3.jsp" method = "get" onsubmit = "return check()">
			<img src= "https://www.racksolutions.com/news//app/uploads/AdobeStock_87909563.jpg" width="300" height="300"> <br>
			이름: <input type="text" name = "name"> <br>
			나이: <input type="number" name = "age"> <br>
			성별: <input type = "radio" name = "gender" value = "남"> 남 <!-- 이름 동일하게 사용 -->
				 <input type = "radio" name = "gender" value = "여"> 여 <br>
			<hr>
			취미: <input type = "checkbox" name = "hobby" value = "운동"> 운동
				 <input type = "checkbox" name = "hobby" value = "음악"> 음악
				 <input type = "checkbox" name = "hobby" value = "독서">	독서 
				 
			
			<input type = "submit" value = "전송"> 
		</form>
	</fieldset>
</body>
</html>
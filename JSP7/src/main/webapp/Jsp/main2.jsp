<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1>main2.jsp</h1>

    <table border="1" width="600" height="800">
        <tr>
            <td colspan="2" height="100">
                <jsp:include page="../inc/top.jsp"/>
            </td>
        </tr>
        <tr>
            <td width="100">
                <h2>SubMenu</h2>
            </td>
            <td>Contents</td>
        </tr>
        <tr>
            <td colspan="2" height="100">BOTTOM</td>
            <td></td>
        </tr>
    </table>





<!-- 동적데이터(dynamic programming language)처리: DB에 있는 데이터 정보를 브라우저에 띄움 -->
</body>
</html>	
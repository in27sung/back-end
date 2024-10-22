<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Main Page</title>
    <link rel="stylesheet" type="text/css" href="member/mainStyle.css"> <!-- Assuming external CSS file -->
</head>
<body>
    <div id="container">
        <header>
            <h1>Welcome to Member Page</h1>
			<input type="button" class="btn-logout" value="로그아웃" onclick="location.href='./MemberLogout.me';">
        </header>

        <main>
            <!-- el 표현식 사용 -->
            <!-- 사용자가 로그인을 성공했을 때만 페이지를 확인 가능 -->
            <!-- 로그인 정보가 없을 때 로그인 페이지로 이동 -->
            <!-- 로그인 정보가 있을 때 'ooo님 환영합니다!' 출력 -->
            <c:if test="${empty sessionScope.id}">
                <c:redirect url="./MemberLogin.me"/>
            </c:if>
            
            <h2 id="welcome-msg">${sessionScope.id}님 환영합니다!</h2>

<!--             <div id="main-actions"> -->
<!--                 <input type="button" class="btn" value="Logout" onclick="location.href='./MemberLogout.me';"> -->
<!--             </div> -->

            <hr>

            <nav>
                <ul>
                    <li><a class="nav-link" href="./MemberInfo.me">회원정보 조회</a></li>
                    <li><a class="nav-link" href="./MemberUpdate.me">회원정보 수정</a></li>
                    <li><a class="nav-link" href="./MemberDelete.me">회원정보 삭제</a></li>
                    <li><a class="nav-link" href="./BoardWrite.bo">게시판 글쓰기</a></li>
                    <li><a class="nav-link" href="./BoardList.bo">게시판 리스트</a></li>
                </ul>
            </nav>

            <hr>

            <c:if test="${!empty sessionScope.id && id.equals('admin')}">
                <!-- 관리자 전용 메뉴 -->
                <h3>Admin Menu</h3>
                <nav>
                    <ul>
                        <li><a class="nav-link" href="./MemberList.me">회원정보 목록</a></li>
                    </ul>
                </nav>
            </c:if>
        </main>
    </div>
</body>
</html>
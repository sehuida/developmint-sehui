<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<link rel="stylesheet" href="/resources/css/member/login.css">
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div class="container">
        <h1 style="font-weight: bold; text-align: center; color:rgb(78, 205, 196);">로그인</h1><br>
        <form action="/login.do" method="post" id="loginForm">
            <fieldset>
                <div id="login-l">
                    <img src="resources/img/logo/Develomint_logo.png" id="loginlogo">
                </div>
                <div class="form-group">
                    <label for="memberId" class="form-label mt-4">아이디</label>
                    <input type="text" class="form-control " name="memberId" id="memberId" placeholder="아이디를 입력하세요.">
                </div>
                <div class="form-group" style="padding-top: 0;">
                    <label for="memberPw" class="form-label mt-4">비밀번호</label>
                    <input type="password" class="form-control " name="memberPw" id="memberPw" placeholder="비밀번호를 입력하세요.">
                </div>
                <div class="loginBt">
                    <button type="submit" class="btn btn-primary">로그인</button>
                </div>
                <div class="loginBt">
                    <a class="btn btn-info" href="/joinFrm.do">회원가입</a>   
                </div>
                <div>
                    <a href="#">아이디찾기/비밀번호찾기</a>
                </div>
            </fieldset>
        </form>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
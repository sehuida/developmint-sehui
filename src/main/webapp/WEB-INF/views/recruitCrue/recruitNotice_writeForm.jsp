<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<link rel="stylesheet" href="/resources/css/projectTeam/writePage.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>RecruitCrue WriteForm</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container" id="projectContainer">
		<div class="main">
            <div class="returnPage">
                <a href="#"><img class="return_img" src="/resources/img/recruitTeamProject/writePage/left.png"></a>
            </div>
            <div class="main_content">
                <div class="writeBox">
                    <div class="form-group">
                        <input class="form-control form-control-lg" type="text" placeholder="모집공고 제목을 입력해주세요." id="inputLarge">
                    </div>
                    <div class="writeLine">
                        <div class="titleFlexBox">
                            <img class="iconImg" src="/resources/img/recruitTeamProject/writePage/code.png">
                            <p class="titleText">사용 언어(최대 3개 까지 선택 가능)</p>
                        </div>
                        <div class="checkboxFlexList">
                            <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
                                <input type="checkbox" class="btn-check" id="btncheck1" checked="" autocomplete="off">
                                <label class="btn btn-primary" for="btncheck1">javascript</label>
                                <input type="checkbox" class="btn-check" id="btncheck2" autocomplete="off">
                                <label class="btn btn-primary" for="btncheck2">typescript</label>
                                <input type="checkbox" class="btn-check" id="btncheck3" autocomplete="off">
                                <label class="btn btn-primary" for="btncheck3">react</label>
                                <input type="checkbox" class="btn-check" id="btncheck4" autocomplete="off">
                                <label class="btn btn-primary" for="btncheck4">vue</label>
                                <input type="checkbox" class="btn-check" id="btncheck5" autocomplete="off">
                                <label class="btn btn-primary" for="btncheck5">node.js</label>
                                <input type="checkbox" class="btn-check" id="btncheck6" autocomplete="off">
                                <label class="btn btn-primary" for="btncheck6">java</label>
                                <input type="checkbox" class="btn-check" id="btncheck7" autocomplete="off">
                                <label class="btn btn-primary" for="btncheck7">spring</label>
                            </div>
                            <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group" id="bottomCheckBox">
                                <input type="checkbox" class="btn-check" id="btncheck8" autocomplete="off">
                                <label class="btn btn-primary" for="btncheck8">swift</label>
                                <input type="checkbox" class="btn-check" id="btncheck9" autocomplete="off">
                                <label class="btn btn-primary" for="btncheck9">kotlin</label>
                                <input type="checkbox" class="btn-check" id="btncheck10" autocomplete="off">
                                <label class="btn btn-primary" for="btncheck10">c++</label>
                                <input type="checkbox" class="btn-check" id="btncheck11" autocomplete="off">
                                <label class="btn btn-primary" for="btncheck10">go</label>
                                <input type="checkbox" class="btn-check" id="btncheck12" autocomplete="off">
                                <label class="btn btn-primary" for="btncheck12">python</label>
                                <input type="checkbox" class="btn-check" id="btncheck13" autocomplete="off">
                                <label class="btn btn-primary" for="btncheck13">django</label>
                                <input type="checkbox" class="btn-check" id="btncheck14" autocomplete="off">
                                <label class="btn btn-primary" for="btncheck14">flutter</label>
                            </div>
                        </div>
                    </div>
                    <div class="line"></div>
                    <div class="writeLine">
                        <div class="titleFlexBox">
                            <img class="iconImg" src="/resources/img/recruitTeamProject/writePage/pending.png">
                            <p class="titleText">모집마감일(모집일부터 최대 14일)</p>
                        </div>
                        <ul class="nav nav-pills">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">날짜를 선택하세요</a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item">2021년 12월 23일</a>
                                    <a class="dropdown-item">2021년 12월 24일</a>
                                    <a class="dropdown-item">2021년 12월 25일</a>
                                    <a class="dropdown-item">2021년 12월 26일</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="line"></div>
                    <div class="writeLine">
                        <div class="titleFlexBox">
                            <img class="iconImg" src="/resources/img/recruitTeamProject/writePage/title.png">
                            <p class="titleText">프로젝트명</p>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="내용을 입력해주세요" id="inputDefault">
                        </div>
                    </div>
                    <div class="line"></div>
                    <div class="writeLine">
                        <div class="titleFlexBox">
                            <img class="iconImg" src="/resources/img/recruitTeamProject/writePage/goal.png">
                            <p class="titleText">프로젝트 목표(ex. 웹 페이지 정복)</p>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="내용을 입력해주세요" id="inputDefault">
                        </div>
                    </div>
                    <div class="line"></div>
                    <div class="writeLine">
                        <div class="titleFlexBox">
                            <img class="iconImg" src="/resources/img/recruitTeamProject/writePage/content-creator.png">
                            <p class="titleText">모집설명</p>
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" id="exampleTextarea" rows="3"></textarea>
                        </div>
                    </div>
                    <div class="finalLine"></div>
                    <div class="submitBtnBox">
                        <button type="button" class="btn btn-primary btn-lg">제출</button>
                    </div>
                </div>
            </div>
        </div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
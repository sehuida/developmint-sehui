<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<link rel="stylesheet" href="/resources/css/projectTeam/recruitMember.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Recruit Crue</title>
</head>
<script>
	$(function(){
	    $(".language_icon").click(function(){
	        if($(".language_icon_disabled").length == 0 ){
	            $(".language_icon").addClass("language_icon_disabled");
	            $(this).toggleClass("language_icon_disabled");
	        } else {
	            $(this).toggleClass("language_icon_disabled");
	        }
	        if($(".language_icon_disabled").length == 14){
	            $(".language_icon_disabled").removeClass("language_icon_disabled");
	        }
	    });
	
	    $(".rBox_Leftnavi_left").click(function(){
	        $(".rBox_Leftnavi_right").css("opacity", "0.5");
	        $(".rBox_Leftnavi_left").css("opacity", "1");
	    });
	    $(".rBox_Leftnavi_right").click(function(){
	        $(".rBox_Leftnavi_right").css("opacity", "1");
	        $(".rBox_Leftnavi_left").css("opacity", "0.5");
	    });
	});
</script>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container" id="projectContainer">
            <div class="main">
                <div class="languageBox">
                    <ul class="languageList">
                        <li class="languageItem">
                            <img class="language_icon" src="/resources/img/recruitTeamProject/recruitPage/javascript.png" alt="javascript">
                        </li>
                        <li class="languageItem">
                            <img class="language_icon" src="/resources/img/recruitTeamProject/recruitPage/typescript.png" alt="typescript">
                        </li>
                        <li class="languageItem">
                            <img class="language_icon" src="/resources/img/recruitTeamProject/recruitPage/react.png" alt="react">
                        </li>
                        <li class="languageItem">
                            <img class="language_icon" src="/resources/img/recruitTeamProject/recruitPage/vue.png" alt="vue">
                        </li>
                        <li class="languageItem">
                            <img class="language_icon" src="/resources/img/recruitTeamProject/recruitPage/node.js.png" alt="node.js">
                        </li>
                        <li class="languageItem">
                            <img class="language_icon" src="/resources/img/recruitTeamProject/recruitPage/java.png" alt="java">
                        </li>
                        <li class="languageItem">
                            <img class="language_icon" src="/resources/img/recruitTeamProject/recruitPage/spring.png" alt="spring">
                        </li>
                        <li class="languageItem">
                            <img class="language_icon" src="/resources/img/recruitTeamProject/recruitPage/kotlin.png" alt="kotlin">
                        </li>
                        <li class="languageItem">
                            <img class="language_icon" src="/resources/img/recruitTeamProject/recruitPage/c++.png" alt="c++">
                        </li>
                        <li class="languageItem">
                            <img class="language_icon" src="/resources/img/recruitTeamProject/recruitPage/go.png" alt="go">
                        </li>
                        <li class="languageItem">
                            <img class="language_icon" src="/resources/img/recruitTeamProject/recruitPage/python.png" alt="python">
                        </li>
                        <li class="languageItem">
                            <img class="language_icon" src="/resources/img/recruitTeamProject/recruitPage/django.png" alt="django">
                        </li>
                        <li class="languageItem">
                            <img class="language_icon" src="/resources/img/recruitTeamProject/recruitPage/flutter.png" alt="flutter">
                        </li>
                        <li class="languageItem">
                            <img class="language_icon" src="/resources/img/recruitTeamProject/recruitPage/swift.png" alt="swift">
                        </li>
                    </ul>
                    <img id="languageBox_label" src="/resources/img/recruitTeamProject/recruitPage/select_language.png"><span id="label_font1">원하는 언어를 선택해 주세요!</span>
                </div>
                <div class="main_wrap">
                    <div class="recruitBox">
                        <div class="rBox_navi">
                            <div id="left_site">
                                <div class="rBox_Leftnavi_left">
                                    <img class="rBox_navi_icon" src="/resources/img/recruitTeamProject/recruitPage/newList.png">
                                    <span class="navi_left_font">최신</span>
                                </div>
                                <div class="rBox_Leftnavi_right">
                                    <img class="rBox_navi_icon" src="/resources/img/recruitTeamProject/recruitPage/pop.png">
                                    <span class="navi_left_font">인기</span>
                                </div>
                            </div>
                            <div id="right_site">
                                <input type="checkbox" class="navi_checkbox">
                                <span class="navi_right_font">모집중인 글만 보기</span>
                                <button type="button" class="btn btn-success" id="navi_button">글 쓰기</button>
                            </div>
                        </div>
                        <div class="rListBox">
                        <c:forEach items="${list }" var="pt">
                        	<div class="contentFlexBox">
                                <div class="imgBox">
                                    <img class="myInfoImg" src="${pt.writerImgPath }">
                                </div>
                                <div class="contentBox">
                                    <div class="textFlexBox1">
                                        <div class="textContent">
                                            <p class="contentText">${pt.RTitle }</p>
                                        </div>
                                        <div class="dateType">
                                            <b>작성일 : </b><span><b>${pt.RStartDate }</b></span>
                                        </div>
                                    </div>
                                    <div class="textFlexBox2">
                                        <div></div>
                                        <div class="dateType">
                                            <b>마감일 : </b><span><b>${pt.REndDate }</b></span>
                                        </div>
                                    </div>
                                    <div class="bottomFlexBox">
                                        <div class="subImgBox">
                                            <img class="langImg" src="/resources/img/recruitTeamProject/recruitPage/python.png">
                                            <img class="langImg" src="/resources/img/recruitTeamProject/recruitPage/django.png">
                                            <img class="langImg" src="/resources/img/recruitTeamProject/recruitPage/flutter.png">
                                        </div>
                                        <div class="countBox">
                                            <img class="countImg" src="/resources/img/recruitTeamProject/recruitPage/bubble-chat.png">
                                            <span class="countText">${pt.commentCount }</span>
                                            <img class="countImg" src="/resources/img/recruitTeamProject/recruitPage/eye.png">
                                            <span class="countText">${pt.viewCount }</span>
                                            <img class="countImg" src="/resources/img/recruitTeamProject/recruitPage/full_hart.png">
                                            <span class="countText">${pt.dibCount }</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                            <div class="contentFlexBox">
                                <div class="imgBox">
                                    <img class="myInfoImg" src="/resources/img/recruitTeamProject/recruitPage/photo.png">
                                </div>
                                <div class="contentBox">
                                    <div class="textFlexBox1">
                                        <div class="textContent">
                                            <p class="contentText">포트폴리오 프로젝트 팀원 구합니다!!</p>
                                        </div>
                                        <div class="dateType">
                                            <b>작성일 : </b><span><b>2021 / 11 / 23</b></span>
                                        </div>
                                    </div>
                                    <div class="textFlexBox2">
                                        <div></div>
                                        <div class="dateType">
                                            <b>마감일 : </b><span><b>2021 / 11 / 27</b></span>
                                        </div>
                                    </div>
                                    <div class="bottomFlexBox">
                                        <div class="subImgBox">
                                            <img class="langImg" src="/resources/img/recruitTeamProject/recruitPage/python.png">
                                            <img class="langImg" src="/resources/img/recruitTeamProject/recruitPage/django.png">
                                            <img class="langImg" src="/resources/img/recruitTeamProject/recruitPage/flutter.png">
                                        </div>
                                        <div class="countBox">
                                            <img class="countImg" src="/resources/img/recruitTeamProject/recruitPage/bubble-chat.png">
                                            <span class="countText">0</span>
                                            <img class="countImg" src="/resources/img/recruitTeamProject/recruitPage/eye.png">
                                            <span class="countText">0</span>
                                            <img class="countImg" src="/resources/img/recruitTeamProject/recruitPage/full_hart.png">
                                            <span class="countText">0</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
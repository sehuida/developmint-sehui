<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<link rel="stylesheet" href="/resources/css/projectTeam/manageEntry.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Manage Entry</title>
</head>
<script>
    $(function(){
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
            <div class="returnPage">
                <a href="#"><img class="return_img" src="/resources/img/recruitTeamProject/writePage/left.png"></a>
            </div>
            <div class="main_wrap">
                <div class="titleFlexBox">
                    <img class="iconImg" src="/resources/img/recruitTeamProject/common/recruitment.png">
                    <p class="titleText">지원자 관리</p>
                </div>
                <div class="Line"></div>
                <div class="recruitBox">
                    <div class="rBox_navi">
                        <div id="left_site">
                            <div class="rBox_Leftnavi_left">
                                <img class="rBox_navi_icon" src="/resources/img/recruitTeamProject/recruitPage/newList.png">
                                <span class="navi_left_font">최신</span>
                            </div>
                            <div class="rBox_Leftnavi_right">
                                <img class="rBox_navi_icon" src="/resources/img/recruitTeamProject/common/top-three.png">
                                <span class="navi_left_font">랭크 순으로</span>
                            </div>
                        </div>
                        <div id="right_site">
                            <b id="rightFont">선발 가능 인원 : </b><span class="navi_right_font">0 / 6</span>
                        </div>
                    </div>
                    <div class="rListBox">
                        <div class="contentFlexBox">
                            <div class="imgBox">
                                <img class="myInfoImg" src="/resources/img/recruitTeamProject/recruitPage/photo.png">
                            </div>
                            <div class="contentBox">
                                <div class="textFlexBox1">
                                    <div class="textContent">
                                        <p class="contentText">목표가 있다면 두려워 하지말자 !!</p>
                                    </div>
                                    <div class="dateType">
                                        <b>지원일 : </b><span><b>2021 / 11 / 23</b></span>
                                    </div>
                                </div>
                                <div class="bottomFlexBox">
                                    <div class="mSubImgBox">
                                        <img class="langImg" src="/resources/img/recruitTeamProject/recruitPage/python.png">
                                        <img class="langImg" src="/resources/img/recruitTeamProject/recruitPage/django.png">
                                        <img class="langImg" src="/resources/img/recruitTeamProject/recruitPage/flutter.png">
                                    </div>
                                    <div class="rankImg">
                                        <img class="lankImg" src="/resources/img/recruitTeamProject/common/rank/grand_master.png">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="btnBox">
                            <button type="button" class="btn btn-secondary">탈락</button>
                            <button type="button" class="btn btn-primary">선발</button>
                        </div>
                        <div class="contentFlexBox">
                            <div class="imgBox">
                                <img class="myInfoImg" src="/resources/img/recruitTeamProject/recruitPage/photo.png">
                            </div>
                            <div class="contentBox">
                                <div class="textFlexBox1">
                                    <div class="textContent">
                                        <p class="contentText">목표가 있다면 두려워 하지말자 !!</p>
                                    </div>
                                    <div class="dateType">
                                        <b>지원일 : </b><span><b>2021 / 11 / 23</b></span>
                                    </div>
                                </div>
                                
                                <div class="bottomFlexBox">
                                    <div class="mSubImgBox">
                                        <img class="langImg" src="/resources/img/recruitTeamProject/recruitPage/python.png">
                                        <img class="langImg" src="/resources/img/recruitTeamProject/recruitPage/django.png">
                                        <img class="langImg" src="/resources/img/recruitTeamProject/recruitPage/flutter.png">
                                    </div>
                                    <div class="rankImg">
                                        <img class="lankImg" src="/resources/img/recruitTeamProject/common/rank/diamond.png">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="btnBox">
                            <button type="button" class="btn btn-secondary">탈락</button>
                            <button type="button" class="btn btn-primary">선발</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<link rel="stylesheet" href="/resources/css/projectTeam/recruitDetail.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>apply content detail</title>
</head>
<script>

	$(function(){
		$(".return_img").click(function(){
			location.href="/recruitTeamMember_mainPage.do?reqPage=1";
		});
		
		$("#updateComment").click(function(){
			$("#updateTextBox").css("display", "block");
		});
		$("#cancelBtn1").click(function(){
			$("#updateTextBox").css("display", "none");
		});
		
		$("#insertReComment").click(function(){
			/* $("#reCommentTextBox").css("display", "block"); */
			$("#reCommentTextBox").show();
		});
		
		$("#cancelBtn2").click(function(){
			/* $("#reCommentTextBox").css("display", "none"); */
			$("#reCommentTextBox").hide();
		});
		
		$("#updateReComment").click(function(){
			$("#updateReCommentTextBox").show();
		});
		$("#cancelBtn3").click(function(){
			$("#updateReCommentTextBox").hide();
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
                <div class="titleBox">
                    <p class="titleText">목표가 있다면 두려워하지 말자!</p>
                </div>
                <div class="noticeInfoFlexBox">
                    <div class="memberInfo">
                        <img class="profileImg" src="/resources/img/recruitTeamProject/common/user.png">
                        <p class="memberIdText">MemberId</p>
                        <img class="rankImg" src="/resources/img/recruitTeamProject/common/rank/diamond.png">
                    </div>
                    <div class="writeDate">
                        <b>2021 / 11 / 23</b>
                    </div>
                </div>
                <div class="noticeInfoFlexBox2">
                    <div class="userLanguage">
                        <b class="useLang">사용 언어 : </b>
                        <span class="badge rounded-pill bg-primary" id="languageIcon">node.js</span>
                        <span class="badge rounded-pill bg-primary" id="languageIcon">react</span>
                        <span class="badge rounded-pill bg-primary" id="languageIcon">javascript</span>
                    </div>
                </div>
                <div class="line"></div>
                <div class="datailContent">
                    	뽑아줘
                </div>
                <div class="bottomContentFlexBox">
                    <div class="bottomContentFlexBox_btnBox">
                        <button type="button" class="btn btn-primary">수정</button>
                        <button type="button" class="btn btn-primary">삭제</button>
                        <button type="button" class="btn btn-primary">선발</button>
                        <button type="button" class="btn btn-primary">탈락</button>
                    </div>
                </div>
            </div>
        </div>
		
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
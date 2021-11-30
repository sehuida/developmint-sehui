<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공모전 게시판</title>
<!-- Add the slick-theme.css if you want default styling -->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<!-- Add the slick-theme.css if you want default styling -->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
</head>
<style>

.titleBox{
overflow: hidden;
}
#mainTitel{
	font-size: 40px;
	font-weight: bold;
	text-align: center;
	margin-bottom: 30px;
	float: left;
}
.titleBox>a{
	margin-top:15px;
	float: right;
	width: 150px;
	height: 50px;
	background-color: #4ECDC4;
	font-size: 19px;
	font-weight: bold;
	line-height: 40px;
}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container" style="margin-bottom:100px;" >
	
	<div class="titleBox">
		<p id="mainTitel">공모전 게시판</p>
		<a class="btn btn-primary" href="/insertContestFrm.do">공모등록</a>
	</div>
	<%-- 메인 포스터 3개 슬라이드 --%>
	<div class="slideContest" style="margin-left:80px;">
		  <div><img src="/resources/img/contest/contestMainImg1.png"></div>
		  <div><img src="/resources/img/contest/contestMainImg2.png"></div>
		  <div><img src="/resources/img/contest/contestMainImg3.png"></div>
	</div>
		
		
		
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	
	
	
	
	
	
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<script>
	//슬릭슬라이드
	$('.slideContest').slick({
		dots : true,				//점 표시
		autoplay : true,			//자동슬라이드
		autoplaySpeed : 5000, 		//자동슬라이드 시간
		pauseOnHover : true,		//자동슬라이스 시 마우스 호버하면 멈춤
		dotsClass : "slick-dots",	//점 css
		draggable : true			//이게뭐더라 밀어서 넘기는거?
	});
	</script>
</body>
</html>
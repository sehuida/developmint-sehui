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

</style>
<body>

	<%@include file="/WEB-INF/views/common/header.jsp"%>
	
	<div class="container" style="margin-bottom:100px; " >
		<%-- 메인 포스터 3개 슬라이드 --%>
		<div class="slideContest" style="margin-left:100px;">
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
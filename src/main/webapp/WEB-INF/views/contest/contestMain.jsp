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
.mainTitel{
	font-size: 30px;
	font-weight: bold;
	text-align: center;
	margin-bottom: 30px;
	float: left;
}
.subTitel{
	font-size: 30px;
	font-weight: bold;
	text-align: center;
	margin-bottom: 30px;
	margin-top:50px;
}
.subEngTitel{
	font-size: 30px;
	font-weight: bold;
	text-align: center;
	margin-bottom: 30px;
	color:#4ECDC4;
	margin-top:50px;
}
.titleBox>a{
	
	float: right;
	width: 150px;
	height: 50px;
	background-color: #4ECDC4;
	font-size: 19px;
	font-weight: bold;
	line-height: 35px;
}
.newContestBox{
	margin-top:30px;
	margin-left: 10px;
	overflow: hidden;
	
}
.newContestBox>div{
	float: left;
	margin-bottom: 30px;
}
.newTitle{
	font-size: 20px;
	font-weight: bold;
	margin-top: 8px;
}
.newcontent{
	margin: 0;
}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container" style="margin-bottom:100px;" >
	
	<div class="titleBox">
		<p class="mainTitel">공모전 게시판</p>
		<a class="btn btn-primary" href="/insertContestFrm.do">공모등록</a>
	</div>
	<%-- 메인 포스터 3개 슬라이드 --%>
	<div class="slideContest" style="margin-top: 50px; margin-left:80px; margin-bottom: 100px;">
		  <div><img src="/resources/img/contest/contestMainImg1.png"></div>
		  <div><img src="/resources/img/contest/contestMainImg2.png"></div>
		  <div><img src="/resources/img/contest/contestMainImg3.png"></div>
	</div>
	
	<div>
		<span class="subEngTitel">NEW</span> <span class="subTitel">최신 공모전</span>
	</div>
	<div class="newContestBox">
		<c:forEach begin="0" end="7">
		<div>
			<a href="/contestView.do"><img src="/resources/img/contest/contest_test.png" width="300px" height="350px" style="margin-right: 20px; margin-top: 20px;"></a>
			<p class="newTitle">스마트 톡톡 공모전</p>
			<p class="newcontent">주최 : 부산대학교</p>
			<p class="newcontent">기간 : 2021-12-01 ~ 2021-12-31</p>
		</div>
		</c:forEach>
	</div>
		
	<div  style="margin-top: 100px;">
		<span class="subEngTitel">HOT</span> <span class="subTitel">인기 공모전</span>
	</div>
	<div class="newContestBox" >
		<c:forEach begin="0" end="3">
		<div>
			<img src="/resources/img/contest/contest_test.png" width="300px" height="350px" style="margin-right: 15px; margin-top: 20px;">
			<p class="newTitle">스마트 톡톡 공모전</p>
			<p class="newcontent">주최 : 부산대학교</p>
			<p class="newcontent">기간 : 2021-12-01 ~ 2021-12-31</p>
		</div>
		</c:forEach>
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
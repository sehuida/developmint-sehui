<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
	line-height: 38px;
}
.newContestBox{
	margin-top:30px;
	margin-left: 55px;
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
		  <div><a href="/contestView.do?contestNo=23"><img src="/resources/img/contest/contestMainImg1.png"></a></div>
		  <div><a href="/contestView.do?contestNo=21"><img src="/resources/img/contest/contestMainImg2.png"></a></div>
		  <div><a href="/contestView.do?contestNo=22"><img src="/resources/img/contest/contestMainImg3.png"></a></div>
	</div>
	
	<%-----공모 신청처리 페이지 완성되면 <c:if test="nc.contestStatus == 2> 추가 예정(처리완료된 공모전만 띄우기)"---- --%>
	
	<div>
		<span class="subEngTitel">NEW</span> <span class="subTitel">최신 공모전</span>
	</div>
	<%-- 최신 공모전 리스트 --%>
	<div class="newContestBox">
		<c:forEach var="nc" items="${list.newContest }">
		<div>
			<%--공모전 이미지 --%>
			<a href="/contestView.do?contestNo=${nc.contestNo }"><img src="/resources/img/contest/${nc.contestImg }" width="280px" height="400px" style="margin-right: 30px; margin-top: 20px;"></a>
			<%--공모전 제목(제목이 18글자가 넘어가면 뒤에는 ...으로 표시 --%>
			<c:choose>
				<c:when test="${fn:length(nc.contestTitle) > 18}">
					<c:set var="subTitle" value="${fn:substring(nc.contestTitle,0,18)}"/>
					<p class="newTitle">${subTitle }...</p>
				</c:when>
				<c:otherwise>
					<p class="newTitle">${nc.contestTitle }</p>
				</c:otherwise>
			</c:choose>
			
			<p class="newcontent">주최 : ${nc.contestHost }</p>
			<p class="newcontent">기간 : ${nc.contestDate } ~ ${nc.contestDeadline }</p>
		</div>
		</c:forEach>
	</div>
		
	<div  style="margin-top: 100px;">
		<span class="subEngTitel">HOT</span> <span class="subTitel">인기 공모전</span>
	</div>
	<%-- 인기 공모전 리스트 --%>
	<div class="newContestBox">
		<c:forEach var="hc" items="${list.hotContest }">
		<div>
			<%--공모전 이미지 --%>
			<a href="/contestView.do?contestNo=${hc.contestNo }"><img src="/resources/img/contest/${hc.contestImg }" width="280px" height="400px" style="margin-right: 30px; margin-top: 20px;"></a>
			<%--공모전 제목(제목이 18글자가 넘어가면 뒤에는 ...으로 표시 --%>
			<c:choose>
				<c:when test="${fn:length(hc.contestTitle) > 18}">
					<c:set var="subTitle" value="${fn:substring(hc.contestTitle,0,18)}"/>
					<p class="newTitle">${subTitle }...</p>
				</c:when>
				<c:otherwise>
					<p class="newTitle">${hc.contestTitle }</p>
				</c:otherwise>
			</c:choose>
			
			<p class="newcontent">주최 : ${hc.contestHost }</p>
			<p class="newcontent">기간 : ${hc.contestDate } ~ ${hc.contestDeadline }</p>
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
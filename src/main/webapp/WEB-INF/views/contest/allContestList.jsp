<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공모전 전체보기</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
</head>
<style>
	.titleBox{
		font-size: 30px;
		font-weight: bold;
	}
	.cateBox{
		text-align: center;
		margin-top: 50px;
	}
	.cateBox>a{
		text-decoration: none;
		color : #595959;
		font-size: 22px;
		margin-right: 20px;
	}
	.contestBox{
		margin-top:80px;
		margin-left: 55px;
		overflow: hidden;
		
	}
	.contestBox>div{
		float: left;
		margin-bottom: 30px;
	}
	.contestTitle{
		font-size: 20px;
		font-weight: bold;
		margin-top: 8px;
	}
	.contestContent{
		margin: 0;
	}
	.contestImgBox{
		width: 280px;
		height: 400px;
		overflow: hidden;
		margin-right: 30px;   
	}
	.contestImgBox img{
	   height:100%;
	   width: 100%;
	   object-fit:cover;   
	   transform:scale(1.0);        
	   transition: transform .5s; 
	}
	.contestImgBox img:hover{ 
	   transform:scale(1.1);
	   transition: transform .5s;
	}
	#pageNavi{
		margin-top: 50px;
	}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container" style="margin-bottom:100px;">
		<div class="titleBox">
			<a href="/contestMain.do"><i class="bi bi-chevron-left"></i></a><span>공모전 전체보기</span>
		</div>
		<%--카테고리 선택 --%>
		<div class="cateBox">
			<c:choose>
				<c:when test="${type == 0 }">
					<a href="/allContestList.do?reqPage=1&type=0" style="color : #4ECDC4; font-weight: bold"><i class="bi bi-list-ul"></i> 전체</a>
					<a href="/allContestList.do?reqPage=1&type=1"><i class="bi bi-lightbulb"></i> 기획</a>
					<a href="/allContestList.do?reqPage=1&type=2"><i class="bi bi-gear"></i> 개발</a>
					<a href="/allContestList.do?reqPage=1&type=3"><i class="bi bi-palette"></i> 디자인</a>
				</c:when>
				<c:when test="${type == 1 }">
					<a href="/allContestList.do?reqPage=1&type=0"><i class="bi bi-list-ul"></i> 전체</a>
					<a href="/allContestList.do?reqPage=1&type=1" style="color : #4ECDC4; font-weight: bold"><i class="bi bi-lightbulb"></i> 기획</a>
					<a href="/allContestList.do?reqPage=1&type=2"><i class="bi bi-gear"></i> 개발</a>
					<a href="/allContestList.do?reqPage=1&type=3"><i class="bi bi-palette"></i> 디자인</a>
				</c:when>
				<c:when test="${type == 2 }">
					<a href="/allContestList.do?reqPage=1&type=0"><i class="bi bi-list-ul"></i> 전체</a>
					<a href="/allContestList.do?reqPage=1&type=1"><i class="bi bi-lightbulb"></i> 기획</a>
					<a href="/allContestList.do?reqPage=1&type=2" style="color : #4ECDC4; font-weight: bold"><i class="bi bi-gear"></i> 개발</a>
					<a href="/allContestList.do?reqPage=1&type=3"><i class="bi bi-palette"></i> 디자인</a>
				</c:when>
				<c:when test="${type == 3 }">
					<a href="/allContestList.do?reqPage=1&type=0"><i class="bi bi-list-ul"></i> 전체</a>
					<a href="/allContestList.do?reqPage=1&type=1"><i class="bi bi-lightbulb"></i> 기획</a>
					<a href="/allContestList.do?reqPage=1&type=2"><i class="bi bi-gear"></i> 개발</a>
					<a href="/allContestList.do?reqPage=1&type=3" style="color : #4ECDC4; font-weight: bold"><i class="bi bi-palette"></i> 디자인</a>
				</c:when>
			</c:choose>
		</div>
		<%--공모전 정보 --%>
		<div class="contestBox">
			<c:forEach var="nc" items="${list }">
			<div>
				<%--공모전 이미지 --%>
				<div class="contestImgBox">
					<a href="/contestView.do?contestNo=${nc.contestNo }"><img src="/resources/img/contest/${nc.contestImg }"></a>
				</div>
				<%--공모전 제목(제목이 16글자가 넘어가면 뒤에는 ...으로 표시 --%>
				<c:choose>
					<c:when test="${fn:length(nc.contestTitle) > 16}">
						<c:set var="subTitle" value="${fn:substring(nc.contestTitle,0,16)}"/>
						<p class="contestTitle">${subTitle }...</p>
					</c:when>
					<c:otherwise>
						<p class="contestTitle">${nc.contestTitle }</p>
					</c:otherwise>
				</c:choose>
				
				<p class="contestContent">주최 : ${nc.contestHost }</p>
				<p class="contestContent">기간 : ${nc.contestDate } ~ ${nc.contestDeadline }</p>
			</div>
			</c:forEach>
		</div>
		<div id="pageNavi" style="text-align: center" >${pageNavi }</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
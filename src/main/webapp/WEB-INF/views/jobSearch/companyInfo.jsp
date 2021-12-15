<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업소개</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5b0b0a9f222f0ab356e278f15c5fdc64"></script>
</head>
<style>
	.contain{
		width: 1000px;
		margin: 0 auto;
		margin-top: 50px;
		margin-bottom: 50px;
	}
	.companyInfoHeader{
		width: 1000px;
		margin: 0 auto;
		margin-top: 50px;
		margin-bottom: 50px; 
		text-align: center;
	}
	.companyImg{
		display: inline-block;		
	}
	.companyImg>img{
		width: 130px;
		height: 30px;
	}
	.companyTitle{
		display: inline-block;
		margin-left: 15px;
		font-size: 24px;
		font-weight: 900;
	}
	.intro{
		margin-left: 20px;
		color: rgb(78, 205, 196);
		font-weight: 900;
	}
	.announce>p{
		font-size: 11px;
		margin-left: 30px;
	}
	.announceBox{
		width: 800px;
		margin: 0 auto;
		padding: 20px;
		border: 1px solid rgb(108, 108, 108);
	}
	.status{
		display: inline-block;
	}
	.status>p{
		display: inline-block;
		width: 70px;
		color: white;
		padding: 3px 5px;
		background-color: rgb(78, 205, 196);
		text-align: center;
	}
	.companyName, .companyName>p{
		display: inline-block;
		font-size: 12px;
		color: blue;
		margin-left: 10px;
		position: relative;
		top: -1px;
	}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="contain">
		<div class="companyInfoHeader">
			<div class="companyImg">				<!-- 공고 1개만 가능하면 걍 두고 여러개 가능하면 forEach로 여러개 해줘야댐 -->
				<img src="resources/img/jobSearch/Develomint_logo.png">	<!-- 나중에 업로드이미지로 바꿔주기 -->
			</div>
			<div class="companyTitle">
				<p>(주)디벨로민트</p>
			</div>
		</div>
		<div class="intro">
			<p>기업소개</p>		
		</div>
		<hr>
		<div class="announce">
			<%-- <c:choose>						//등록된 공고가 없으면 회사정보 페이지 올 일이 없으니 안써도 될거같음
				<c:when test="${empty a.announceNo }">
					<div class="emptyResume">
						<p>등록된 채용공고가 없습니다.</p>
					</div>
				</c:when>
			</c:choose> --%>
			<p>채용중 공고</p>
			<div class="announceBox">
				<%-- <c:choose>
					<c:when test="${현재날짜 > a.endDate }" var="a">	<!-- 현재날짜보다 길면 모집마감으로 변경 이거 어캐하지 -->
						<p>모집마감</p>
					</c:when>
					<c:otherwise>
						<div class="status">
							<p>모집중</p>
						</div>
					</c:otherwise>
				</c:choose> --%>
				<div class="status">
					<p>모집중</p>
				</div>
				<div class="companyName">
					<p>(주)디벨로민트</p>		<!-- ${a.companyname } -->
				</div>
				<div class="announceTitle">
					<p>2021 하반기 경영지원실  신입/경력 채용 공고</p>		<!-- ${a.companyTitle } -->
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
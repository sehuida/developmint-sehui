<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.contain{
		width: 1100px;
		margin: 0 auto;
		margin-top: 50px;
		margin-bottom: 50px;
	}
	.header{
		padding-left: 50px;
		padding-bottom: 40px;
		overflow: hidden;
		margin-top: 50px;
	}
	em{
		font-style: normal;
		font-weight: bold;
		font-size: 18px;
	}
	.logo{
		display: inline-block;
		margin-right: 30px;
	}
	.logo>img{
		width: 130px;
	}
	.announceTitle{
		margin-bottom: 0px;
		display: inline-block;
	}
	.announceTitle>p{
		margin-bottom: 0px;
		font-size: 25px;
		font-weight: bold;
		display: inline-block;
	}
	.companyName{
		color: #57595b;
		margin-left: 165px;
	}
	.applicationBtn{
		display: inline-block;
		width: 100px;
		text-align: center;
		padding: 15px 0px;
		float: right;
		background-color: rgb(78, 205, 196);
		color: white;
		font-weight: bold;
		border-radius: 5px;
		margin-right: 50px;
		cursor: pointer;
	}
	.info{
		width: 1000px;
		margin: 0 auto;
		margin-top: 30px;
	}
	.infoContent{
		margin-top: 10px;
	}
	.infoUl{
		list-style: none;
		margin-top: 25px;
		padding-left: 0px;
	}
	.infoUl>li{
		height: 30px;
	}
	.announceInfo{
		display: inline-block;
		width: 120px;
	}
	.infoDiv{
		margin-bottom: 50px;
	}
	.img>img{
		width: 18px;
		height: 21px;
	}
	.img{
		width: 25px;
		margin-right: 10px;
	}
	.comInfo{
		width: 800px;
		overflow: hidden;
		border: 1px solid #888;
		padding: 20px 10px;
	}
	.infoLogo{
		width: 260px;
		float: left;
		text-align: center;
		line-height: 120px;
	}
	.infoData{
		float: left;
		overflow: hidden;
	}
	.left{
		float: left;
		overflow: hidden;
		margin-right: 130px;
	}
	.left>div, .right>div{
		margin-bottom: 10px;
	}
	.right{
		float: left;
		overflow: hidden;
	}
	.text{
		float: left;
		margin-right: 18px;
		font-size: 14px;
	}
	.data{
		float: left;
		font-size: 14px;
	}
	.title{
		margin-bottom: 15px;
	}
	.title>a{
		font-size: 18px;
		text-decoration: none;
		color: #222222;
	}
	
</style>
<script>
	
</script>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="contain">
		<div class="header">
			<div class="logo">
				${a.filepath }
			</div>
			<div class="announceTitle">
				<p>${a.announceTitle }</p>
			</div>
			<div class="applicationBtn">
				<a>지원하기</a>
			</div>
			<div class="companyName">
				<small>${a.companyName }</small>
			</div>
		</div>
		<hr>
		<div class="info">
			<div class="infoDiv">
				<em>요약</em>
				<ul class="infoUl">
					<li>
						<span class="announceInfo">
							<i class="img">
								<img src="/resources/img/jobSearch/endDate.PNG">
							</i>
							마감일
						</span>
						<span>${a.endDate }</span>
					</li>
					<li>
						<span class="announceInfo">
							<i class="img">
								<img src="/resources/img/jobSearch/category.PNG">
							</i>
							 직무
						</span>
						<span>
							<c:if test="${a.category eq 1}">
								IT 개발
							</c:if>
							<c:if test="${a.category eq 2}">
								웹 디자인
							</c:if>
							<c:if test="${a.category eq 3}">
								프로젝트 기획
							</c:if>
						</span>
					</li>
					<li>
						<span class="announceInfo">
							<i class="img">
								<img src="/resources/img/jobSearch/career.PNG">
							</i> 
							경력
						</span>
						<span>
							<c:if test="${a.career eq 1 }">
								신입
							</c:if>
							<c:if test="${a.career eq 2 }">
								경력
							</c:if>
							<c:if test="${a.career eq 3 }">
								경력무관
							</c:if>
						</span>
					</li>
					<li>
						<span class="announceInfo">
							<i class="img">
								<img src="/resources/img/jobSearch/workForm.PNG">
							</i> 
						 	고용형태
						</span>
						<span>
							<c:if test="${a.workForm eq 1 }">
								정규직
							</c:if>
							<c:if test="${a.workForm eq 2 }">
								계약직
							</c:if>
							<c:if test="${a.workForm eq 3 }">
								아르바이트
							</c:if>
							<c:if test="${a.workForm eq 4 }">
								인턴
							</c:if>
							<c:if test="${a.workForm eq 5 }">
								프리랜서
							</c:if>
						</span>
					</li>
					<li>
						<span class="announceInfo">
							<i class="img">
								<img src="/resources/img/jobSearch/money.PNG">
							</i>
							 급여
						</span>
						<span><fmt:formatNumber value="${a.money}" pattern="#,###"/> &#8361;</span>
					</li>
				</ul>
			</div>
			
			<div class="infoDiv">
				<em>기업소개</em>	
				<div class="infoContent">
					<p>${a.content }</p>
				</div>
			
			</div>
			
			<div class="infoDiv">
				<em>주요업무</em>	
				<div class="infoContent">
					<p>${a.announceContent }</p>
				</div>
			</div>
			
			<div class="infoDiv">
				<em>우대사항</em>	
				<div class="infoContent">
					<c:if test="${a.veterans eq 2 }">
						<p>보훈대상 우대</p>
					</c:if>
					<c:if test="${a.military eq 1 }">
						<p>군필우대</p>
					</c:if>
					<c:if test="${a.military eq 2 }">
						<p>병역무관</p>
					</c:if>
				</div>
			</div>
			
			<div class="infoDiv">
				<em>채용절차</em>	
				<div class="infoContent">
					<p>온라인 이력서 접수 -> 서류 검토 -> 면접 일정 조율 -> 합/불 결과 통보</p>
				</div>
			</div>
			
			<div class="infoDiv">
				<em>기업정보</em>	
				<div class="infoContent">
					<div class="comInfo">
						<div class="infoLogo">
							${a.filepath }
						</div>
						<div class="infoData">
								<div class="title">
									<a href="/companyInfo.do?companyName=${a.companyName }">${a.companyName }</a>
									<a href="/companyInfo.do?companyName=${a.companyName }" class="aa" style="margin-left: 5px;"><strong style="font-size: 12px; color: #666666;">기업정보 ></strong></a>
								</div>
							<div class="left">
								<div class="text">
									<p style="color: #888888; margin-bottom: 10px;">사원수</p>
									<p style="color: #888888; margin-bottom: 0px;">대표자명</p>
								</div>
								<div class="data">
									<p style="color: #444444; margin-bottom: 10px;">${a.employee }명</p>
									<p style="color: #444444; margin-bottom: 0px;">${a.ceo }</p>
								</div>
							</div>
							<div class="right">
								<div class="text">
									<p style="color: #888888; margin-bottom: 10px;">주소</p>
									<p style="color: #888888; margin-bottom: 0px;">설립일</p>
								</div>
								<div class="data">
									<p style="color: #444444; margin-bottom: 10px;">${a.address }</p>
									<p style="color: #444444; margin-bottom: 0px;">${a.openDate }</p>
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
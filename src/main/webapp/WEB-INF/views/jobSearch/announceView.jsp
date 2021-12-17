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
		padding-left: 100px;
		padding-bottom: 50px;
		overflow: hidden;
		margin-top: 100px;
	}
	em{
		font-style: normal;
		font-weight: bold;
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
		margin-left: 10px;
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
	.infoUl{
		list-style: none;
		margin-top: 25px;
	}
	.announceInfo{
		width: 90px;
	}
	.infoDiv{
		margin-bottom: 50px;
	}
</style>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="contain">
		<div class="header">
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
						<span class="announceInfo"><img src="/resources/img/jobSearch/endDate.PNG"> 마감일</span>
						<span>${a.endDate }</span>
					</li>
					<li>
						<span class="announceInfo"><img src="/resources/img/jobSearch/category.PNG"> 직무</span>
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
						<span class="announceInfo"><img src="/resources/img/jobSearch/career.PNG"> 경력</span>
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
						<span class="announceInfo"><img src="/resources/img/jobSearch/workForm.PNG"> 고용형태</span>
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
						<span><img src="/resources/img/jobSearch/money.PNG"> 급여</span>
						<span><fmt:formatNumber value="${a.money}" pattern="#,###"/> &#8361;</span>
					</li>
				</ul>
			</div>
			
			<div class="infoDiv">
				<em>주요업무</em>	
			
			</div>
			
			<div class="infoDiv">
				<em>주요업무</em>	
			
			</div>
			
			<div class="infoDiv">
				<em>주요업무</em>	
			
			</div>
			
			<div class="infoDiv">
				<em>주요업무</em>	
			
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
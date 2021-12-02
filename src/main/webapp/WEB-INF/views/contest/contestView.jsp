<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#mainTitel{
	font-size: 30px;
	font-weight: bold;
	margin-bottom: 30px;
	margin-top: 50px;
}
.bi{
	color:#4ECDC4;
	font-size: 30px;
}
.contestTitle{
	font-size: 30px;
	font-weight: bold;
}
.contestInfoBox>div{
	margin-left: 150px;
	border-top : 1px solid #d9d9d9;
	border-bottom : 1px solid #d9d9d9;
	padding: 30px;
	width: 500px;
}
.contestInfoBox{
	display: flex;
	justify-content: center;
	margin-top:50px;
}
.contestInfoBox>div>p{
	font-size: 20px;

}
.contestInfoBox>div>p>span{
	font-weight: bold;
}
.contestContentBox{
	margin-top: 30px;
}
.contestContentBox>p{
	font-size: 25px;
	font-weight: bold;
}
.contestContentBox>div{
	padding : 30px;
	border: 1px solid #d9d9d9;
	font-size: 18px;
}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container" style="margin-bottom: 100px; margin-left: 400px;">
		<p id="mainTitel">공모전 상세보기</p>
		<div class="contestTitle" style="margin-top:55px;">
			<p><i class="bi bi-caret-right-fill"></i>${c.contestTitle }</p>
		</div>
		<%--공모 이미지+정보 --%>
		<div class="contestInfoBox">
			<img src="/resources/img/contest/${c.contestImg }" width="300px;" height="450px;">
			<div>
				<p><span>주최</span> : ${c.contestHost }</p>
				<p><span>접수기간</span> : ${c.contestDate } ~ ${c.contestDate }</p>
				<c:choose>
					<c:when test="${c.contestType eq 1}">
						<p><span>공모유형</span> : 기획</p>
					</c:when>
					<c:when test="${c.contestType eq 2}">
						<p><span>공모유형</span> : 개발</p>
					</c:when>
					<c:otherwise>
						<p><span>공모유형</span> : 디자인</p>
					</c:otherwise>
				</c:choose>
				<p><span>참가자격</span> : ${c.contestQualify }</p>
				<p><span>1등 시상금</span> : ${c.contestPrize } 만원</p>
				<p><span>담당자 이메일</span> : ${c.email }</p>
				<p><span>담당자 전화번호</span> : ${c.phone }</p>
				<p><span>조회수</span> : ${c.contestCount } 회</p>
				<%--신청인원은 추후 데이터 가져올 예정 --%>
				<p><span>신청인원</span> : 30 명</p>
			</div>
		</div>
		<%--공모 요강 --%>
		<div class="contestContentBox">
			<p>공모요강</p>
			<div>
				<p>${c.contestContentBr }</p>
			</div>
		</div>
		
		
		
		
		
		
	</div>
	
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
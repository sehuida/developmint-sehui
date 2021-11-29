<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeveloMint 관리자 페이지</title>
</head>

<style>
img{
	width:150px;
	height:150px;
}
.adminInfoBox{
	display:flex;
}
.adminInfo{
	flex-direction: column;
	margin-left: 20px;
}
.adminInfo span{
	font-size: 30px;
	 
}
.title{
	margin-top: 70px;
	font-size: 20px;
	font-weight: bold;
}
#mypage{
	font-size: 25px;
}
.bi{
	font-size:30px;
	color:#4ECDC4;
}
#cate{
	display:flex;
	border-bottom: 1px solid #e9e9e9;
	padding-bottom: 10px;
	padding-top: 10px;
}
#cate>span{
	line-height: 43px;
	margin-left : 20px;
	font-size : 17px;
}
.cateAtag{
	margin-left: auto;
}
</style>

<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container" style="padding:150px;">
		<div></div>
		<p id="mypage" style="font-weight:bold">마이페이지</p>
		<br><br><br>
		
		<%-- 관리자 정보 --%>
		<!-- ${sessionScope.m} 정보로 수정 예정 / 진호 마이페이지로 연결 예정-->
		<div class="adminInfoBox">
			<div class="adminImg">
				<img src="/resources/img/userTestImg.png">
			</div>
			<div class="adminInfo">
				<span style="font-weight:bold">관리자 </span><span>님</span>
				<p>admin@gmail.com</p>
			</div>
		</div>
		
		<!-- 관리자페이지 카테고리 -->
		<p class="title">전체현황</p>
		<div id="cate">
			<i class="bi bi-clipboard-data"></i><span>대시보드</span>
			<a href="/dashboard.do" class="cateAtag"><i class="bi bi-chevron-right"></i></a>
		</div>
		
		<p class="title">회원관리</p>
		<div id="cate">
			<i class="bi bi-list-ul"></i><span>전체 회원 조회</span>
			<a href="/allMemberList.do" class="cateAtag"><i class="bi bi-chevron-right"></i></a>
		</div>
		<div id="cate">
			<i class="bi bi-exclamation-circle"></i><span>신고 회원 처리</span>
			<a href="/reportMember.do" class="cateAtag"><i class="bi bi-chevron-right"></i></a>
		</div>
		<div id="cate">
			<i class="bi bi-person-dash-fill"></i><span>차단 회원 관리</span>
			<a href="#" class="cateAtag"><i class="bi bi-chevron-right"></i></a>
		</div>
		
		<p class="title">공모전</p>
		<div id="cate">
			<i class="bi bi-trophy"></i><span>공모전 동록 내역 보기</span>
			<a href="#" class="cateAtag"><i class="bi bi-chevron-right"></i></a>
		</div>
		<div id="cate">
			<i class="bi bi-people-fill"></i><span>공모전 신청 회원 보기</span>
			<a href="#" class="cateAtag"><i class="bi bi-chevron-right"></i></a>
		</div>
		
		<%-- 민주가 만든 공지사항, qna로 이동 예정 --%>
		<p class="title">게시판 관리</p>
		<div id="cate">
			<i class="bi bi-megaphone"></i><span>공지사항</span>
			<a href="#" class="cateAtag"><i class="bi bi-chevron-right"></i></a>
		</div>
		<div id="cate">
			<i class="bi bi-chat-dots"></i><span>QnA</span>
			<a href="#" class="cateAtag"><i class="bi bi-chevron-right"></i></a>
		</div>
	</div>
	<%--  
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	 --%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomint</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<link rel="stylesheet" href="/resources/css/notice/noticeList.css">
<link rel="stylesheet" href="/resources/css/notice/noticeHome.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container" style="margin-bottom: 50px;">
		<div class="area">
			<div class="nav-sub" style="margin-top: 30px;"><a href="/" class="text-hover">홈</a><span> > </span><a href="/noticehome.do" class="text-hover">고객센터</a><span> > </span><span>공지사항</span></div>
			<div class="title"><h2 style="color: #78c2ad;font-weight: bold;">CS Center</h2></div>
			<div class="center_tap">
				<ul style="margin-bottom: 0;">
					<li><span class="">Tel. 2163-8560</span><br><span class="last-span">평일 9:00~18:00(점심 12:00~13:00)</span></li>
					<li><a href="/n_counsel.do" class="text-hover">1:1 Q&A<br><span class="last-span">질문 전 FAQ(자주 묻는 질문)을 먼저 확인해 주세요.</span></a></li>
					<li><a href="/faq.do" class="text-hover">자주묻는질문<br><span class="last-span">자주묻는질문</span></a></li>
				</ul>
			</div>
			<div class="contents">
				<h3 class="title_cs font-mss">FAQ <span>자주 묻는 질문</span></h3>
				<!-- 탭버튼 -->
				<div class="center_tap3">
					<ul class="mypage_type">
		                <li><a href="/faq.do?category=8">로그인관련</a></li>
						<li><a href="/faq.do?category=9">고수 안내</a></li>
						<li><a href="/faq.do?category=10">환불관련</a></li>
						<li><a href="/faq.do?category=11">공모전관련</a></li>
						<li><a href="/faq.do?category=12">구인잡관련</a></li>
						<li><a href="/faq.do?category=13">커뮤니티관련</a></li>
						<li><a href="/faq.do?category=14">고수관련</a></li>
						<li><a href="/faq.do?category=15">팀프로젝트 관련</a></li>
						<li><a href="/faq.do?category=40">기타 문의</a></li>
						<li><a href="/faq.do?category=22">신고</a></li>
						<li><a href="/faq.do?category=21">기능/작동 오류</a></li>
						<li><a href="/faq.do?category=20">이벤트</a></li>
		            </ul>
				</div>
				<!-- //탭버튼 -->
				<!-- 콘텐츠 -->
				<table class="table table-primary">
				   <colgroup>
					   <col width="8%">
					   <col width="">
				   </colgroup>
				   <thead>
					   <tr class="table-primary">
						   <th scope="row">번호</th>
						   <th scope="row" style="text-align: center;">내용</th>
					   </tr>
				   </thead>
				   <tbody>
				   		<!-- 출력 -->
				   </tbody>
			  	</table>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
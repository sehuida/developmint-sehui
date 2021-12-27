<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomint</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<link rel="stylesheet" href="/resources/css/notice/noticeList.css">
<link rel="stylesheet" href="/resources/css/notice/noticeHome.css">
</head>
<style>
	.faq_a{
		display: none;
	}
</style>
<body>
<script>
(function(){
	
	$(".faq_q").click(function(){
		$(".faq_a").css("display","block");
	});
});
</script>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container" style="margin-bottom: 50px;">
		<div class="area">
			<div class="nav-sub" style="margin-top: 30px;"><a href="/" class="text-hover">홈</a><span> > </span><a href="/noticehome.do" class="text-hover">고객센터</a><span> > </span><span>공지사항</span></div>
			<div class="title"><h2 style="color: #78c2ad;font-weight: bold;">CS Center</h2></div>
			<div class="center_tap">
				<ul style="margin-bottom: 0;">
					<li><span class="">Tel. 2163-8560</span><br><span class="last-span">평일 9:00~18:00(점심 12:00~13:00)</span></li>
					<li><a href="/n_counsel.do" class="text-hover">1:1 Q&A<br><span class="last-span">질문 전 FAQ(자주 묻는 질문)을 먼저 확인해 주세요.</span></a></li>
					<li><a href="/faq.do?category=7" class="text-hover">자주묻는질문<br><span class="last-span">자주묻는질문</span></a></li>
				</ul>
			</div>
			<div class="contents">
				<h3 class="title_cs font-mss">FAQ <span>자주 묻는 질문</span></h3>
				<!-- 탭버튼 -->
				<div class="center_tap3">
					<ul class="mypage_type">
		                <li><a href="/faq.do?category=7">로그인관련</a></li>
						<li><a href="/faq.do?category=8">고수 안내</a></li>
						<li><a href="/faq.do?category=9">환불관련</a></li>
						<li><a href="/faq.do?category=10">공모전관련</a></li>
						<li><a href="/faq.do?category=11">구인잡관련</a></li>
						<li><a href="/faq.do?category=12">커뮤니티관련</a></li>
						<li><a href="/faq.do?category=13">고수관련</a></li>
						<li><a href="/faq.do?category=14">팀프로젝트 관련</a></li>
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
				   
				   <!-- 로그인관련 -->
				   <c:if test="${category eq 7 }">
				   		<tr>
					   		<td style="background-color: white; color: black; text-align: center;">1</td>
					   		<td class="faq_q" style="background-color: white; color: black;">아이디/비밀번호가 기억나지 않아요.</td>
				   		</tr>
				   		<tr class="faq_a">
				   			<td style="background-color: white; color: black; text-align: center;">답변</td>
				   			<td style="background-color: white; color: black;"><p>아이디/비밀번호가 기억나지 않으신다면, 로그인페이지의 아이디/비밀번호 찾기를 통해 확인하실 수 있습니다.</p></td>
				   		</tr>
				   		<tr>
					   		<td style="background-color: white; color: black; text-align: center;">2</td>
					   		<td style="background-color: white; color: black;">2</td>
				   		</tr>
				   		<tr>
					   		<td style="background-color: white; color: black; text-align: center;">3</td>
					   		<td style="background-color: white; color: black;">3</td>
				   		</tr>
				   		<tr>
					   		<td style="background-color: white; color: black; text-align: center;">4</td>
					   		<td style="background-color: white; color: black;">4</td>
				   		</tr>
				   </c:if>
				   
				   <!-- 고수 안내 -->
				   <c:if test="${category eq 8 }">
				   		<tr>
					   		<td>ㅎㅇ</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">ㅎㅇ</td>
				   		</tr>
				   		<tr>
					   		<td>2</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">2</td>
				   		</tr>
				   		<tr>
					   		<td>3</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">3</td>
				   		</tr>
				   		<tr>
					   		<td>4</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">4</td>
				   		</tr>
				   </c:if>
				   
				   <!-- 환불관련 -->
				   <c:if test="${category eq 9 }">
				   		<tr>
					   		<td>ㅎㅇ</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">ㅎㅇ</td>
				   		</tr>
				   		<tr>
					   		<td>2</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">2</td>
				   		</tr>
				   		<tr>
					   		<td>3</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">3</td>
				   		</tr>
				   		<tr>
					   		<td>4</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">4</td>
				   		</tr>
				   </c:if>
				   
				   <!-- 공모전관련 -->
				   <c:if test="${category eq 10 }">
				   		<tr>
					   		<td>ㅎㅇ</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">ㅎㅇ</td>
				   		</tr>
				   		<tr>
					   		<td>2</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">2</td>
				   		</tr>
				   		<tr>
					   		<td>3</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">3</td>
				   		</tr>
				   		<tr>
					   		<td>4</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">4</td>
				   		</tr>
				   </c:if>
				   
				   <!-- 구인잡관련 -->
				   <c:if test="${category eq 11 }">
				   		<tr>
					   		<td>ㅎㅇ</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">ㅎㅇ</td>
				   		</tr>
				   		<tr>
					   		<td>2</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">2</td>
				   		</tr>
				   		<tr>
					   		<td>3</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">3</td>
				   		</tr>
				   		<tr>
					   		<td>4</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">4</td>
				   		</tr>
				   </c:if>
				   
				   <!-- 커뮤니티관련 -->
				   <c:if test="${category eq 12 }">
				   		<tr>
					   		<td>ㅎㅇ</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">ㅎㅇ</td>
				   		</tr>
				   		<tr>
					   		<td>2</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">2</td>
				   		</tr>
				   		<tr>
					   		<td>3</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">3</td>
				   		</tr>
				   		<tr>
					   		<td>4</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">4</td>
				   		</tr>
				   </c:if>
				   
				   <!-- 고수관련 -->
				   <c:if test="${category eq 13 }">
				   		<tr>
					   		<td>ㅎㅇ</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">ㅎㅇ</td>
				   		</tr>
				   		<tr>
					   		<td>2</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">2</td>
				   		</tr>
				   		<tr>
					   		<td>3</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">3</td>
				   		</tr>
				   		<tr>
					   		<td>4</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">4</td>
				   		</tr>
				   </c:if>
				   
				   <!-- 팀프로젝트 관련 -->
				   <c:if test="${category eq 14 }">
				   		<tr>
					   		<td>ㅎㅇ</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">ㅎㅇ</td>
				   		</tr>
				   		<tr>
					   		<td>2</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">2</td>
				   		</tr>
				   		<tr>
					   		<td>3</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">3</td>
				   		</tr>
				   		<tr>
					   		<td>4</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">4</td>
				   		</tr>
				   </c:if>
				   
				   <!-- 기타 문의 -->
				   <c:if test="${category eq 40 }">
				   		<tr>
					   		<td>ㅎㅇ</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">ㅎㅇ</td>
				   		</tr>
				   		<tr>
					   		<td>2</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">2</td>
				   		</tr>
				   		<tr>
					   		<td>3</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">3</td>
				   		</tr>
				   		<tr>
					   		<td>4</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">4</td>
				   		</tr>
				   </c:if>
				   
				   <!-- 신고 -->
				   <c:if test="${category eq 22 }">
				   		<tr>
					   		<td>ㅎㅇ</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">ㅎㅇ</td>
				   		</tr>
				   		<tr>
					   		<td>2</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">2</td>
				   		</tr>
				   		<tr>
					   		<td>3</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">3</td>
				   		</tr>
				   		<tr>
					   		<td>4</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">4</td>
				   		</tr>
				   </c:if>
				   
				   <!-- 기능/작동 오류 -->
				   <c:if test="${category eq 21 }">
				   		<tr>
					   		<td>ㅎㅇ</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">ㅎㅇ</td>
				   		</tr>
				   		<tr>
					   		<td>2</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">2</td>
				   		</tr>
				   		<tr>
					   		<td>3</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">3</td>
				   		</tr>
				   		<tr>
					   		<td>4</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">4</td>
				   		</tr>
				   </c:if>
				   
				   <!-- 이벤트 -->
				   <c:if test="${category eq 20 }">
				   		<tr>
					   		<td>ㅎㅇ</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">ㅎㅇ</td>
				   		</tr>
				   		<tr>
					   		<td>2</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">2</td>
				   		</tr>
				   		<tr>
					   		<td>3</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">3</td>
				   		</tr>
				   		<tr>
					   		<td>4</td>
					   		<td style="background-color: rgb(250, 250, 250); color: black;">4</td>
				   		</tr>
				   </c:if>
				   </tbody>
			  	</table>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
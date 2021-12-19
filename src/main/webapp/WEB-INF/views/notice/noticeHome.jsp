<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomint</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container">
		<!-- FQA 리스트 뽑기 20개만뽑기(조회수순? 아니면 많이 묻는질문 탑20? 기준 정해야함)-->
		<!-- 공지사항 최신 7개 글만뽑기 -->
		<div class="area">
			<div class="nav-sub" style="margin-top: 30px;"><a href="/" class="text-hover">홈</a><span> > </span><a href="/noticehome.do" class="text-hover">고객센터</a><span> > </span><span>공지사항</span></div>
			<div class="title"><h2 style="color: #78c2ad;">CS Center</h2></div>
			<div class="section_search">
				<form name="faq_search" action="/app/cs/faq">
					<input class="input_cs" name="q" type="text" />
					<a href="javascript:void(0)" class="btn_black_basic" onclick="faqSearch(document.faq_search); return false;">FAQ 검색</a>
					<p class="box_reference_cs">※ 대부분의 질문은 검색을 통해 답변을 얻으실 가능성이 높습니다.</p>
				</form>
			</div>
			<div class="cs_menu">
				<ul>
					<li><span class="">Tel. 2163-8560</span><br><span class="last-span">평일 9:00~18:00(점심 12:00~13:00)</span></li>
					<li><a href="/n_counsel.do"><span class="font-mss">1:1 Q&A</span>1:1문의하기</a></li>
					<li><a href="/myCounsel.do"><span class="font-mss">My Question</span>내 질문</a></li>
					<li><a href="/faq.do"><span class="font-mss">FAQ</span>자주 묻는 질문</a></li>
					<li><a href="/noticeList.do?reqPage=1"><span class="font-mss">Notice</span>공지사항</a></li>
				</ul>
			</div>
			<div class="right_contents section_contents">
				<h3 class="title_cs font-mss">FAQ <span>자주 묻는 질문</span></h3>
				<!-- 탭버튼 -->
				<ul class="mypage_type">
	                <li><a href="/faq.do?category=12">주문 결제</a></li>
					<li><a href="/faq.do?category=11">배송 안내</a></li>
					<li><a href="/faq.do?category=10">주문취소</a></li>
					<li><a href="/faq.do?category=8">교환</a></li>
					<li><a href="/faq.do?category=9">환불</a></li>
					<li><a href="/faq.do?category=13">상품 관련</a></li>
					<li><a href="/faq.do?category=14">포인트 · 적립금</a></li>
					<li><a href="/faq.do?category=17">이벤트</a></li>
					<li><a href="/faq.do?category=15">회원 관련</a></li>
					<li><a href="/faq.do?category=21">무탠픽업</a></li>
					<li><a href="/faq.do?category=16">기타</a></li>
	            </ul>
				<!-- //탭버튼 -->
				<!-- 콘텐츠 -->
				<table class="table_basic">
				   <colgroup>
					   <col width="8%">
					   <col width="">
				   </colgroup>
				   <thead>
					   <tr>
						   <th scope="col">번호</th>
						   <th scope="col">내용</th>
					   </tr>
				   </thead>
				   <tbody>
				   		<!-- 출력 -->
				   </tbody>
			  	</table>
			</div>
			<!-- //고객센터 콘텐츠 -->
			<!-- 공지사항 & 이용방법 -->
			<div class="cell_cs_main">
				<h3 class="title_cs font-mss">Notice <span>공지사항</span></h3>
				<div class="cs_notice">
					<!-- ul리스트 출력 -->
				</div>
			</div>
			<!-- //공지사항 & 이용방법 -->
			<!--// 컨텐츠 영역 -->
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
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
<link rel="stylesheet" href="/resources/css/notice/qnalist.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container" style="margin-bottom: 50px;max-width: 1591px">
		<div class="area">
			<div class="nav-sub" style="margin-top: 30px;"><a href="/" class="text-hover">홈</a><span> > </span><a href="/noticehome.do" class="text-hover">고객센터</a><span> > </span><span>공지사항</span></div>
			<div class="title"><h2 style="color: #78c2ad;">CS Center</h2></div>
			<div class="center_tap">
				<ul style="margin-bottom: 0;">
					<li><span class="">Tel. 2163-8560</span><br><span class="last-span">평일 9:00~18:00(점심 12:00~13:00)</span></li>
					<li><a href="/n_counsel.do" class="text-hover">1:1 Q&A<br><span class="last-span">질문 전 FAQ(자주 묻는 질문)을 먼저 확인해 주세요.</span></a></li>
					<li><a href="/faq.do" class="text-hover">자주묻는질문<br><span class="last-span">자주묻는질문</span></a></li>
				</ul>
			</div>
			<div class="contents">
				<header class="n-section-title">
					<h1 class="tit">1:1문의</h1>
				</header>
				
					<form name="searchForm" id="searchForm"  method="get" action="/counsel">
				<input type="hidden" name="period" value=""/>
				<input type="hidden" name="page" value="1"/>
				<div class="n-table-filter">
					<div class="n-radio-tab">
						<input type="radio" id="radioTabGuide0" name="radioTabGuide" onClick="setPeriod(this,'1week');" >
						<label for="radioTabGuide0">1주일</label>

						<input type="radio" id="radioTabGuide1" name="radioTabGuide" onClick="setPeriod(this,'1month');" >
						<label for="radioTabGuide1">1개월</label>

						<input type="radio" id="radioTabGuide2" name="radioTabGuide" onClick="setPeriod(this,'3month');" >
						<label for="radioTabGuide2">3개월</label>

						<input type="radio" id="radioTabGuide3" name="radioTabGuide" onClick="setPeriod(this,'');" checked>
						<label for="radioTabGuide3">전체 시기</label>
					</div>

                    <div class="n-datepicker sb">
                        <input type="text" class="n-input" name="dt_fr" value="" placeholder="-" onblur="checkDateFormat(this);">
                    </div>
                    <div class="n-datepicker">
                        <input type="text" class="n-input" name="dt_to" value="" placeholder="-" onblur="checkDateFormat(this);">
                    </div>

					<div class="n-select">
						<select name="state">
							<option value="">전체 보기</option>
							<option value="1" >답변 대기</option>
							<option value="10" >접수</option>
							<option value="20" >업체 문의 중</option>
							<option value="30" >물품 도착 확인</option>
							<option value="40" >교환 상품 발송</option>
							<option value="50" >답변 완료</option>
						</select>
					</div>
					<button type="button" class="n-btn btn-sm btn-accent" onclick="search();">조회</button>
				</div>
				</form>
			
				<table class="n-table table-col">
					<colgroup>
						<col style="width:12.6%">
						<col style="width:*">
						<col style="width:12.6%">
						<col style="width:12.6%">
					</colgroup>
					<thead>
					<tr>
						<th scope="col">문의 유형</th>
						<th scope="col">내용</th>
						<th scope="col">작성일</th>
						<th scope="col">처리 상태</th>
					</tr>
					</thead>
					<tbody>
						
					</tbody>
				</table>
				<div class="n-paging"></div>
				<div class="n-btn-group">
					<a href="/counsel" class="n-btn btn-accent">1:1 문의하기</a>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
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
				<div class="n-table-filter">
					<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
					  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked=""  onClick="setPeriod(this,'1week');">
					  <label class="btn btn-outline-primary" for="btnradio1">1주일</label>
					  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" checked="" onClick="setPeriod(this,'1month');">
					  <label class="btn btn-outline-primary" for="btnradio2">1개월</label>
					  <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off" checked="" onClick="setPeriod(this,'3month');">
					  <label class="btn btn-outline-primary" for="btnradio3">3개월</label>
					  <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off" checked="" onClick="setPeriod(this,'');">
					  <label class="btn btn-outline-primary" for="btnradio3">전체 시기</label>
					</div>
					<div class="form-group n-datepicker sb">
                        <input type="text" class="n-input form-control" name="dt_fr" value="" placeholder="-" onblur="checkDateFormat(this);">
                    </div>
                    <div class="n-datepicker">
                        <input type="text" class="n-input form-control" name="dt_to" value="" placeholder="-" onblur="checkDateFormat(this);">
                    </div>
					<div class="form-group searchBox-2">
				     	<label for="qnaAnswer" class="form-label mt-1 text-white">답변상태</label>
				    	<select class="form-select" id="qnaAnswer" name="qnaAnswer" >
					      	<option value="">전체</option>
					      	<option value="1">미답변</option>
							<option value="2">답변</option>
			     		</select>
				  	</div>
				  	<button class="btn btn-secondary">조회</button>
				</div>
				</form>
				<table class="table">
					<%-- <colgroup>
						<col style="width:12.6%">
						<col style="width:*">
						<col style="width:12.6%">
						<col style="width:12.6%">
					</colgroup> --%>
					<thead>
					<tr>
						<th style="width: 15%">문의 유형</th>
						<th style="text-align: center;">내용</th>
						<th style="width: 10%">작성일</th>
						<th style="width: 8%;">처리 상태</th>
					</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="q" varStatus="i">
							<tr>
								<td >${q.type }</td>
								<td ><a href="javascript:void(0);">${q.qnaTitle }</a></td>
								<td>${q.regDate }</td>
								<td>
									<span>${q.state }</span>
									<div>
										<c:choose>
											<c:when test="${not empty q.qnaAnswer}">
												<%-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#viewModal${i.index }">내역보기</button> --%>
												<a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#viewModal${i.index }">내역보기</a>
												
											</c:when>
											<c:otherwise>
												<%-- <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#writeModal${i.index }" data-whatever="${adlist }">답변하기</button> --%>
												<a href="#" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#writeModal${i.index }">수정하기</a>
											</c:otherwise>
										</c:choose>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="n-paging"></div>
				<div class="n-btn-group">
					<a href="/n_counsel.do" class="btn btn-dark">1:1 문의하기</a>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
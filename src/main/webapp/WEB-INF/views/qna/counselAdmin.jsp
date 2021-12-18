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
				<div class="selectBox">
					<ol class="breadcrumb" style="width: 25%;">
					  <li class="breadcrumb-item active" ><a href="#">회원</a></li>
					  <li class="breadcrumb-item" ><a href="#">비회원</a></li>
					</ol>
				</div>
				<div class="searchBox">
					<form action="searhBox.do" class="searchBox-frm">
						<div class="form-group searchBox-1">
					     	<label for="category" class="form-label mt-4">문의유형</label>
					    	<select class="form-select" id="category" name="category" >
						      	<option value="">문의유형 선택</option>
								<option value="7">로그인관련</option>
								<option value="8">계정관련</option>
								<option value="9">결제관련</option>
								<option value="10">환불관련</option>
								<option value="11">공모전관련</option>
								<option value="12">구인잡관련</option>
								<option value="13">커뮤니티관련</option>
								<option value="40">기타 문의</option>
								<option value="21">신고</option>
								<option value="22">기능/작동 오류</option>
								<option value="20">이벤트</option>
				     		</select>
					  	</div>
					  	<div class="form-group searchBox-2">
					     	<label for="category" class="form-label mt-4">답변상태</label>
					    	<select class="form-select" id="qnaAnswer" name="qnaAnswer" >
						      	<option value="">전체</option>
						      	<option value="1">미답변</option>
								<option value="2">답변</option>
				     		</select>
					  	</div>
					  	<button class="btn btn-outline-dark">검색</button>
					</form>
				</div>
				<div class="contents">
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
						<c:forEach items="${list }" var="q" varStatus="i">
							<tr>
								<td >${q.type }</td>
								<td><a href="javascript:void(0);">${q.qnaTitle }</a></td>
								<td>${q.regDate }</td>
								<td>
									<span>${q.state }</span>
									<div>
										<button type="button" class="btn btn-outline-dark">답변하기</button>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
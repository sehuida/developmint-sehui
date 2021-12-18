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
				<ol class="breadcrumb" >
					<c:choose>
						<c:when test="${type eq 1}">
							<li class="breadcrumb-item active">회원</li>
						  	<li class="breadcrumb-item"><a href="adminCounsel.do?type=2">비회원</a></li>
						</c:when>
						<c:when test="${type eq 2}">
							<li class="breadcrumb-item "><a href="adminCounsel.do?type=1">회원</a></li>
						  	<li	class="breadcrumb-item active">비회원</li>
						</c:when>
					</c:choose>
				</ol>
				<!-- <button type="button" class="btn btn-secondary">회원</button>
				<button type="button" class="btn btn-primary">비회원</button> -->
				</div>
				<div class="searchBox">
					<form action="searhBox.do" class="searchBox-frm">
						<div class="form-group searchBox-1">
					     	<label for="category" class="form-label mt-1 text-white">문의유형</label>
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
					     	<label for="category" class="form-label mt-1 text-white">답변상태</label>
					    	<select class="form-select" id="qnaAnswer" name="qnaAnswer" >
						      	<option value="">전체</option>
						      	<option value="1">미답변</option>
								<option value="2">답변</option>
				     		</select>
					  	</div>
					  	<button class="btn btn-secondary">검색</button>
					</form>
				</div>
				<div class="contents t2">
					<table class="table">
					<%-- <colgroup>
						<col style="width:10%">
						<col>
						<col style="width:25%">
						<col style="width:25%">
					</colgroup> --%>
					<thead>
					<tr>
						<th style="width: 10%">문의번호</th>
						<th style="width: 15%">문의 유형</th>
						<th style="text-align: center;">내용</th>
						<c:choose>
							<c:when test="${type eq 1}">
								<th style="width: 10%">아이디</th>
							</c:when>
							<c:otherwise>
								<th style="width: 15%">이메일</th>
							</c:otherwise>
						</c:choose>
						<th style="width: 10%">작성일</th>
						<th style="width: 8%;">처리 상태</th>
					</tr>
					</thead>
					<tbody >
						<c:forEach items="${adlist }" var="q" varStatus="i">
							<tr>
								<c:choose>
									<c:when test="${type eq 1}">
										<td >${q.qnaNo }</td>
									</c:when>
									<c:otherwise>
										<td >${q.nonQnaNo }</td>
									</c:otherwise>
								</c:choose>
								<td >${q.type }</td>
								<td ><a href="javascript:void(0);">${q.qnaTitle }</a></td>
								<c:choose>
									<c:when test="${type eq 1}">
										<td >${q.memberId }</td>
									</c:when>
									<c:otherwise>
										<td >${q.email }</td>
									</c:otherwise>
								</c:choose>
								<td>${q.regDate }</td>
								<td>
									<span>${q.state }</span>
									<div>
										<c:choose>
											<c:when test="${not empty q.qnaAnswer}">
												<button type="button" class="btn btn-primary" onclick="answerView();">답변보기</button>
												<div class="modal" id="viewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
												  <div class="modal-dialog" role="document" style="top: 30%">
												    <div class="modal-content">
												      <div class="modal-header">
												        <h5 class="modal-title">AnswerView</h5>
												        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
												          <span aria-hidden="true"></span>
												        </button>
												      </div>
												      <div class="modal-body">
														<p style="font-size: 25px; font-weight: bold">보낸 답변보기</p>
														<p style="font-size: 22px;">${q.type } > ${q.qnaTitle }</p>
														<div style="border: 1px solid #d9d9d9; padding: 20px; margin-bottom: 20px;">
															<p><span style="font-weight: bold">답변 제목</span> : re)${q.qnaTitle }</p>
															<p><span style="font-weight: bold">내용</span> : ${q.qnaAnswer }</p>
															<p><span style="font-weight: bold">답변 날짜</span> : ${q.answerDate}</p>
														</div>
												      </div>
												      <div class="modal-footer">
												        <button type="button" class="btn btn-secondary btn_no" data-bs-dismiss="modal">닫기</button>
												      </div>
												    </div>
												  </div>
												</div>
											</c:when>
											<c:otherwise>
												<button type="button" class="btn btn-secondary" onclick="answerWrite();">답변하기</button>
												<div class="modal" id="writeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
												  <div class="modal-dialog" role="document" >
												    <div class="modal-content">
												      <div class="modal-header">
												        <h5 class="modal-title">AnswerWrite</h5>
												        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
												          <span aria-hidden="true"></span>
												        </button>
												      </div>
												    	<form action="/updateCounsel.do" method="post">
											      		<div class="modal-body">
															<p style="font-size: 25px; font-weight: bold">답변보내기</p>
															<p style="font-size: 22px;">${q.type } > ${q.qnaTitle }</p>
															<div style="border: 1px solid #d9d9d9; padding: 20px; margin-bottom: 20px;">
																<p><span style="font-weight: bold">답변</span> : re)${q.qnaTitle }</p>
																<div class="form-group">
															      <label for="qnaAnswer" class="form-label mt-4" style="font-weight: bold">내용</label>
															      <textarea class="form-control" id="qnaAnswer" name="qnaAnswer" cols="20" rows="20" placeholder="내용을 입력해주세요." required style="resize: none;" ></textarea>
															    </div>
															</div>
												      	</div>
													      <div class="modal-footer">
													        <button type="button" class="btn btn-primary btn_yes">작성하기</button>
													        <button type="button" class="btn btn-secondary btn_no" data-bs-dismiss="modal">취소하기</button>
													      </div>
														</form>
												    </div>
												  </div>
												</div>
											</c:otherwise>
										</c:choose>
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
	<script type="text/javascript">
		function answerView(){
			$('#viewModal').modal("show");
		}
		function answerWrite(){
			$('#writeModal').modal("show");
		}
		
	</script>
</body>
</html>
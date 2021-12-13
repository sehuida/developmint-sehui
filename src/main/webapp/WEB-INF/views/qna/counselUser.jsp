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
			<form action="/counsel_save.do" method="post" enctype="multipart/form-data">
				<div class="contents">
					<!-- 제목 -->
					<h3>1:1 Q&A</h3>
					<!-- 주의사항 -->
					<ul>
						<li></li>
						<li></li>
						<li></li>
						<li></li>
						<li></li>
					</ul>
					<!-- 폼돌아가는구간 -->
					<div class="section_form">
						<!-- [D] 주문확인 -->
						<div class="harf_area">
							<header class="n-section-title">
								<h2 class="tit">문의 작성</h2>
							</header>
							<table class="n-table table-row">
								<tbody>
									<tr>
										<th scope="row">문의유형</th>
										<td>
	                                        <div class="bg-select">
												<select name="qa_kind">
													<option value="">문의유형 선택</option>
													<option value="8">교환</option>
													<option value="9">환불</option>
													<option value="10">취소(출하 전 취소)</option>
													<option value="11">배송</option>
													<option value="20">A/S</option>
													<option value="12">주문/결제</option>
													<option value="15">회원 관련</option>
													<option value="16">기타 문의</option>
													<option value="17">신고</option>
													<option value="19">기능/작동 오류</option>
													<option value="21">이벤트</option>
												</select>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">작성자</th>
										<td>
											<input type="text" class="n-input" name="user_nm" value="김민주">
										</td>
									</tr>
									<tr class="n-same-row">
										<th scope="row">휴대전화</th>
										<td>
											<input type="text" class="n-input" name="mobile" value="010-8794-7512">
										</td>
									</tr>
									<tr class="n-same-row">
										<th scope="row">이메일</th>
										<td>
											<input type="text" class="n-input" name="email" value="skskmjo2398@naver.com">
										</td>
									</tr>
									<tr>
										<th scope="row">제목</th>
										<td>
											<input type="text" class="n-input" name="subject" value="" placeholder="제목을 입력해주세요.">
										</td>
									</tr>
									<tr class="n-same-row">
										<th scope="row">문의내용</th>
										<td>
											<textarea name="qa_msg" cols="100" rows="100" class="n-input" placeholder="내용을 입력해주세요."></textarea>
										</td>
									</tr>
									<tr class="n-same-row">
										<th scope="row">사진</th>
										<td class="file-upload">
											<ul class="file_show" id="file_show">
																						</ul>
											<button type="button" class="btn-file" onclick="$('#Filedata').click();">파일 선택</button>
											<span id="file_message" style="display: none;color: red;font-weight: bold;"></span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- //[D] 주문확인 -->
						<!-- faq 오른쪽 -->
						<div id="faq_list" class="harf_area"></div>
						<!-- //faq 오른쪽 -->
					</div>
					<!-- 버튼 -->
					<div class="n-btn-group">
						<a href="javascript:void(0)" onClick="cancel(); return false;" class="n-btn btn-lighter">취소</a>
						<a href="javascript:void(0)" onClick="qna_add(); return false;" class="n-btn btn-accent">작성하기</a>
					</div>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
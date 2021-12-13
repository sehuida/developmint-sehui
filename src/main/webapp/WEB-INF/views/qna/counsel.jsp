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
			<div class="question1">
			  <!--  확인 Modal-->
				<div class="modal" id="testModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document" style="top: 30%">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title">비회원Q&A 전용</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true"></span>
				        </button>
				      </div>
				      <div class="modal-body">
				        <p>현재 로그인이 되어있지 않습니다.</p>
				        <p>로그인 후 1:1 Q&A 진행하시겠습니까?</p>
				        <p>* 아니요 선택시 비회원Q&A로 진행됩니다.</p>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-primary btn_yes">예</button>
				        <button type="button" class="btn btn-secondary btn_no" data-bs-dismiss="modal">아니오</button>
				      </div>
				    </div>
				  </div>
				</div>
			</div>
			<!-- 모달 끝  -->
			<form action="/counsel_save.do" method="post" enctype="multipart/form-data" id="f1" name="f1">
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
											<c:choose>
												<c:when test="${empty sessionScope.m }">
													<input type="email" class="n-input" name="email" placeholder="예)examEmail@gmail.com">
												</c:when>
												<c:otherwise>
													<input type="text" class="n-input" name="user_nm" value="${sessionScope.m.memberId }" >
												</c:otherwise>
											</c:choose>
											
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
						<!-- faq 오른쪽 -->
						<div id="faq_list" class="harf_area"></div>
					</div>
					<!-- 폼돌아가는구간 끝  -->
					<!-- 버튼 -->
					<div class="n-btn-group">
						<a href="javascript:void(0)" onClick="cancel(); return false;" class="n-btn btn-lighter">취소</a>
						<a href="javascript:void(0)" onClick="qna_add(); return false;" class="n-btn btn-accent">작성하기</a>
					</div>
				</div>
			</form>
			<form action="">
				<input type="file" id="Filedata" class="input_file" onchange="uploadImage();" style="display: none !important;" />
			</form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script type="text/javascript">
		 $(function(){
			if(${empty sessionScope.m }){
				$('#testModal').modal("show");
				$(".btn_yes").click(function(){
					location.href ="/loginFrm.do";
				});
				
			}
				
			
		}); 
		function cancel() {
			if(confirm('취소하시겠습니까?')){
				history.back();
			}
		}
		function qna_add() {
			var f1 = $('#f1');

			if (f1.data('submitted') === true) {
				return false;
			} else {
				f1.data('submitted', true);
			}

			var qa_msg =stripSpecialCharacters($('#f1 [name=qa_msg]').val());

			try {
				if($('#f1 [name=qa_kind]').val() == '') {
					alert('문의유형을 선택해 주십시오.');
					$('#f1 [name=qa_kind]').focus();
					throw new Error("invalid");
				}

				if(isRequiredOrderNo($('#f1 [name=qa_kind]').val()) && $("#f1 [name='ord_no']").val() == '') {
					alert('주문번호를 선택해 주십시오.');
					$('#f1 [name=ord_no]').focus();
					throw new Error("invalid");
				}

				if($.trim($('#f1 [name=user_nm]').val()) == '') {
					alert('작성자를 입력해 주십시오.');
					$('#f1 [name=user_nm]').focus();
					throw new Error("invalid");
				}

				var pattern_kor = /[^ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
				if(pattern_kor.test($.trim($('#f1 [name=user_nm]').val()))) {
					alert('작성자를 한글로 입력해 주십시오.');
					$('#f1 [name=user_nm]').focus();
					throw new Error("invalid");
				}

				if($.trim($('#f1 [name=email]').val()) == '') {
					alert('이메일주소를 입력하세요.');
					throw new Error("invalid");
				} else {
					var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
					if(!filter.test($('#f1 [name=email]').val())) {
						alert('올바른 이메일 형식으로 입력해 주십시오.');
						throw new Error("invalid");
					}
				}

				if($.trim($('#f1 [name=subject]').val()) == '') {
					alert('제목을 입력해 주십시오.');
					$('#f1 [name=subject]').focus();
					throw new Error("invalid");
				}

				if(!$.trim($('#f1 [name=qa_msg]').val())) {
					alert('문의내용을 입력해 주십시오.');
					$('#f1 [name=qa_msg]').focus();
					throw new Error("invalid");
				}

				// 금지어 체크
				// var txt = $('form[name=f1] [name=subject]').val() +'|'+ $('form[name=f1] [name=qa_msg]').val();
				if(!chkBlackKeyword($('form[name=f1] [name=subject]').val())) {
					$('form[name=f1] [name=subject]').focus();
					throw new Error("invalid");
				}
				if(!chkBlackKeyword($('form[name=f1] [name=qa_msg]').val())) {
					$('form[name=f1] [name=qa_msg]').focus();
					throw new Error("invalid");
				}
			} catch (e) {
				f1.data('submitted', false);
				return false;
			}

			// 파일 업로드 컨텐츠 넣기
			var file_contents = "";
			$.each($('#file_show li'), function(index, item) {
				var img_src = $(this).children('img').attr('src');
				file_contents += '<br/><img src="'+ img_src +'"/>';
			});

			if(file_contents){
				$('#f1 [name=image_yn]').val('Y');
			}

			var contents = qa_msg + file_contents;
			$('#f1 [name=qa_msg]').val(contents);

			f1.submit();
		}

	</script>
</body>
</html>
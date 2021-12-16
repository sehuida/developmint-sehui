<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container * {
	text-decoration: none;
	color: black;
}

.container {
	min-width: 1200px;
}

input:focus, textarea:focus {
	outline: none;
}

.container>h3 {
	display: flex;
	justify-content: center;
	margin-top: 50px;
	font-size: 45px;
	font-weight: 900;
}

.talk-wrap {
	padding-top: 100px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	margin-top: 100px;
	margin-bottom: 100px;
	background-color: #f4f5f6;
	display: flex;
}

.g-feedback h3 {
	font-weight: bold;
	margin-top: 100px;
	margin-bottom: 40px;
}

.g-feedback span {
	padding: 20px;
}

.talk-one {
	border: 1px solid gray;
	width: 80%;
	padding-top: 40px;
	margin-bottom: 100px;
	background-color: white;
	border-radius: 30px;
	box-shadow: rgba(0, 0, 0, 0.4) 5PX 5PX 5PX 5PX;
}

.talk-one table img {
	border-radius: 50%;
	width: 60px;
}

.talk-one table {
	width: 100%;
}

.talk-one table td, .talk-one table th {
	padding: 20px;
}

.talk-me {
	background-color: rgb(144, 209, 180);
	border: 1px solid gray;
}

.talk-me p {
	background-color: white;
}

.talk-sub {
	display: flex;
	justify-content: center;
}

.talk-sub>div {
	padding: 40px;
	padding-left: 60px;
	padding-right: 60px;
}

.talk-sub table th, .talk-sub table td {
	padding: 10px;
}

.gosu-mail {
	display: flex;
	justify-content: right;
}

.gosu-mail a {
	font-weight: bold;
	font-size: 20px;
}

.gosu-mail span {
	font-weight: bold;
	color: white;
	background-color: red;
	border-radius: 50%;
	text-align: center;
	width: 20px;
	margin-left: 50px;
	display: block;
	font-size: 13px;
}

.star-rating {
	display: flex;
	flex-direction: row-reverse;
	font-size: 1.5em;
	justify-content: space-around;
	padding: 0 .2em;
	text-align: center;
	width: 6em;
	margin-bottom: 10px;
}

.star-rating input {
	display: none;
}

.star-rating label {
	color: #ccc;
	cursor: pointer;
}

.star-rating :checked ~ label {
	color: #f90;
}

.star-rating label:hover, .star-rating label:hover ~ label {
	color: #fc0;
}

</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<c:if test="${sessionScope.m.memberType eq 2}">
			<div class="gosu-mail">
				<a href="/gosuRequestList.do?reqPage=1">요청서</a>
			</div>
		</c:if>
		<c:if test="${sessionScope.m.memberType eq 1}">
			<div class="gosu-mail">
				<a href="/gosuRequestCostList.do?reqPage=1">견적서</a>
			</div>
		</c:if>
		<h3>
			<c:choose>
				<c:when test="${sessionScope.m.memberId ne gfOne.memberId}">
					<span style="color: rgb(78, 205, 196);">신청받은 내역</span>
				</c:when>
				<c:otherwise>
					<span style="color: rgb(78, 205, 196);">신청한 내역</span>
				</c:otherwise>
			</c:choose>

		</h3>
		
		
		<div class="g-feedback">

			<h3>Q. &nbsp;${gfOne.feedbackTitle }</h3>
			<span>${gfOne.feedbackContentBr }</span>
		</div>

		<c:choose>
			<c:when test="${gfOne.feedbackNum eq 1}">
				<div class="talk-sub">
					<h2 style="font-weight: 900; color: #cacaca; margin: 150px;">대화를
						시작해보세요!</h2>
				</div>
			</c:when>
			<c:otherwise>
				<div class="talk-wrap">
					<c:forEach items="${gtList }" var="gtl" varStatus="i">
						<c:choose>
							<c:when test="${gtl.writer eq sessionScope.m.memberId }">
								<div class="talk-one talk-me">
									<table>
										<tr>

											<c:if test="${not empty gtl.filename }">
												<th colspan="2"
													style="text-align: left; padding-left: 50px;">첨부파일
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a>${gtl.filename }</a>
												</th>

											</c:if>
											<td
												style="text-align: right; padding-right: 50px; color: gray;">${gtl.talkDate }</td>
										</tr>

										<tr>
											<td colspan="3" style="text-align: center; padding: 40px;"><p
													style="border: 1px solid gray; padding: 30px;">${gtl.talkContentBr }</p></td>
										</tr>
									</table>
								</div>
							</c:when>
							<c:otherwise>
								<div class="talk-one">
									<table>
										<tr>
											<th style="text-align: right; width: 150px;"><c:if
													test="${empty gtl.gosuImg }">
													<img src="/resources/img/gosu/g_img_basic.png">
												</c:if> <c:if test="${not empty gtl.gosuImg }">
													<img src="/resources/upload/member/${gtl.gosuImg }">
												</c:if></th>
											<th style="font-size: 30px;"><c:choose>
													<c:when test="${sessionScope.m.memberId ne gfOne.memberId}">
														<span style="color: rgb(78, 205, 196);">질문자</span>
													</c:when>
													<c:otherwise>
														<span style="color: rgb(78, 205, 196);">고수</span>
													</c:otherwise>
												</c:choose> ${gtl.writer }</th>
											<td
												style="text-align: right; padding-right: 50px; color: gray;">${gtl.talkDate }</td>
										</tr>
										<tr>
											<c:if test="${not empty gtl.filename }">
												<th style="text-align: right;">첨부파일</th>
												<td colspan="2"><a>${gtl.filename }</a></td>
											</c:if>
										</tr>
										<tr>
											<td colspan="3" style="text-align: center; padding: 40px;"><p
													style="border: 1px solid gray; padding: 30px;">${gtl.talkContentBr }</p></td>
										</tr>
									</table>
								</div>
							</c:otherwise>
						</c:choose>

					</c:forEach>

				</div>
			</c:otherwise>
		</c:choose>
		<hr>
		<c:choose>
			<c:when test="${gfOne.feedbackNum eq 3}">
				<c:choose>
					<c:when test="${sessionScope.m.memberId ne gfOne.memberId}">
						<c:choose>
							<c:when test="${not empty greview}">
								<div
									style="display: flex; justify-content: center; margin-top: 100px; margin-bottom: 50px;">
									<div>
										<span
											style="font-size: 30px; font-weight: 900; color: rgb(78, 205, 196);">작성된
											리뷰</span> <br> <br>
										<table>
											<tr>
												<td
													style="font-weight: 900; font-size: 20px; padding-bottom: 5px;">${greview.writer }</td>
												<td style="width: 800px;">

													<div class="star-rating">
														<c:if test="${greview.reviewNum eq 1 }">
															<span style="color: #ffd400;">&#9733;&#9734;&#9734;&#9734;&#9734;</span>
														</c:if>
														<c:if test="${greview.reviewNum eq 2 }">
															<span style="color: #ffd400;">&#9733;&#9733;&#9734;&#9734;&#9734;</span>
														</c:if>
														<c:if test="${greview.reviewNum eq 3 }">
															<span style="color: #ffd400;">&#9733;&#9733;&#9733;&#9734;&#9734;</span>
														</c:if>
														<c:if test="${greview.reviewNum eq 4 }">
															<span style="color: #ffd400;">&#9733;&#9733;&#9733;&#9733;&#9734;</span>
														</c:if>
														<c:if test="${greview.reviewNum eq 5 }">
															<span style="color: #ffd400;">&#9733;&#9733;&#9733;&#9733;&#9733;</span>
														</c:if>
													</div>
												</td>
												<td>${greview.reviewDate }</td>

											</tr>
											<tr>
												<td colspan="3"
													style="text-align: center; border: 1px solid #78c2ad; padding: 50px;">${greview.reviewContentBr }</td>

											</tr>
										</table>
										<div style="text-align: center;">
											<button type="button" class="btn btn-primary"
												style="font-weight: 900; padding: 10px; margin: 50px;"
												onclick="history.back();">뒤로가기</button>
										</div>
									</div>
							</c:when>
							<c:otherwise>
							<div
									style="display: flex; justify-content: center; margin-top: 200px; margin-bottom: 200px;">
									<span style="font-size: 30px; font-weight: 900; color: gray;">아직
										작성된 리뷰가 없습니다!</span>
								</div>
						</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${not empty greview}">
								<div
									style="display: flex; justify-content: center; margin-top: 100px; margin-bottom: 50px;">
									<div>
										<span
											style="font-size: 30px; font-weight: 900; color: rgb(78, 205, 196);">작성한
											리뷰</span> <br> <br>
										<table>
											<tr>
												<td style="width: 800px;">
													<div class="star-rating">
														<c:if test="${greview.reviewNum eq 1 }">
															<span style="color: #ffd400;">&#9733;&#9734;&#9734;&#9734;&#9734;</span>
														</c:if>
														<c:if test="${greview.reviewNum eq 2 }">
															<span style="color: #ffd400;">&#9733;&#9733;&#9734;&#9734;&#9734;</span>
														</c:if>
														<c:if test="${greview.reviewNum eq 3 }">
															<span style="color: #ffd400;">&#9733;&#9733;&#9733;&#9734;&#9734;</span>
														</c:if>
														<c:if test="${greview.reviewNum eq 4 }">
															<span style="color: #ffd400;">&#9733;&#9733;&#9733;&#9733;&#9734;</span>
														</c:if>
														<c:if test="${greview.reviewNum eq 5 }">
															<span style="color: #ffd400;">&#9733;&#9733;&#9733;&#9733;&#9733;</span>
														</c:if>
													</div>
												</td>
												<td>${greview.reviewDate }</td>

											</tr>
											<tr>
												<td colspan="2"
													style="text-align: center; border: 1px solid #78c2ad; padding: 50px; box-shadow: rgba(0, 0, 0, 0.4) 5PX 5PX 5PX 5PX;">${greview.reviewContentBr }</td>

											</tr>
										</table>
										<div style="text-align: center;">
											<button type="button" class="btn btn-primary"
												style="font-weight: 900; padding: 10px; margin: 50px;"
												onclick="history.back();">뒤로가기</button>
										</div>
									</div>
							</c:when>
							<c:otherwise>
								<div
									style="display: flex; justify-content: center; margin-top: 100px; margin-bottom: 100px;">
									<div>
										<h2 style="font-weight: 900; width: 100%; text-align: center;">고수님께서
											완료한 피드백입니다!</h2>
										<br> <br> <span
											style="font-size: 30px; font-weight: 900; color: rgb(78, 205, 196);">리뷰</span>
										<br> <br>
										<table>
											<tr>
												<td colspan="2">
													<div class="star-rating">
														<input type="radio" id="5-stars" name="rating" value="5" />
														<label for="5-stars" class="star">&#9733;</label> <input
															type="radio" id="4-stars" name="rating" value="4" /> <label
															for="4-stars" class="star">&#9733;</label> <input
															type="radio" id="3-stars" name="rating" value="3" /> <label
															for="3-stars" class="star">&#9733;</label> <input
															type="radio" id="2-stars" name="rating" value="2" /> <label
															for="2-stars" class="star">&#9733;</label> <input
															type="radio" id="1-star" name="rating" value="1" /> <label
															for="1-star" class="star">&#9733;</label>
													</div>
												</td>
											</tr>
											<tr>
												<td><textarea cols="70" id="reviewContent"></textarea></td>
												<td><button type="button" id="reviewSendAjax"
														class="btn btn-primary"
														style="font-weight: 900; padding: 10px; margin-left: 10px;">리뷰
														작성</button></td>
												<input type="hidden" value=${gfOne.ggosuNo } id="gfGgosuNo">
												<input type="hidden" value="${sessionScope.m.memberId }"
													id="writer">
											</tr>
										</table>
									</div>
								</div>
							</c:otherwise>
						</c:choose>


					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
					<span style="color: gray; font-size: small;">* 전송할 내용을 아래에
						입력해주세요<br> * 첨부파일은 한 번에 하나씩만 전송 가능합니다.
					</span> <br> <br> <br>
					<div class="talk-sub">

						<div>
							<table>
								<tr>
									<th colspan="2">첨부파일 &nbsp;&nbsp;&nbsp;&nbsp; <input
										type="file" id="talkFile"></th>

								</tr>
								<tr>
									<td colspan="2"><textarea cols="100" rows="10"
											id="talkContent"></textarea></td>
								</tr>
								<tr style="text-align: right;">
									<c:choose>
										<c:when test="${sessionScope.m.memberId ne gfOne.memberId}">
											<c:if test="${fn:length(gtList) >= 10}">
											<td style="text-align: center;">
												<button type="button" id="talkStopAjax" class="btn btn-info"
													style="width: 200px;">피드백 마치기</button>
											</td>
											</c:if>
											<td style="text-align: center;">
												<button type="button" id="talkBtnAjax"
													class="btn btn-primary" style="width: 200px;">전송</button>
											</td>
										</c:when>
										<c:otherwise>
											<td colspan="2">
												<button type="button" id="talkBtnAjax"
													class="btn btn-primary">전송</button>
											</td>
										</c:otherwise>
									</c:choose>

								</tr>
								<input type="hidden" value="${sessionScope.m.memberId }"
									id="writer">
								<input type="hidden" value="${gfOne.feedbackNo}" id="feedbackNo">
							</table>
						</div>
					</div>
			</c:otherwise>
		</c:choose>


	</div>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		$("#talkBtnAjax").click(function() {
			var talkContent = $("#talkContent").val();
			var writer = $("#writer").val();
			var feedbackNo = $("#feedbackNo").val();

			var form = new FormData();
			var files = $("#talkFile")[0].files[0];
			console.log(files);
			form.append("talkFile", files);
			form.append("talkContent", talkContent);
			form.append("writer", writer);
			form.append("feedbackNo", feedbackNo);
			if (talkContent == "") {
				swal({
			      title: '실패',
			        text: "내용을 입력해주세요!",
			        icon: 'error'
			      });
				return false;
			}
			$.ajax({

				url : "/talkBtnAjax.do",
				type : "post",
				processData : false,
				contentType : false,
				data : form,
				success : function(data) {
					if (data > 0) {
						console.log("등록성공");
						location.reload();
					} else {

						console.log("등록실패");
					}
				}
			});
		});
		$("#talkStopAjax").click(function() {
			var feedbackNo = $("#feedbackNo").val();

			$.ajax({

				url : "/talkStopAjax.do",
				data : {
					"feedbackNo" : feedbackNo
				},
				success : function(data) {
					if (data > 0) {
						location.reload();
					} else {
						console.log("에러");
					}
				}
			});
		});
		$("#reviewSendAjax").click(function() {
			var reviewNum = $("input[name=rating]:checked").val();
			var writer = $("#writer").val();
			var reviewContent = $("#reviewContent").val();
			var ggosuNo = $("#gfGgosuNo").val();
			console.log(reviewNum);
			console.log(writer);
			console.log(reviewContent);
			console.log(ggosuNo);
			if (reviewNum == null || reviewContent == "") {
				swal({
				      title: '실패',
				        text: "작성하신 리뷰를 다시 확인해주세요!",
				        icon: 'error'
				      });
				return false;
			}
			$.ajax({

				url : "/reviewSendAjax.do",
				data : {
					"reviewNum" : reviewNum,
					"writer" : writer,
					"reviewContent" : reviewContent,
					"ggosuNo" : ggosuNo
				},
				success : function(data) {
					if (data > 0) {
						swal({
					        title: '성공',
					        text: "리뷰 작성이 완료되었습니다!",
					        icon: 'success'
					      });
						location.reload();
					} else {
						console.log("에러");
					}
				}
			});
		})
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
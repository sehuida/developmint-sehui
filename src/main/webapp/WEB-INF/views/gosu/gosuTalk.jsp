<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	margin-top: 100px;
	margin-bottom: 100px;
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
	border: 4px solid rgb(144, 209, 180);
	width: 80%;
	padding-top: 40px;
	margin-bottom: 100px;
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
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<div class="gosu-mail">
			<a href="/gosuRequestList.do"><span>1</span>요청서</a>
		</div>
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

		<div class="talk-wrap">


			<c:forEach items="${gtList }" var="gtl" varStatus="i">
				<c:choose>
					<c:when test="${gtl.writer eq sessionScope.m.memberId }">
						<div class="talk-one talk-me">
							<table>
								<tr>

									<c:if test="${not empty gtl.filename }">
										<th colspan="2" style="text-align: left; padding-left: 50px;">첨부파일
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
					<c:otherwise>ㅇㅇㅇ
						<div class="talk-one">
							<table>
								<tr>
									<th style="text-align: right; width: 150px;"><c:if
											test="${empty gtl.gosuImg }">
											<img src="/resources/img/gosu/g_img_basic.png">
										</c:if> <c:if test="${not empty gtl.gosuImg }">
											<img src="${gtl.gosuImg }">
										</c:if></th>
									<th style="font-size: 30px;">${gtl.writer }</th>
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
		<hr>
		<c:choose>
			<c:when test="${gfOne.feedbackNum eq 3}">
				<c:choose>
					<c:when test="${sessionScope.m.memberId ne gfOne.memberId}">


						<c:choose>
							<c:when test="${sessionScope.m.memberId ne gfOne.memberId}">
								테스트 구문 바꾸기 리뷰 있으면 리뷰 보여주게


							</c:when>
							<c:otherwise>
							아직 작성된 리뷰가 없습니다!
						</c:otherwise>
						</c:choose>


					</c:when>
					<c:otherwise>
						<div style="display: flex; justify-content: center; margin-top: 100px;margin-bottom: 100px;">
							<div>
								<h2 style="font-weight: 900; width: 100%; text-align: center;">고수님께서
									완료한 피드백입니다!</h2>
								<br>
								<br> <span
									style="font-size: 30px; font-weight: 900; color: rgb(78, 205, 196);">리뷰</span>
								<br>
								<br>
								<table>
									<tr>
										<td colspan="2">별별별별별 &nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td><textarea cols="70"></textarea></td>
										<td><button type="button" class="btn btn-primary"
												style="font-weight: 900; padding: 10px; margin-left: 10px;">리뷰
												작성</button></td>
									</tr>
								</table>
							</div>
						</div>

					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
				<span style="color: gray; font-size: small;">* 전송할 내용을 아래에
					입력해주세요<br> * 첨부파일은 한 번에 하나씩만 전송 가능합니다.
				</span>
				<br>
				<br>
				<br>
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
										<td style="text-align: center;">
											<button type="button" id="talkStopAjax" class="btn btn-info"
												style="width: 200px;">피드백 마치기</button>
										</td>
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
					} else {

					}
				}
			});
		});
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
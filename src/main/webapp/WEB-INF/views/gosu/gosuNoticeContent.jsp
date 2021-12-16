<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.container * {
	text-decoration: none;
	color: black;
}

.container {
	margin-top: 50px;
	margin-bottom: 50px;
	min-width: 1200px;
}

.container .g-plus {
	display: flex;
	justify-content: right;
	color: rgb(78, 205, 196);
	text-align: right;
	font-weight: bold;
}

.container h4 {
	font-weight: bold;
	color: black;
	margin-top: 40px;
	margin-bottom: 40px;
	margin-bottom: 50px;
}

.g-img img {
	width: 952px;
}

.g-img {
	width: 100%;
	padding: 20px;
	margin-top: 100px;
	display: flex;
	justify-content: center;
}

.g-center {
	display: flex;
	justify-content: center;
}

.gosu td>img {
	border-radius: 50%;
	width: 50px;
	margin-right: 30px;
}

.gosu p {
	text-align: center;
	margin-top: 80px;
}

.gosu {
	margin-top: 100px;
	margin-bottom: 100px;
}

.gosu {
	padding: 100px;
}

.gosu dt {
	font-size: 25px;
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

.hrm-wrap {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	display: flex;
	align-items: center;
	justify-content: center;
	z-index: 10000;
}

#hrm-modal {
	background-color: white;
	width: 800px;
}

.hrm-btn-wrap {
	width: 100%;
	display: flex;
	justify-content: center;
}

.hrm-btn-wrap a {
	margin: 30px;
	margin-top: 50px;
	padding: 10px;
	width: 100px;
}

.g-style {
	text-align: center;
	margin: 10px;
	padding: 30px;
	display: flex;
	justify-content: center;
}
</style>
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
		<h4>
			&gt; &nbsp;<span style="color: rgb(78, 205, 196);">고수</span>의 게시판
		</h4>
		<div style="text-align: right; margin-top: 50px;">
			<span>${gNotice.gnoticeDate}</span>
		</div>
		<div class="g-center">
			<div class="g-img">
				<img src="${gNotice.gnoticePhoto}">
			</div>

		</div>
		<div>
			<div class="gosu">
				<dl>
					<dt style="font-size: 40px; margin-bottom: 30px;">${gNotice.gnoticeTitle}</dt>
					<dt>
						<table>
							<tr>
								<c:if test="${empty gNotice.writeImg }">
									<td rowspan="2"><img
										src="/resources/img/gosu/g_img_basic.png"></td>
								</c:if>
								<c:if test="${not empty gNotice.writeImg }">
									<td rowspan="2"><img
										src="/resources/upload/member/${gNotice.writeImg }"></td>
								</c:if>

								<th>${gNotice.writeId }</th>
								<input type="hidden" value="${gNotice.writeId }" id="gosuId">
							</tr>
							<tr>
								<td style="font-size: large; color: gray;">${gNotice.gnoticeDate}</td>
							</tr>

						</table>
					</dt>
					<dd>
						<p>${gNotice.gnoticeContentBr}</p>
					</dd>
				</dl>
			</div>
		</div>

		<div class="g-center">
			<c:if test="${sessionScope.m.memberId ne gNotice.writeId}">
			<c:if test="${not empty sessionScope.m }">
				<a id="feedbackListAjax" class="btn btn-info"
					style="width: 200px; margin: 100px; padding: 10px; font-weight: bold;">피드백
					신청하기</a>
					</c:if>
				<a class="btn btn-primary"
					style="width: 200px; margin: 100px; padding: 10px; font-weight: bold;"
					onclick="history.back();">뒤로가기</a>
			</c:if>
			<c:if test="${sessionScope.m.memberId eq gNotice.writeId}">
				<a href="/noticeContentUpdateFrm.do?gnn=${gNotice.gnoticeNo }" class="btn btn-info"
					style="width: 200px; margin: 100px; padding: 10px; font-weight: bold;">수정하기</a>
				<a href="/noticeContentdelete.do?gnn=${gNotice.gnoticeNo }" class="btn btn-primary"
					style="width: 200px; margin: 100px; padding: 10px; font-weight: bold;">삭제하기</a>
			</c:if>

		</div>
		<div class="hrm-wrap" style="display: none; margin: 0;">
			<div id="hrm-modal">
				<div class="hrm-content">
					<br>
					<div class="g-style">

						<c:if test="${not empty gosuWriteList}">
							<a class="btn btn-success" style="font-size: 30px;"
								href="/gosuContent.do?gNo=${gosuWriteList.ggsouNo}">${gosuWriteList.gosuTitle }</a>
						</c:if>
						<c:if test="${empty gosuWriteList}">
							<span style="font-size: 30px;">아직 고수님께서 소개글을 등록하지 않았네요!</span>
						</c:if>
					</div>
				</div>
				<div class="hrm-btn-wrap">
					<a id="hrm-close" class="btn btn-outline-success">확인</a>
				</div>
			</div>
		</div>
	</div>
	<script>
		$("#feedbackListAjax").click(function() {

			$(".hrm-wrap").css("display", "flex");
		});

		$("#hrm-close").click(function() {

			$(".hrm-wrap").css("display", "none");

		});
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
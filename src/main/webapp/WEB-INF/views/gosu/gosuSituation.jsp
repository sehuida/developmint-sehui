<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container>h1 {
	display: flex;
	justify-content: center;
	margin-top: 50px;
	font-size: 55px;
	font-weight: 900;
}

.container * {
	text-decoration: none;
	color: black;
}

.container {
	min-width: 1200px;
	margin-bottom: 100px;
	margin-top: 100px;
}

.g-sa-wrap h4 {
	font-weight: 900;
	color: rgb(78, 205, 196);
	margin-top: 50px;
	margin-bottom: 50px;
	font-size: 40px;
}

.container>div>div>div table td {
	padding: 10px;
	text-align: center;
}

.container>div>div>div table td>span {
	display: block;
	overflow: hidden;
	text-overflow: ellipsis;
}

.container>div>div>div table a {
	margin-top: 20px;
	width: 200px;
	margin-bottom: 20px;
}

.container>div>div>div {
	border: 1px solid rgb(160, 160, 160);
	width: 400px;
	padding-left: 20px;
	padding-right: 20px;
	margin: 70px;
}

.container>div>div {
	display: flex;
	flex-wrap: wrap;
}

.container>div>div>div table img {
	border-radius: 50%;
	border: 1px solid beige;
	height: 80px;
	width: 80px;
}

.review-one li {
	float: left;
	list-style-type: none;
	padding-right: 30px;
}

.review-one {
	overflow: hidden;
	padding: 20px;
}

.review-one p {
	padding: 10px;
	margin: 0;
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

.g-margin {
	margin-top: 50px;
	margin-bottom: 50px;
	display: flex;
	margin: 0 auto;
	width: 1080px;
}
</style>
</head>
<body>

	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<c:if test="${sessionScope.m.memberType eq 2}">
			<div class="gosu-mail">
				<a href="/gosuRequestList.do">요청서</a>
			</div>
		</c:if>
		<c:if test="${sessionScope.m.memberType eq 1}">
			<div class="gosu-mail">
				<a href="/gosuRequestCostList.do">견적서</a>
			</div>
		</c:if>
		<h1>나의 현황</h1>
		<hr>
		<p style="margin-bottom: 100px;">신청하신 전체 내역을 확인하실 수 있습니다.</p>
		<div class="g-sa-wrap">
			<h4>신청한 내역</h4>
			<div class="g-margin">
				<c:choose>
					<c:when test="${not empty gosuTalkList }">
						<c:forEach items="${gosuTalkList }" var="gtl" varStatus="i">
							<div>
								<table>
									<tr style="font-size: x-small;">
										<c:if test="${gtl.feedbackNum eq 1 }">
											<td style="text-align: left; padding-top: 20px;"><b
												style="color: blue;">진행 전</b></td>
										</c:if>
										<c:if test="${gtl.feedbackNum eq 2 }">
											<td style="text-align: left; padding-top: 20px;"><b
												style="color: red;">진행 중</b></td>
										</c:if>
										<c:if test="${gtl.feedbackNum eq 3 }">
											<td style="text-align: left; padding-top: 20px;"><b
												style="color: gray;">진행 완료</b></td>
										</c:if>

										<td>${gtl.feedbackDate }</td>
									</tr>
									<tr>
										<td><b>${gtl.feedbackTitle }</b></td>
										<td rowspan="2" style="padding-right: 0;"><c:if
												test="${empty gtl.gosuImg }">
												<img src="/resources/img/gosu/g_img_basic.png">
												<br>
												<span
													style="font-size: small; font-weight: 900; color: rgb(160, 160, 160);">${gtl.gosuId }</span>
											</c:if> <c:if test="${not empty gtl.gosuImg  }">
												<img src="/resources/upload/member/${gtl.gosuImg  }">
												<br>
												<span
													style="font-size: small; font-weight: 900; color: rgb(160, 160, 160);">${gtl.gosuId }</span>
											</c:if></td>
									</tr>
									<tr>
										<td><span style="height: 50px; width: 230px;">${gtl.feedbackContent }</span></td>
									</tr>
									<tr>
										<td colspan="2"><a style="margin-top: 0;"
											href="/gosuTalk.do?fbNo=${gtl.feedbackNo }"
											class="btn btn-primary">자세히 보기</a></td>
									</tr>

								</table>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<span
							style="font-size: 20px; margin-top: 50px; margin-bottom: 50px;">아직
							신청한 내역이 없습니다!</span>
					</c:otherwise>
				</c:choose>
			</div>

			<c:if test="${sessionScope.m.memberType eq 2}">
				<h4>신청받은 내역</h4>
				<div class="g-margin">
					<c:choose>
						<c:when test="${not empty gosuTalkList2 }">
							<c:forEach items="${gosuTalkList2 }" var="gtl" varStatus="i">
								<div>
									<table>
										<tr style="font-size: x-small;">
											<c:if test="${gtl.feedbackNum eq 1 }">
												<td style="text-align: left; padding-top: 20px;"><b
													style="color: blue;">진행 전</b></td>
											</c:if>
											<c:if test="${gtl.feedbackNum eq 2 }">
												<td style="text-align: left; padding-top: 20px;"><b
													style="color: red;">진행 중</b></td>
											</c:if>
											<c:if test="${gtl.feedbackNum eq 3 }">
												<td style="text-align: left; padding-top: 20px;"><b
													style="color: gray;">진행 완료</b></td>
											</c:if>

											<td style="padding-top: 20px;">${gtl.feedbackDate }</td>
										</tr>
										<tr>
											<td><b>${gtl.feedbackTitle }</b></td>
											<td rowspan="2" style="padding-right: 0;"><c:if
													test="${empty gtl.memberImg }">
													<img src="/resources/img/gosu/g_img_basic.png">
													<br>
													<span
														style="font-size: small; font-weight: 900; color: rgb(160, 160, 160);">${gtl.memberId }</span>
												</c:if> <c:if test="${not empty gtl.memberImg  }">
													<img src="/resources/upload/member/${gtl.memberImg  }">
													<br>
													<span
														style="font-size: small; font-weight: 900; color: rgb(160, 160, 160);">${gtl.memberId }</span>
												</c:if></td>
										</tr>
										<tr>
											<td><span style="height: 50px; width: 230px;">${gtl.feedbackContent }</span></td>
										</tr>
										<tr>
											<td colspan="2"><a
												href="/gosuTalk.do?fbNo=${gtl.feedbackNo }"
												class="btn btn-primary">자세히 보기</a></td>
										</tr>

									</table>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<span
								style="font-size: 20px; margin-top: 50px; margin-bottom: 50px;">아직
								신청받은 내역이 없습니다!</span>
						</c:otherwise>
					</c:choose>

				</div>
			</c:if>

			<h4>작성한 리뷰</h4>
			<div style="margin-bottom: 100px;">
				<div class="review-one" style="width: 80%;">
					<ul>
						<li><b><span style="color: rgb(78, 205, 196);"> 고수
							</span>XXX</b></li>
						<li>별별별별별</li>
						<li style="color: gray">2021.12.01</li>
					</ul>
					<br>
					<div style="display: flex; justify-content: center;">
						<p>리뷰리뷰리뷰리리뷰리뷰리뷰리리뷰리뷰리뷰리리뷰리뷰리뷰리리뷰리뷰리뷰리리뷰리뷰리뷰리리뷰리뷰리뷰리리뷰리뷰리뷰리뷰리뷰립류ㅣ뷰리뷰리뷰리뷰리리뷰리뷰리뷰리뷰리뷰립류ㅣ뷰리뷰리뷰리뷰리리뷰리뷰리뷰리뷰리뷰립류ㅣ뷰리뷰리뷰리뷰리리뷰리뷰리뷰리뷰리뷰립류ㅣ뷰리뷰리뷰리뷰리리뷰리뷰리뷰리뷰리뷰립류ㅣ뷰리뷰리뷰리뷰리</p>
					</div>
				</div>
			</div>

			<h4>요청서를 통한 고수 매칭</h4>
			<div class="g-margin">
				<div class="g-left">
					<table>
						<tr style="font-size: x-small;">
							<td style="text-align: left; padding-top: 20px;"><b
								style="color: red;">진행 중</b></td>
							<td style="padding-top: 20px;">2021.XX.XX</td>
						</tr>
						<tr>
							<td><b><span
									style="color: rgb(78, 205, 196); font-size: 20px;">고수</span></b></td>
							<td rowspan="2"><img
								src="/resources/img/gosu/g_img_basic.png"></td>
						</tr>
						<tr>
							<td style="font-size: 25px; width: 240px;"><b>강세희</b></td>
						</tr>
						<tr>
							<td colspan="2"><a href="/gosuProject.do"
								class="btn btn-info">자세히 보기</a></td>
						</tr>

					</table>
				</div>

				<div>
					<table>
						<tr style="font-size: x-small;">
							<td style="text-align: left; padding-top: 20px;"><b
								style="color: red;">진행 중</b></td>
							<td style="padding-top: 20px;">2021.XX.XX</td>
						</tr>
						<tr>
							<td><b><span
									style="color: rgb(78, 205, 196); font-size: 20px;">고수</span></b></td>
							<td rowspan="2"><img
								src="/resources/img/gosu/g_img_basic.png"></td>
						</tr>
						<tr>
							<td style="font-size: 25px; width: 240px;"><b>강세희</b></td>
						</tr>
						<tr>
							<td colspan="2"><a href="/gosuProject.do"
								class="btn btn-info">자세히 보기</a></td>
						</tr>

					</table>
				</div>
				<div>
					<table>
						<tr style="font-size: x-small;">
							<td style="text-align: left; padding-top: 20px;"><b
								style="color: red;">진행 중</b></td>
							<td style="padding-top: 20px;">2021.XX.XX</td>
						</tr>
						<tr>
							<td><b><span
									style="color: rgb(78, 205, 196); font-size: 20px;">고수</span></b></td>
							<td rowspan="2"><img
								src="/resources/img/gosu/g_img_basic.png"></td>
						</tr>
						<tr>
							<td style="font-size: 25px; width: 240px;"><b>강세희</b></td>
						</tr>
						<tr>
							<td colspan="2"><a href="/gosuProject.do"
								class="btn btn-info">자세히 보기</a></td>
						</tr>

					</table>
				</div>

			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
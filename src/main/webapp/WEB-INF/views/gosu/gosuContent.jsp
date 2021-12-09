<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
.container * {
	text-decoration: none;
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

.gosu-content-wrap {
	width: 900px;
}

.gosu {
	display: flex;
	justify-content: center;
}

.gosu img {
	border-radius: 50%;
}

.gosu td {
	width: 500px;
	font-weight: bold;
	font-size: 35px;
}

.gosu td>span {
	color: rgb(78, 205, 196);
}

.gosu-photos ul li {
	list-style-type: none;
	margin: 10px;
}


.gosu-photos ul li img {
	width: 120px;
}

.container>div>div>div {
	margin-top: 100px;
	margin-bottom: 200px;
}

.container>div>div>div>div a {
	padding: 10px;
	width: 150px;
	margin-top: 30px;
}

.review-one li {
	float: left;
	list-style-type: none;
	padding-right: 30px;
}

.review-one {
	overflow: hidden;
	margin: 10px;
	font-size: 12px;
}

.review-avg table td {
	padding: 10px;
}

.g-photo-one button {
	border: none;
	background-color: transparent;
}

.g-photo-one * {
	width: 200px;
}

.g-photo-one img {
	height: 200px;
}

.g-photo-one .g-b {
	height: 30px;
	overflow: hidden;
	display: block;
	text-overflow: ellipsis;
	text-align: center;
}

.g-photo-one .g-p {
	text-align: center;
	display: block;
	height: 50px;
	overflow: hidden;
	text-overflow: ellipsis;
}

.g-photo-wrap {
	display: flex;
	justify-content: space-around;
	flex-wrap: wrap;
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
.hrm-content img{
 width: 80%;
}
.hrm-content{
 text-align: center;
 

}
.hrm-btn-wrap {
	width: 100%;
	display: flex;
	justify-content: center;
}

#hrm-modal h3 {
	background-color: #78c2ad;
	padding: 30px;
	font-weight: 900;
	text-align: center;
}

#hrm-modal {
	background-color: white;
}

.hrm-btn-wrap a {
	margin: 30px;
	margin-top: 50px;
	padding: 10px;
	width: 100px;
}

.hrm-content b {
	font-size: 20px;
	margin-right: 50px;
	margin-bottom: 100px;
	margin-left: 50px;
}

.hrm-content textarea {
	width: 800px;
	padding: 10px;
}

.hrm-content input {
	padding: 10px;
	margin-bottom: 50px;
	width: 800px;
}

#gimage_container {
	text-align: center;
}

#gimage_container img {
	width: 300px;
}

.gphs {
	display: flex;
	justify-content: center;
}

.gosu-photos ul {
	flex-wrap: wrap;
	display: flex;
	width: 800px;
	margin:0 auto;
}

.gphs ul{
 padding:0;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<div class="gosu-mail">
			<a href="/gosuRequestList.do"><span>1</span>요청서</a>
		</div>
		<h4>
			&gt; &nbsp;<span style="color: rgb(78, 205, 196);">고수</span>를 소개합니다!
		</h4>
		<div style="text-align: right; margin-top: 50px;">
			<span style="color: gray;">${gosu.gosuDate}</span>
		</div>
		<div style="display: flex; justify-content: center;">
			<div class="gosu-content-wrap">
				<div class="gosu">
					<table>
						<tr>

							<c:if test="${empty gosu.gosuImg }">
								<th rowspan="6" style="padding: 40px; padding-right: 100px;"><img
									src="/resources/img/gosu/g_img_basic.png" style="width: 250px;"></th>
							</c:if>
							<c:if test="${not empty gosu.gosuImg }">
								<th rowspan="6" style="padding: 40px; padding-right: 100px;"><img
									src="${gosu.gosuImg }" style="width: 250px;"></th>
							</c:if>
						</tr>
						<tr>
							<td><span>고수</span> ${gosu.gosuId }</td>
						</tr>
						<tr>
							<td style="font-size: 25px;">${gosu.gosuTitle }</td>
						</tr>
						<tr>
							<td><hr></td>
						</tr>
						<tr>
							<td>한줄소개</td>
						</tr>
						<tr>
							<td style="font-size: 25px;">${gosu.gosuSelf }</td>
						</tr>
					</table>
				</div>
				<div>
					<h4>상세설명</h4>
					<div>
						<p>${gosu.gosuExplainBr }</p>
					</div>
					<div class="g-plus">
						<a href="">더보기</a>
					</div>
				</div>

				<div class="gosu-photos">
					<h4>사진</h4>
					<div class="gphs">
						<ul>
							<c:forEach items="${gphotoList }" var="gph" varStatus="i">
								<!--나중에 수정해라...  -->
								<li><a><img src="${gph.photoFilepath }"></a></li>
							</c:forEach>
						</ul>
					</div>
					<div class="g-plus">
						<a href="">더보기</a>
					</div>
				</div>

				<div class="gosu-review">
					<h4>리뷰</h4>
					<div class="review-wrap">
						<div>
							<div class="review-avg">
								<table>
									<tr>
										<td rowspan="3" style="font-size: 40px; font-weight: bold;">4.0</td>
									</tr>
									<tr>
										<td>별별별별별</td>
									</tr>
									<tr>
										<td style="font-size: small;">xx개의 리뷰</td>
									</tr>
								</table>
							</div>
							<hr>
							<div class="review-one">
								<ul>
									<li>xxx이름</li>
									<li>별별별별별</li>
									<li>2021.12.01</li>
								</ul>
								<br>
								<div style="display: flex; justify-content: center;">
									<p>리뷰리뷰리뷰리뷰리뷰립류ㅣ뷰리뷰리뷰리뷰리리뷰리뷰리뷰리뷰리뷰립류ㅣ뷰리뷰리뷰리뷰리리뷰리뷰리뷰리뷰리뷰립류ㅣ뷰리뷰리뷰리뷰리리뷰리뷰리뷰리뷰리뷰립류ㅣ뷰리뷰리뷰리뷰리리뷰리뷰리뷰리뷰리뷰립류ㅣ뷰리뷰리뷰리뷰리</p>
								</div>
							</div>
							<div class="review-one">
								<ul>
									<li>xxx이름</li>
									<li>별별별별별</li>
									<li>2021.12.01</li>
								</ul>
								<br>
								<div style="display: flex; justify-content: center;">
									<p>리뷰리뷰리뷰리뷰리뷰립류ㅣ뷰리뷰리뷰리뷰리리뷰리뷰리뷰리뷰리뷰립류ㅣ뷰리뷰리뷰리뷰리리뷰리뷰리뷰리뷰리뷰립류ㅣ뷰리뷰리뷰리뷰리리뷰리뷰리뷰리뷰리뷰립류ㅣ뷰리뷰리뷰리뷰리리뷰리뷰리뷰리뷰리뷰립류ㅣ뷰리뷰리뷰리뷰리</p>
								</div>
							</div>
						</div>
						<div style="display: flex; justify-content: center;">
							<a class="btn btn-primary">리뷰 더보기</a>
						</div>
					</div>
				</div>
				<div class="gosu-act">
					<h4>활동 및 자격</h4>
					<div>
						<p>${gosu.gosuActBr }</p>
					</div>
				</div>
				<div class="gosu-project">
					<h4>프로젝트</h4>
					<div class="g-photo-wrap">
						<c:forEach items="${gprojectList }" var="gpr" varStatus="i">
							<div class="g-photo-one">
								<button type="button" id="gProject" onclick="pAjax(${gpr.gprojectNo});">
									<dl>
										<dt>
											<img src="${gpr.gprojectFilepath }">
										</dt>
										<dd>
											<b class="g-b" style="font-size: 19px;">${gpr.gprojectTitle }</b>
										</dd>
										<dd>
											<p class="g-p">${gpr.gprojectContent }</p>
										</dd>
									</dl>
								</button>
							</div>
						</c:forEach>
					</div>
					<div style="display: flex; justify-content: center;">
						<a class="btn btn-primary">더보기</a>
					</div>
				</div>
				<div class="gosu-feedback">

					<h4>
						<span style="margin-right: 100px;">피드백 비용 </span> <span
							style="color: red; font-size: 40px;">${gosu.gosuCost }
							&nbsp; &nbsp;</span>원
					</h4>

				</div>
				<div class="hrm-wrap" style="display: none; margin: 0;">
					<div id="hrm-modal">
						<h3 style="color: white;">프로젝트</h3>
						<div class="hrm-content">
							<b style="text-align: left;">메인사진</b><br>
							<img src="" id="gprojectFilepath"><br>
							<div id="gimage_container"></div><br>
							<b style="float: left;">제목</b><br>
							<p id="gprojectTitle"></p><br> 
							<b style="float: left;">내용</b><br>
								<p id="gprojectContent"></p>
							<br>
						</div>
						<div class="hrm-btn-wrap">
							<a id="hrm-close" class="btn btn-outline-success">확인</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="display: flex; justify-content: center;">
			<a href="/gosuFeedback.do" class="btn btn-primary"
				style="width: 200px; margin: 100px; padding: 10px;"><b>피드백
					신청하기</b></a>
		</div>
	</div>
	<script>
		$("#hrm-close").click(function() {

			$(".hrm-wrap").css("display", "none");

		});
		function pAjax(pNo) {
			 $.ajax({
					url : "/gpAjax.do"
					, type : "post"
					, data : {"pNo":pNo}
					, success : function(data) {
						console.log(data);
						$("#gprojectTitle").append(data.gprojectContent);
						$("#gprojectContent").append(data.gprojectTitleBr);
						$("#gprojectFilepath").attr("src", data.gprojectFilepath);
						$(".hrm-wrap").css("display", "flex");
						
					}
			 });
		}
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
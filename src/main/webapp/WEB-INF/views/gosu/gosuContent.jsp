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
	float: left;
	list-style-type: none;
	margin: 10px;
}

.gosu-photos {
	overflow: hidden;
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

.g-photo-wrap {
	display: flex;
	justify-content: space-around;
}
  .gosu-mail{
        display: flex;
        justify-content: right;
        
    }
    .gosu-mail a{
        font-weight: bold;
        font-size: 20px;
    }
    .gosu-mail span{
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
			<span style="color:gray;">2021.12.01</span>
		</div>
		<div style="display: flex; justify-content: center;">
			<div class="gosu-content-wrap">
				<div class="gosu">
					<table>
						<tr>
							<th rowspan="6" style="padding: 40px; padding-right: 100px;"><img
								src="/resources/img/gosu/g_img_basic.png" style="width: 250px;"></th>
						</tr>
						<tr>
							<td><span>고수</span> xxxx</td>
						</tr>
						<tr>
							<td style="font-size: 25px;">제목제목제목제목제목제목제목제목</td>
						</tr>
						<tr>
							<td><hr></td>
						</tr>
						<tr>
							<td>한줄소개</td>
						</tr>
						<tr>
							<td style="font-size: 25px;">한줄소개소개한줄소개소개한줄소개소개</td>
						</tr>
					</table>
				</div>
				<div>
					<h4>상세설명</h4>
					<div>
						<p>anskddddddddddanskddddddddddddansk
							anskddddddddddddddddddddddddanskddddddddddddanskdddddddddddddd
							anskddddddddddddanskddddddddddanskddddddddddddansk
							anskddddddddddddddddddddddddanskddddddddddddanskdddddddddddddd
							anskdddddddddddd
							anskddddddddddddanskddddddddddanskddddddddddddansk
							anskddddddddddddddddddddddddanskddddddddddddanskdddddddddddddd
							anskdddddddddddd
							anskddddddddddddanskddddddddddanskddddddddddddansk
							anskddddddddddddddddddddddddanskddddddddddddanskdddddddddddddd
							anskdddddddddddd
							anskddddddddddddanskddddddddddanskddddddddddddansk
							anskddddddddddddddddddddddddanskddddddddddddanskdddddddddddddd
							anskdddddddddddd anskdddddddddddd anskdddddddddddd
							anskddddddddddddanskdddddddddddd</p>
					</div>
					<div class="g-plus">
						<a href="">더보기</a>
					</div>
				</div>

				<div class="gosu-photos">
					<h4>사진</h4>
					<div style="overflow: hidden;">
						<ul>
							<li><a><img src="/resources/img/gosu/g_img_basic.png"></a></li>
							<li><a><img src="/resources/img/gosu/g_img_basic.png"></a></li>
							<li><a><img src="/resources/img/gosu/g_img_basic.png"></a></li>
							<li><a><img src="/resources/img/gosu/g_img_basic.png"></a></li>
							<li><a><img src="/resources/img/gosu/g_img_basic.png"></a></li>
						</ul>
						<ul>
							<li><a><img src="/resources/img/gosu/g_img_basic.png"></a></li>
							<li><a><img src="/resources/img/gosu/g_img_basic.png"></a></li>
							<li><a><img src="/resources/img/gosu/g_img_basic.png"></a></li>
							<li><a><img src="/resources/img/gosu/g_img_basic.png"></a></li>
							<li><a><img src="/resources/img/gosu/g_img_basic.png"></a></li>
						</ul>
						<ul>
							<li><a><img src="/resources/img/gosu/g_img_basic.png"></a></li>
							<li><a><img src="/resources/img/gosu/g_img_basic.png"></a></li>
							<li><a><img src="/resources/img/gosu/g_img_basic.png"></a></li>
							<li><a><img src="/resources/img/gosu/g_img_basic.png"></a></li>
							<li><a><img src="/resources/img/gosu/g_img_basic.png"></a></li>
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
										<td style="font-size: x-small;">xx개의 리뷰</td>
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
					<div style="display: flex; justify-content: center;">
						<p>anskddddddddddanskddddddddddddansk</p>
					</div>
				</div>
				<div class="gosu-project">
					<h4>프로젝트</h4>
					<div class="g-photo-wrap">
						<div class="g-photo-one">
							<button type="button">
								<dl>
									<dt>
										<img src="/resources/img/gosu/g_img_basic.png">
									</dt>
									<dd>
										<b style="font-size: 19px;">제목제목</b>
									</dd>
									<dd>
										<p>내용내용내용</p>
									</dd>
								</dl>
							</button>
						</div>
						<div class="g-photo-one">
							<button type="button">
								<dl>
									<dt>
										<img src="/resources/img/gosu/g_img_basic.png">
									</dt>
									<dd>
										<b style="font-size: 19px;">제목제목</b>
									</dd>
									<dd>
										<p>내용내용내용</p>
									</dd>
								</dl>
							</button>
						</div>
						<div class="g-photo-one">
							<button type="button" >
								<dl>
									<dt>
										<img src="/resources/img/gosu/g_img_basic.png">
									</dt>
									<dd>
										<b style="font-size: 19px;">제목제목</b>
									</dd>
									<dd>
										<p>내용내용내용</p>
									</dd>
								</dl>
							</button>
						</div>
					</div>
					<div style="display: flex; justify-content: center;">
						<a class="btn btn-primary">더보기</a>
					</div>
				</div>
				<div class="gosu-feedback">

					<h4>
						피드백 비용 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; <span>100,000원</span>
					</h4>

				</div>
			</div>
		</div>
		<div style="display: flex; justify-content: center;">
			<a href="/gosuFeedback.do" class="btn btn-primary"
				style="width: 200px; margin: 100px; padding: 10px;"><b>피드백
					신청하기</b></a>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
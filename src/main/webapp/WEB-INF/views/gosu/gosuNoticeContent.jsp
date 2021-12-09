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
.g-img img{
	width:952px;
	} 
.g-img {
	width:100%;
	padding:20px;
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
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<div class="gosu-mail">
			<a href="/gosuRequestList.do"><span>1</span>요청서</a>
		</div>
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
									<td rowspan="2"><img src="/resources/img/gosu/g_img_basic.png"></td>
								</c:if>
								<c:if test="${not empty gNotice.writeImg }">
									<td rowspan="2"><img src="${gNotice.writeImg }"></td>
								</c:if>
							
								<th>${gNotice.writeId }</th>
							</tr>
							<tr>
								<td style="font-size: large; color: gray;">${gNotice.gnoticeDate}</td>
							</tr>

						</table>
					</dt>
					<dd>
						<p>${gNotice.gnoticeContent}</p>
					</dd>
				</dl>
			</div>
		</div>
		<div class="g-center">
			<a class="btn btn-info"
				style="width: 200px; margin: 100px; padding: 10px; font-weight: bold;">피드백
				신청하기</a> <a class="btn btn-primary"
				style="width: 200px; margin: 100px; padding: 10px; font-weight: bold;" onclick="history.back();">뒤로가기</a>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
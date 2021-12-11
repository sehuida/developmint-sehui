<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% char comma = ','; %>
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
	min-width: 1200px;
}

input:focus, textarea:focus {
	outline: none;
}

.container>h3 {
	display: flex;
	justify-content: center;
	margin-top: 50px;
	font-size: 30px;
	font-weight: 900;
}

.request li {
	list-style-type: none;
	padding: 30px;
}
.request{
	margin-top:100px;
	margin-bottom:100px;
}
.request, .g-center {
	display: flex;
	justify-content: center;
}

.request>div {
	border-width: 10px;
	padding: 50px;
	width:1000px;
}

.request h3 {
	font-size: 20px !important;
	font-weight: 600 ;
	color: gray !important;
}

.request * {
	font-size: 30px;
	font-weight: 900;
}

.request p {
	margin-right: 50px;
}
</style>


<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<h3>
			<span style="color: rgb(78, 205, 196);margin-right:10px;">${grOne.requestWriterId}</span>님의 요청서
		</h3>
		<div class="request">
			<div class="card border-primary mb-3">
				<ul style="padding: 0;">
					<li>
						<h3>어떤 플랫폼을 원하시나요?</h3> 
						${grOne.requestContent1Br}
						<br>
					</li>
					<li>
						<h3>어떤 종류의 개발을 원하시나요?</h3> 
						${grOne.requestContent2Br}<br> 
					</li>
					<li>
						<h3>원하는 숙련도의 개발자가 있으신가요?</h3>
						${grOne.requestContent3Br}<br> 
					</li>
					<li>
						<h3>기획은 어느 정도 되어있나요?</h3> 
						${grOne.requestContent4Br}<br> 
					</li>
					<li>
						<h3>개발 내용과 참고 사항에 대해 상세히 알려주세요.</h3>
						${grOne.requestContent7}<br> 

					</li>
					<li>
						<h3>언제까지 작업이 완료되어야 하나요?</h3>
						
						${grOne.requestContent5Br}<br> 
					</li>
					<li>
						<h3>어떻게 진행하기 원하시나요?</h3> 
						${grOne.requestContent6Br}<br> 
					</li>

				</ul>

			</div>


		</div>
		<div class="g-center">
			<a class="btn btn-info"
				style="width: 200px; margin: 100px; padding: 10px; font-weight: 900;"onclick="history.back();">뒤로가기</a>
			<a class="btn btn-primary"
				style="width: 200px; margin: 100px; padding: 10px; font-weight: 900;">견적보내기</a>
		</div>
		<script>
		
		</script>


		<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
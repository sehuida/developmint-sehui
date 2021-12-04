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

.container>h3 {
	display: flex;
	justify-content: center;
	margin-top: 100px;
	margin-bottom: 100px;
	font-size: 40px;
	font-weight: 900;
}

.request li {
	list-style-type: none;
	padding: 30px;
}

.request, .g-center {
	display: flex;
	justify-content: center;
}

.request>div {
	border-width: 10px;
	padding: 100px;
}

.request h3 {
	font-size: 20px !important;
	font-weight: 600 ;
	margin: 30px ;
	color: gray !important;
}

.request span {
	font-size: 30px;
	font-weight: 900;
	margin: 30px;
	margin-left: 100px;
}

.request p {
	margin-right: 50px;
}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<h3>
			<span style="color: rgb(78, 205, 196);">xxx</span>님의 요청서
		</h3>
		<div class="request">
			<div class="card border-primary mb-3">
				<ul style="padding: 0;">
					<li>
						<h3>어떤 플랫폼을 원하시나요?</h3> <span>Windows</span><br> <span>MAC</span><br>
					</li>
					<li>
						<h3>어떤 종류의 개발을 원하시나요?</h3> <span>일반프로그램</span><br> <span>게임</span><br>
					</li>
					<li>
						<h3>원하는 숙련도의 개발자가 있으신가요?</h3> <span>일반프로그램</span><br> <span>게임</span><br>
					</li>
					<li>
						<h3>원하는 숙련도의 개발자가 있으신가요?</h3> <span>시니어(10년 이상)</span><br> <span>게임</span><br>
					</li>
					<li>
						<h3>기획은 어느 정도 되어있나요?</h3> <span>아이디어만 있음</span><br> <span>필요
							내용 정리되어 있음</span><br> <span>상세한 기획 문서 있음 </span><br>
					</li>
					<li>
						<h3>개발 내용과 참고 사항에 대해 상세히 알려주세요.</h3> <span>ㅇㄴ러ㅏㅣ저ㅑㅎㅈㄷ</span><br>

					</li>
					<li>
						<h3>언제까지 작업이 완료되어야 하나요?</h3> <span>일주일 이내로 진행하고 싶어요.</span><br>
						<span>원하는 날짜가 있어요.</span><br>
					</li>
					<li>
						<h3>어떻게 진행하기 원하시나요?</h3> <span>어떤 방식이든 상관없어요.</span><br> <span>온라인
							진행 원해요.</span><br>
					</li>

				</ul>

			</div>


		</div>
		<div class="g-center">
			<a class="btn btn-info"
				style="width: 200px; margin: 100px; padding: 10px; font-weight: 900;">뒤로가기</a>
			<a class="btn btn-primary"
				style="width: 200px; margin: 100px; padding: 10px; font-weight: 900;">견적보내기</a>
		</div>


		<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
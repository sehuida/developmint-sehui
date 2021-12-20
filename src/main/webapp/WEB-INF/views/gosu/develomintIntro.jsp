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

.container>h1 {
	display: flex;
	justify-content: center;
	margin-top: 50px;
	font-size: 55px;
	font-weight: 900;
}

.container {
	min-width: 1200px;
	margin-top: 200px;
}

.line {
	background-color: #00c7ae;
	height: .125rem;
	width: 12rem;
	margin: 0 auto;
	margin-top: 50px;
}

.back-img {
	background: url("/resources/img/gosu/soomgo_mission.jpg");
	background-size: 100% 100%;
	background-position: center;
	background-repeat: no-repeat;
	height: 300px;
	display: flex;
	flex-direction: column;
	align-items: left;
	justify-content: center;
}

.back-img>h2 {
	color: white;
	margin: 50px;
}

.container>h3 {
	margin-top: 50px;
	font-size: 55px;
	font-weight: 900;
}

.g-center {
	display: flex;
	justify-content: center;
	margin: 50px;
}

.g-between {
	display: flex;
	justify-content: space-around;
	margin-top: 200px;
	margin-bottom: 200px;
}

.g-between>img {
	width: 50%;
}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<div class="back-img">
			<h2>
				비즈니스와 일상에 기술을 더하여<br> 더 편리하고 즐거운 세상을 만들어갑니다.
			</h2>
		</div>
		<h1>
			<span style="color: rgb(78, 205, 196); margin: 50px;">Develomint</span>
		</h1>

		<div class="g-center">
			<div>
				<h3 style="text-align: center; width: 100%; color: gray;">당신만의
					커뮤니티</h3>
				<div class="line"></div>
			</div>

		</div>
		<br><br><br><br>
		<div style="margin-bottom: 100px; margin-top: 100px;">
			<h1 style="font-size: 50px;">
				더 특별한 일상을 만드는 것,<br> 그것이 디벨로민트를 시작하는 이유입니다.
			</h1>
		</div>
		<div class="g-between">
			<div>
				<img src="/resources/upload/member/취업사진_1.jpg">
			</div>
			<div style="width: 50%; padding: 50px;">
				<h2>대표이사 김진호</h2>
				<br> <br> 우리는 꿈을 현실로 만드는 여정에 함께하는 동반자들이다.<br> 우리는
				사람들이 자신의 꿈을 실현하는 것을 도움으로써<br> 더 나은 세상을 만드는데 기여한다.<br> <br>
				<br>꾸준히 노력을 쌓아온 사람만이 사회에서 그 능력을 인정받지요.<br> 특히 IT업계로의 진입은
				더더욱 어렵고 힘들게 느끼실 수도 있어요.<br> 그러나 포기하지 않고 나에게 주어진 퀘스트를 하나씩 완료할수록<br>
				본인의 능력치 향상뿐만 아니라 자신감이 붙을 거예요.<br> 이렇게 자신감을 갖고 노력하다 보면, 어느 순간
				개발자로서<br> 어엿한 사회 구성원이 되어있는 나 자신을 발견하는 날이 올 것입니다 <br> <br>
				개발자가 되는 그 날까지 함께 완주하겠습니다 하루가 멀다하고<br> 쏟아지는 새로운 기술들과 하나하나 이해하기
				어려운 용어들,<br> 많은 사람들이 IT 분야는 공부할 것도 많고 어렵다라고 말하기도 합니다.<br>
				하지만 목표가 뚜렷한 사람에게 그 많은 기술들은 공부해야 할 과제가 아니라<br> 좋은 도구이자 설레이는 장난감일
				뿐 입니다.<br> '쇼핑몰을 만들겠다, 게임을 만들겠다, 해킹툴을 만들겠다'<br> 무엇이든 좋습니다.
				욕심과 목표를 가지세요. 그것은 우리를 강하게 합니다.<br> 본인이 상상하는 IT 전문가의 모습이 있다면
				확신해도 좋습니다.<br> 우린 그렇게 됩니다.<br>
			</div>
		</div>
		<div class="g-between">

			<div style="width: 50%; padding: 50px;">
				<h2>공동이사 이윤수</h2>
				現) KH정보교육원 전임강사<br> (주)에스에이정보기술<br> <br> <br>
				망설이지 말고 도전하자!<br> 수업을 진행하다보면 실수와 실패에 대한 두려움으로<br> 시도조차 못하는
				학생들이 많습니다.<br> 학습 과정에서 실수와 실패는 당연히 발생합니다.<br> 계속해서 도전하여
				실수와 실패가 줄어드는 것이<br> 자신만의 노하우가 생기는 과정입니다.<br>
			</div>
			<div style="line-height: 362px;">
				<img style="border-radius: 50%;"
					src="/resources/upload/member/yoon.jpg">
			</div>
		</div>
		<div style="margin-bottom: 100px; margin-top: 100px;">
			<h1 style="font-size: 50px; line-height: 75px;">
				The way we work Why not?<br> <br> 당연한 것들에 대한 도전<br> <br>
				If Develomint Enterprise, ()<br> <br> <span
					style="color: rgb(78, 205, 196); font-weight: 900;">디벨로민트
					생각에 대한 기대,</span> <br>더 특별한 일상을 만드는 것,<br>그것이 디벨로민트를 시작하는 이유입니다.
			</h1>
		</div>

		<div class="line"
			style="width: 100%; margin: 0; margin-bottom: 250px; margin-top: 250px;"></div>
		<div class="g-center">
			<div>
				<h3 style="text-align: center; width: 100%; color: gray;font-weight: 900;">오픈소스를 요리하다, Olive Platform</h3>
				<img style="width: 100%;" src="/resources/img/gosu/olive.png">
			</div>
			
		</div>
		<div class="g-center">
			<div style="text-align: center;">	
				<br><br><br><br><br>
				<h3 style="text-align: center; width: 100%; color: gray;">디벨로민트에
					가입해보세요</h3>
				<div class="line"></div>
				<a href="/joinFrm.do" class="btn btn-success" style="margin: 100px;width: 200px;font-size: 20px;font-weight: 900;">회원가입</a>
			</div> 

		</div>

	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
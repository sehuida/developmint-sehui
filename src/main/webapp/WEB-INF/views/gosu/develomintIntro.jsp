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
}

.line {
	background-color: #00c7ae;
	height: .125rem;
	width: 25rem;
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
	top: 200px;
}

.g-between {
	display: flex;
	justify-content: space-around;
	top: 200px;
}

.g-between>img {
	width: 50%;
}

.footer {
	position: fixed;
	left: 0;
	bottom: 0;
	width: 100%;
}

html, body {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 100%;
}

.g-box {
	width: 100%;
	height: 100%;
	position: relative;
	height: 100%;
	height: 100%;
}

.down-wrap {
	position: fixed;
	z-index: 1000;
	margin-top: 180px;
	margin-left: 1400px;
}

.down-img {
	text-align: center;
	justify-content: right;
}

.down-img>img {
	width: 30px;
	animation: motion 0.3s linear 0s infinite alternate;
	margin-top: 0;
}

@keyframes motion 
{ 0% {margin-top: 0px;}
100%{margin-top:10px;}}
</style>
<body>
	<div class="container" style="margin-top: 0;">

		<div class="g-box">
			<%@include file="/WEB-INF/views/common/header.jsp"%>

			<div class="back-img" style="margin: 0;"></div>
			<h1 style="text-align: center; margin-top: 150px;">
				<span
					style="color: rgb(78, 205, 196); font-size: 80px; font-weight: 900;">Develomint</span>
			</h1>
			<div class="down-wrap">
				<div class="down-img">
					<img src="/resources/img/gosu/downdown.png">
				</div>
			</div>
		</div>
		<div class="g-center g-box">
			<div style="margin-top: 400px;">
				<h3
					style="text-align: center; width: 100%; color: gray; font-size: 60px;">당신만의
					커뮤니티</h3>
				<div class="line"></div>
			</div>

		</div>

		<div class="g-box">
			<br> <br> <br> <br> <br> <br>
			<h1 style="font-size: 50px; line-height: 90px; margin-top: 200px;">
				더 특별한 일상을 만드는 것,<br> 그것이 디벨로민트를 시작하는 이유입니다.
			</h1>
		</div>
		<div class="g-between g-box">
			<div style="text-align: center; margin-top: 200px;">
				<img style="width: 60%;" src="/resources/upload/member/취업사진_1.jpg">
			</div>
			<div style="width: 50%; margin-top: 200px;">
				<h2>대표이사 김진호</h2>
				<br> <br> 우리는 꿈을 현실로 만드는 여정에 함께하는 동반자들이다.<br> 우리는
				사람들이 자신의 꿈을 실현하는 것을 도움으로써<br> 더 나은 세상을 만드는데 기여한다.<br> <br>
				<br>꾸준히 노력을 쌓아온 사람만이 사회에서 그 능력을 인정받지요.<br> 특히 IT업계로의 진입은
				더더욱 어렵고 힘들게 느끼실 수도 있어요.<br> 그러나 포기하지 않고 나에게 주어진 퀘스트를 하나씩 완료할수록<br>
				본인의 능력치 향상뿐만 아니라 자신감이 붙을 거예요.<br> 이렇게 자신감을 갖고 노력하다 보면, 어느 순간
				개발자로서<br> 어엿한 사회 구성원이 되어있는 나 자신을 발견하는 날이 올 것입니다 <br> <br>

			</div>
		</div>
		<div class="g-between g-box">

			<div style="width: 50%; margin-top: 300px;">
				<h2>공동이사 이윤수</h2>
				現) KH정보교육원 전임강사<br> (주)에스에이정보기술<br> <br> <br>
				망설이지 말고 도전하자!<br> 수업을 진행하다보면 실수와 실패에 대한 두려움으로<br> 시도조차 못하는
				학생들이 많습니다.<br> 학습 과정에서 실수와 실패는 당연히 발생합니다.<br> 계속해서 도전하여
				실수와 실패가 줄어드는 것이<br> 자신만의 노하우가 생기는 과정입니다.<br>
			</div>
			<div style="line-height: 362px; margin-top: 300px;">
				<img style="border-radius: 50%;"
					src="/resources/upload/member/yoon.jpg">
			</div>
		</div>
		<div class="g-box">
			<h1 style="font-size: 50px; line-height: 90px;">
				<br> <b>The way we work Why not?</b><br> <br> 당연한 것들에
				대한 도전<br> <br> <b>If Develomint Enterprise,
					(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)</b><br> <br>
				<span style="color: rgb(78, 205, 196); font-weight: 900;">디벨로민트
					생각에 대한 기대,</span> <br>더 특별한 일상을 만드는 것,<br>그것이 디벨로민트를 시작하는 이유입니다.
			</h1>
		</div>

		<div class="g-center g-box">
			<div style="margin-top: 50px;">
				<br>
				<h3
					style="text-align: center; width: 100%; color: gray; font-weight: 900;">오픈소스를
					요리하다, Olive Platform</h3>
				<br> <br> <img style="width: 100%;"
					src="/resources/img/gosu/olive.png">
			</div>
		</div>
		<div class="g-center g-box">
			<div style="text-align: center; margin-top: 300px;">

				<h3 style="text-align: center; width: 100%; color: gray;">디벨로민트에
					가입해보세요</h3>
				<div class="line" style="width: 15rem;"></div>
				<br> <br> <br> <br> <br> <br>
				<c:if test="${empty sessionScope.m }">
					<a href="/joinFrm.do" class="btn btn-success"
						style="width: 200px; font-size: 20px; font-weight: 900;">회원가입</a>
				</c:if>
				<c:if test="${not empty sessionScope.m }">
					<a href="/logout.do" class="btn btn-success"
						style="width: 200px; font-size: 20px; font-weight: 900;">로그아웃</a>

				</c:if>
			</div>

		</div>

	</div>
	<script>
		$(".g-box").each(function() {

			// 개별적으로 Wheel 이벤트 적용 mousewheel(IE/chrome/opera) DOMMouseScroll(FF)
			$(this).on("mousewheel DOMMouseScroll", function(e) {
				e.preventDefault();
				var delta = 0;
				/* IE */
				if (!event)
					event = window.event;
				//휠에 대한 정보 얻기 파이어폭스 외 IE/Chrome/Opera = wheelDelta
				if (event.wheelDelta) {
					delta = event.wheelDelta / 120;
					//평균 50~120 사이로 요소의 인식높이에 따라 다름(한 화면(height100%)기준일떄는 120
					if (window.opera)
						delta = -delta;
					//휠에 대한 정보 얻기 Mozilla FF = detail
				} else if (event.detail)
					delta = -event.detail / 3;
				var moveTop = null;
				// 마우스휠을 위에서 아래로
				if (delta < 0) {
					console.log("next : "+$(this).next());
					if ($(this).next() != undefined) {

						$(".down-img>img").css("display","flex");
						moveTop = $(this).next().offset().top;
						console.log(moveTop);
					}
					if ($(this).next()== Object) {
						$(".down-img>img").css("display","none");
						moveTop = 0;
						console.log(moveTop);
					}
					// 마우스휠을 아래에서 위로
				} else {
					if ($(this).prev() != undefined) {
						moveTop = $(this).prev().offset().top;
					}
				}
				if (moveTop == null) {
				}

				// 화면 이동 0.8초(800)
				$("html,body").stop().animate({
					scrollTop : moveTop + 'px'

				}, {
					duration : 300,
					complete : function() {
						console.log("여기여기");
					}
				});

			});
		});
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
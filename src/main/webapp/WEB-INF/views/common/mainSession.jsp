<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="/resources/css/default.css">
<link rel="stylesheet" href="/resources/css/main/main.css">
</head>
<style>
	* Make the image fully responsive */
  .carousel-inner img {
    width: 100%;
    height: 100%;
  }
</style>
<body>
	<header>
	<!-- Carousel -->
	<div id="demo" class="carousel slide" data-bs-ride="carousel">

		<!-- Indicators/dots -->
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#demo" data-bs-slide-to="0"
				class="active"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
		</div>

		<!-- The slideshow/carousel -->
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="/resources/img/main/2.png" alt="Los Angeles" class="d-block"
					style="width:100%;max-height: 80vh;">
				<div class="carousel-caption">
					<h4 class="text-black" style="font-weight: bold;">프로젝트에 지원하여 팀원으로 함께하세요!</h4>
					<p><a href="/recruitTeamMember_mainPage.do?reqPage=1" class="btn btn-my">팀원모집</a></p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="/resources/img/main/1.png" alt="Chicago" class="d-block h-50"
					style="width: 100%;max-height: 80vh;">
				<div class="carousel-caption">
					<h4 class="text-white" style="font-weight: bold;">고수와 함께 개발을 해보세요!</h4>
					<p><a href="/gosuMain.do" class="btn btn-my2">'고수'의 노하우</a></p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="/resources/img/main/3.png" alt="New York" class="d-block h-50" 
				style="width: 100%;max-height: 80vh;">
				<div class="carousel-caption">
					<h4 class="text-white" style="font-weight: bold;">지원하고, 구해보세요!</h4>
					<p><a href="jobSearchList.do?reqPage=1" class="btn btn-my3">구인구직</a></p>
				</div>
			</div>
		</div>

		<!-- Left and right controls/icons -->
		<button class="carousel-control-prev" type="button"
			data-bs-target="#demo" data-bs-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#demo" data-bs-slide="next">
			<span class="carousel-control-next-icon"></span>
		</button>
	</div>
	</header>
	<div class="container">
		<div class="container-fluid mt-3">
			<h3>Carousel Example</h3>
			<p>The following example shows how to create a basic carousel with
				indicators and controls.</p>
		</div>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	</div>
</body>
</html>
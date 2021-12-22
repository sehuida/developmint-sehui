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
<link rel="stylesheet" href="/resources/css/projectTeam/recruitMember.css">
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
	<!-- Carousel 끝 -->
	<div class="topLangNavi">
		<div class="container-fluid mt-3 languageNavi">
			<h3><a href="/recruitTeamMember_mainPage.do?reqPage=1" class="de-non">팀 프로젝트 모집</a></h3>
			<p style="padding: 0;margin: 0;">프로젝트 팀장이 될수도, 팀원이 될 수 있어요. </p>
			<p>프로젝트 팀장은 당신을 찾고있습니다! 필요한 언어를 선택하여 팀원으로 참가하세요.</p>
		</div>
	</div>
	<div class="container">
		<!-- 인기순 프로젝트 리스트 출력 -->
		<!-- 인기순 프로젝트 리스트 출력  끝 -->
		
		<!-- 개발지식 공유 리스트 1-5까지 리스트 출력 -->
		<!-- 개발지식 공유 리스트 1-5까지 리스트 출력  끝-->
		
		<!-- 고수 소개 얼굴만 최신 등록 5명 출력 -->
		<!-- 고수 소개 얼굴만 최신 등록 5명 출력 -->
		
		<!-- 구인구직 5가지 출력 -->
		<!-- 구인구직 끝-->
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	</div>
	<div class="topLangNavi">
		<div class="container-fluid mt-3 languageNavi">
			<h3 class="text-primary"><a href="/contestMain.do" class="de-non">공모전</a></h3>
			<p>상금이 걸린 공모전에 참가해보세요! 당신의 재능을 첨부하면 됩니다.</p>
		</div>
	</div>
	<div class="container">
		<!-- 인기순 프로젝트 리스트 출력 -->
		<!-- 인기순 프로젝트 리스트 출력  끝 -->
		
		<!-- 개발지식 공유 리스트 1-5까지 리스트 출력 -->
		<!-- 개발지식 공유 리스트 1-5까지 리스트 출력  끝-->
		
		<!-- 고수 소개 얼굴만 최신 등록 5명 출력 -->
		<!-- 고수 소개 얼굴만 최신 등록 5명 출력 -->
		
		<!-- 구인구직 5가지 출력 -->
		<!-- 구인구직 끝-->
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	</div>
	<div class="topLangNavi">
		<div class="container-fluid mt-3 languageNavi">
			<h3 class="text-primary"><a href="/gosuMain.do" class="de-non">'고수'의 노하우</a></h3>
			<p>개발 고수와 매칭하여 고수의 노하우를 물어보세요!</p>
		</div>
	</div>
	<div class="container">
		<!-- 인기순 프로젝트 리스트 출력 -->
		<!-- 인기순 프로젝트 리스트 출력  끝 -->
		
		<!-- 개발지식 공유 리스트 1-5까지 리스트 출력 -->
		<!-- 개발지식 공유 리스트 1-5까지 리스트 출력  끝-->
		
		<!-- 고수 소개 얼굴만 최신 등록 5명 출력 -->
		<!-- 고수 소개 얼굴만 최신 등록 5명 출력 -->
		
		<!-- 구인구직 5가지 출력 -->
		<!-- 구인구직 끝-->
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	</div>
	<div class="topLangNavi">
		<div class="container-fluid mt-3 languageNavi">
			<h3 class="text-primary"><a href="/jobSearchList.do?reqPage=1" class="de-non">구인구직</a></h3>
			<p>인재를 구하고, 세상을 지배하세요!</p>
		</div>
	</div>
	<div class="container">
		<!-- 인기순 프로젝트 리스트 출력 -->
		<!-- 인기순 프로젝트 리스트 출력  끝 -->
		
		<!-- 개발지식 공유 리스트 1-5까지 리스트 출력 -->
		<!-- 개발지식 공유 리스트 1-5까지 리스트 출력  끝-->
		
		<!-- 고수 소개 얼굴만 최신 등록 5명 출력 -->
		<!-- 고수 소개 얼굴만 최신 등록 5명 출력 -->
		
		<!-- 구인구직 5가지 출력 -->
		<!-- 구인구직 끝-->
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	</div>
	<div class="topLangNavi">
		<div class="container-fluid mt-3 languageNavi">
			<h3 class="text-primary" ><a href="/shareList.do?reqPage=1&type=1" class="de-non">개발지식공유 커뮤니티</a></h3>
			<p>개발자들의 개발지식 공유 커뮤니티 입니다. 당신의 개발지식을 공유하세요!!</p>
		</div>
	</div>
	<div class="container">
		<!-- 인기순 프로젝트 리스트 출력 -->
		<!-- 인기순 프로젝트 리스트 출력  끝 -->
		
		<!-- 개발지식 공유 리스트 1-5까지 리스트 출력 -->
		<!-- 개발지식 공유 리스트 1-5까지 리스트 출력  끝-->
		
		<!-- 고수 소개 얼굴만 최신 등록 5명 출력 -->
		<!-- 고수 소개 얼굴만 최신 등록 5명 출력 -->
		
		<!-- 구인구직 5가지 출력 -->
		<!-- 구인구직 끝-->
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	</div>
</body>
</html>
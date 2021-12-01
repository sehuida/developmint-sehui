<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업소개</title>
</head>
<style>
	.companyInfoHeader{
		width: 1000px;
		margin: 0 auto;
		margin-top: 80px;
		margin-bottom: 50px; 
		text-align: center;
	}
	.companyImg{
		display: inline-block;		
	}
	.companyImg>img{
		width: 130px;
		height: 30px;
	}
	.companyTitle{
		display: inline-block;
		margin-left: 15px;
		font-size: 24px;
		font-weight: 900;
	}
	.intro{
		margin-left: 20px;
		color: rgb(78, 205, 196);
		font-weight: 900;
	}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container">
		<div class="companyInfoHeader">
			<div class="companyImg">				<!-- 공고 1개만 가능하면 걍 두고 여러개 가능하면 forEach로 여러개 해줘야댐 -->
				<img src="resources/img/jobSearch/Develomint_logo.png">	<!-- 나중에 업로드이미지로 바꿔주기 -->
			</div>
			<div class="companyTitle">
				<p>(주)디벨로민트</p>
			</div>
		</div>
		<div class="intro">
			<p>기업소개</p>		
		</div>
		<hr>
		<div class="announce">
			<p>채용중 공고</p>
		</div>
		<div class="announceBox">
			<div class="status">
				<p>모집중</p>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
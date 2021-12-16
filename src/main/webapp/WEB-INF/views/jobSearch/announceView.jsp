<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.header{
		width: 1200px;
		padding-left: 200px;
		padding-bottom: 50px;
		overflow: hidden;
	}
	.announceTitle{
		margin-bottom: 0px;
		display: inline-block;
	}
	.announceTitle>p{
		margin-bottom: 0px;
		font-size: 25px;
		font-weight: bold;
		display: inline-block;
	}
	.companyName{
		color: #57595b;
		margin-left: 10px;
	}
	.applicationBtn{
		display: inline-block;
		width: 100px;
		text-align: center;
		padding: 15px 0px;
		float: right;
		background-color: rgb(78, 205, 196);
		color: white;
		font-weight: bold;
		border-radius: 5px;
		cursor: pointer;
	}
</style>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		회사상세뷰
		<div class="header">
			<div class="announceTitle">
				<p>${a.announceTitle }</p>
			</div>
			<div class="applicationBtn">
				<a>지원하기</a>
			</div>
			<div class="companyName">
				<small>${a.companyName }</small>
			</div>
		</div>
		<hr>
		<em>요약</em>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
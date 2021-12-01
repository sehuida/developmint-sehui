<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#mainTitel{
	font-size: 30px;
	font-weight: bold;
	margin-bottom: 30px;
	margin-top: 50px;
}
.bi{
	color:#4ECDC4;
	font-size: 30px;
}
.contestTitle{
	font-size: 30px;
	font-weight: bold;
}
.contestInfoBox>img{
	float: left;
}
.contestInfoBox>div{
	margin-left: 20px;
	border-top : 1px solid #d9d9d9;
	border-bottom : 1px solid #d9d9d9;
}
.contestInfoBox{
	overflow: hidden;
}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container" style="margin-bottom: 100px; margin-left: 400px;">
		<p id="mainTitel">공모전 상세보기</p>
		<div class="contestTitle" style="margin-top:55px;">
			<p><i class="bi bi-caret-right-fill"></i> 스마트 톡톡 코밍 공모전</p>
		</div>
		<div class="contestInfoBox">
			<img src="/resources/img/contest/contest_test.png" width="450px;" height="500px;">
			<div>
				주최 : 어쩌구 저쩌구
				
			</div>
		</div>
		
		
		
		
		
		
	</div>
	
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
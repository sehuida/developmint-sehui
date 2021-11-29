<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#dashboard{
	font-size: 25px;
}
.todayInfo{
	display: flex;
	justify-content: space-around;
}
.todayInfo>div{
	border : 1px solid #e9e9e9;
	width: 250px;
	text-align: center;
}
.boxLine{
	border : 1px solid #e9e9e9;
	width: 200px;
	margin: 0 auto;
}
.todayInfo>div>p{
	font-size: 20px;
	font-weight: bold;
	margin-top:15px;
}
.todayInfo>div>span:first-of-type {
	font-size: 20px;
	margin-top: 15px;
	margin-bottom: 15px;
	display: inline-block;
}
#today{
	font-weight: bold;
	margin-bottom : 30px;
}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container" style="margin-top:100px">
		<p id="dashboard" style="font-weight:bold">대시보드</p>
		<br><br><br>
		
		<p id="today">TODAY ${today }</p>
		<div class="todayInfo">
			<div>
				<p>총 회원</p>
				<div class="boxLine"></div>
				<span>100</span><span> 명</span>
			</div>
			<div>
				<p>가입 회원</p>
				<div class="boxLine"></div>
				<span>100</span><span> 명</span>
			</div>
			<div>
				<p>탈퇴 회원</p>
				<div class="boxLine"></div>
				<span>100</span><span> 명</span>
			</div>
			<div>
				<p>총회원</p>
				<div class="boxLine"></div>
				<span>100</span><span> 명</span>
			</div>
		</div>
		
		
		
	</div>
</body>
</html>
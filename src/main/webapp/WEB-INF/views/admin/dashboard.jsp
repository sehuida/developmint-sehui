<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.mainCate{
	display:flex;
}
#dashboard{
	font-size: 25px;
	line-height: 46px;
}
.bi{
	font-size:30px;
}
.todayInfo{
	display: flex;
	justify-content: space-around;
}
.todayInfo>div{
	border : 2px solid #d9d9d9;
	width: 250px;
	text-align: center;
	border-radius: 5px;
	box-shadow: 0px 0px 10px 5px #e9e9e9;
	
}
.boxLine{
	border : 1px solid #d9d9d9;
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
	font-weight: bold;
}
.title{
	font-weight: bold;
	margin-bottom : 30px;
}
.cate2Box{
	display: flex;
}
.joinDelete{

}


</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container" style="margin-top:100px">
	
		<div class="mainCate">
		<a href="#" class="cateAtag" onclick="history.go(-1)"><i class="bi bi-chevron-left"></i></a> 
		<span id="dashboard" style="font-weight:bold">대시보드</span>
		</div>
		<br><br><br>
		
		<%-- 오늘 사이트 현황 --%>
		<p class="title">TODAY ${today }</p>
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
				<p>총 게시물</p>
				<div class="boxLine"></div>
				<span>100</span><span> 명</span>
			</div>
		</div>
		
		<%--회원 가입/탈퇴현황 + 공지사항 최신글 --%>
		<div class="cate2Box">
			<div class="joinDelete">
			<p class="title" style="margin-top:100px;">회원 가입/탈회 현황</p>
			</div>
		</div>
		
	</div>
</body>
</html>
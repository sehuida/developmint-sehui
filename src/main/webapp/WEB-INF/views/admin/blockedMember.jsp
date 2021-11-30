<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeveloMint 차단회원 관리</title>
</head>
<style>
.mainCate{
	display:flex;
}
#blockedMember{
	font-size: 25px;
	line-height: 46px;
}
.bi{
	font-size:30px;
}
span{
	font-weight: bold;
	font-size: 19px;
}
#blockedCount{
	color : #4ECDC4
}
.bi-check2-square{
	font-size: 19px;
	margin-right: 5px;
}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container" style="margin-top:50px;margin-bottom:100px;">
		<div class="mainCate">
		<a href="#" class="cateAtag" onclick="history.go(-1)"><i class="bi bi-chevron-left"></i></a> 
		<span id="blockedMember" style="font-weight:bold">차단 회원 조회</span>
		</div>
		<br><br><br>
		<span>총 차단 회원 </span><span id="blockedCount">55</span><span> 명</span>
		<form action="/searchBlockedMember.do" method="post">
			
		</form>
		<form action="/unblockMember.do" method="post">
		<table class="table" style="margin-top:20px;"> 
			<tr>
				<th><input type="checkbox"></th>
				<th>No.</th>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>마지막 신고일</th>
				<th>내용보기</th>
			</tr>
			<c:forEach varStatus="i" begin="1" end="10">
				<tr>
					<td><input type="checkbox"></td>
					<td>${i.count }</td>
					<td>user01</td>
					<td>김수현</td>
					<td>user1@gmail.com</td>
					<td>2021-11-30</td>
					<td><button type="button" class="btn btn-primary btn-sm">자세히</button></td>
				<tr>
			</c:forEach>
		</table>
		<button type="button" class="btn btn-outline-primary"><i class="bi bi-check2-square"></i>차단 해제</button>
		</form>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>

















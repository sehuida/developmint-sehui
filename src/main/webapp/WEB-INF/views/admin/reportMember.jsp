<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 회원 조회</title>
</head>
<style>
.mainCate{
	display:flex;
}
#reportMember{
	font-size: 25px;
	line-height: 46px;
}
.bi{
	font-size:30px;
}
.reportBox{
	display: flex;
	margin-bottom: 30px;
}
.reportList>div>div{
	border: 1px solid #d9d9d9;
	width: 500px;
	padding: 15px;
	margin-bottom: 10px;
}
.reportContent{
	margin-left:20px;
	border: 1px solid #d9d9d9;
	padding: 20px;
}
.reportList>div>div>p{
	font-weight: bold;
}
.reportDate{
	float: right;
	margin-right: 7px;
}
.rc_title{
	font-weight: bold;
	font-size: 20px;
}
.spanBox{
	text-align: center;
	font-weight: bold;
}
.btnBox{
	text-align: center;
	margin-top: 15px;
}
.reportMember{
	margin-left:20px;
	border: 1px solid #d9d9d9;
	padding: 20px;
}
.badge-primary{
	background-color: #78c2ad;
}
.badge-secondary{
	background-color: #f3969a;
}


</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container" style="margin-top:50px;margin-bottom:100px;">
		<div class="mainCate">
		<a href="#" class="cateAtag" onclick="history.go(-1)"><i class="bi bi-chevron-left"></i></a> 
		<span id="reportMember" style="font-weight:bold">신고 회원 조회</span>
		</div>
		<br><br><br>
		
		<div class="reportBox">
			<div class="reportList">
				<div style="height: 650px;">
					<c:forEach items="${reportList }" var="r" varStatus="i">
					<div class="selectBox">
					<c:choose>
						<c:when test="${r.reportReason == 1 }">
							<p>영리목적/홍보성</p>
						</c:when>
						<c:when test="${r.reportReason == 2 }">
							<p>음란성/선정성</p>
						</c:when>
						<c:when test="${r.reportReason == 3 }">
							<p>불법정보</p>
						</c:when>
						<c:when test="${r.reportReason == 4 }">
							<p>같은 내용 반복 게시(도배)</p>
						</c:when>
						<c:when test="${r.reportReason == 5 }">
							<p>욕설/인신공격</p>
						</c:when>
						<c:when test="${r.reportReason == 6 }">
							<p>개인정보누출</p>
						</c:when>
						<c:when test="${r.reportReason == 7 }">
							<p>기타</p>
						</c:when>
					</c:choose>
						<span>${memberId[i.index] }</span><span class="reportDate">${r.reportDate }</span>
					</div>
					</c:forEach>
				</div>
				<div id="pageNavi" style="text-align: center; margin-top:50px; border: 0px"  >${pageNavi }</div>
			</div>
			<c:forEach items="${reportList }" var="r" varStatus="i">
			<div class="reportContent" style="display:none">
				<div>
					<p class="rc_title">신고회원 확인</p>
					<br>
					<p>신고자 : ${r.reporterId }</p>
					<p>신고당한 회원 : ${memberId[i.index] }</p>
					<p>신고일 : ${r.reportDate }</p>
					<br>
					<br>
					<p class="rc_title">신고사유</p>
					<br>
					<c:choose>
						<c:when test="${r.reportReason == 1 }">
							<p>영리목적/홍보성</p>
						</c:when>
						<c:when test="${r.reportReason == 2 }">
							<p>음란성/선정성</p>
						</c:when>
						<c:when test="${r.reportReason == 3 }">
							<p>불법정보</p>
						</c:when>
						<c:when test="${r.reportReason == 4 }">
							<p>같은 내용 반복 게시(도배)</p>
						</c:when>
						<c:when test="${r.reportReason == 5 }">
							<p>욕설/인신공격</p>
						</c:when>
						<c:when test="${r.reportReason == 6 }">
							<p>개인정보누출</p>
						</c:when>
						<c:when test="${r.reportReason == 7 }">
							<p>기타</p>
						</c:when>
					</c:choose>
					<br>
					<br>
					<p class="rc_title">댓글내용</p>
					<br>
					<p>${r.commentContent }</p>
					<br><br>
					<div class="spanBox">
					<span>user999</span><span> 회원은 총 </span><span>2</span><span>번 신고를 당했습니다.</span>
					</div>
					<div class="btnBox">
					<button class="btn btn-secondary" style="width:220px; margin:3px">신고 반려</button> <button class="btn btn-primary" style="width:220px; margin:3px">신고 처리</button>
					<button class="btn btn-outline-primary"style="width:450px; margin-top:10px">허위 신고</button> 
					</div>
				</div>
			</div>
			</c:forEach>
		</div>	
		<div class="reportMember">
				<div>
					<p class="rc_title">최근 처리 내역</p>
					<table class="table">
						<tr>
							<th>처리상태</th>
							<th>신고자</th>
							<th>신고당한 회원</th>
						</tr>
						<tr>
							<td><span class="badge badge-primary">신고처리</span></td>
							<td>user01</td>
							<td>user99</td>
						</tr>
						<tr>
							<td><span class="badge badge-secondary">신고반려</span></td>
							<td>user01</td>
							<td>user99</td>
						</tr>
						<tr>
							<td><span class="badge badge-light" style="color:#78c2ad; border:1px solid #78c2ad">허위신고</span></td>
							<td>user01</td>
							<td>user99</td>
						</tr>
					</table>
				</div>
			</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	 <script>
	 	$(".selectBox").click(function(){
	 		var index = $(this).index();
	 		$(".selectBox").css("border-left","1px solid #d9d9d9");
	 		$(".selectBox").eq(index).css("border-left","7px solid #4ECDC4");
	 	});
	 	 $(".selectBox").eq(0).trigger("click");
	 	 
	 	 $(".reportBox").click(function(){
	 		var index = $(this).index();
	 		$(".reportContent").eq(index).css("display","block");
	 	 })
	 </script>
</body>
</html>
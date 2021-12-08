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
.reportContent>div{
	margin-left:20px;
	border: 1px solid #d9d9d9;
	padding: 20px;
	padding-left: 50px;
	padding-top: 30px;
	width: 775px;
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
.btnBox>div{
	text-align: center;
	margin-top: 15px;
	display: flex;
	justify-content : center;
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
#noReport{
	border : 1px solid #d9d9d9;
	width: 1273px;
	margin-left : 20px;
	text-align: center;
	padding-top:250px;
}
#noReport>p{
	font-size: 25px;
	font-weight: bold;
}
.bi-person-x-fill{
	font-size: 70px;
	color : #4ECDC4;
}
.falseReportForm{
	text-align: center;
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
				<c:choose>
					<c:when test="${totalCount != 0}">
						<div style="height: 650px;">
							<c:forEach items="${reportList }" var="r" varStatus="i">
								<c:if test="${r.reportStatus == 1 }">
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
								</c:if>
							</c:forEach>
						</div>
						<div id="pageNavi" style="text-align: center; margin-top:50px; border: 0px"  >${pageNavi }</div>
						</c:when>
						<c:otherwise>
							<div style="height: 650px;" id="noReport">
								<p><i class="bi bi-person-x-fill"></i></p>
								<p>신고된 회원이 없습니다.</p>
							</div>
						</c:otherwise>
					</c:choose>
			</div>
			<c:forEach items="${reportList }" var="r" varStatus="i">
			<div class="reportContent" style="display:none">
				<div>
					<p class="rc_title">신고회원 확인</p>
					<br>
					<p>신고자 : ${r.reporterId }</p>
					<p>신고당한 회원 : <span class="id">${memberId[i.index] }</span></p>
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
							<p>기타사유 : ${r.commentContent }</p>
						</c:when>
					</c:choose>
					<br>
					<br>
					<p class="rc_title">댓글내용</p>
					<br>
					<p>${r.commentContent }</p>
					<br><br>
					<div class="spanBox">
					<span class="rpId"></span><span> 회원은 총 </span><span class="rpCount"></span><span>번 신고를 당했습니다.</span>
					</div>
					<div class="btnBox">
					<div>
					<form action="/cancleReport.do" method="post" class="cancleReportForm">
						<button type="button" class="btn btn-secondary canselReport" style="width:220px; margin:3px">신고반려</button>
						<input type="hidden" name="reportNo" value="${r.reportNo }">
					</form> 
					<form action="/reportInsert.do" method="post" class="reportBtnForm">
						<button type="button" class="btn btn-primary reportBtn" style="width:220px; margin:3px">신고 처리</button>
						<input type="hidden" name="reportNo" value="${r.reportNo }">
					</form>
					</div>
					<form action="/falseReport.do" method="post" class="falseReportForm">
						<button type="button" class="btn btn-outline-primary falseBtn"style="width:450px; margin-top:10px">허위 신고</button>
						<input type="hidden" name="reportNo" value="${r.reportNo }">
					</form> 
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
	 		$(".reportContent").hide();
	 		var index = $(this).index();
	 		$(".reportContent").eq(index).css("display","block");
	 		var id = $(".id").eq(index).html();
	 		
	 		$.ajax({
	 			url : "/memberReportCount.do",
				type : 'post',
				data : {id:id},
				success : function(data){
					$(".rpId").html(id);
					$(".rpCount").html(data);
				
				}
	 		})
	 	});
	 	$(".selectBox").eq(0).trigger("click");
	 	 
	 	$(".canselReport").click(function(){
	 		var index = $(this).index();
	 		var checkConfirm = confirm("해당 신고를 반려처리 하시겠습니까?");
			if(checkConfirm){
				$(".cancleReportForm").eq(index).submit();	
			}
	 	})
	 	
	 	$(".reportBtn").click(function(){
	 		var index = $(this).index();
	 		var checkConfirm = confirm("해당 신고를 처리 하시겠습니까?");
			if(checkConfirm){
				$(".reportBtnForm").eq(index).submit();	
			}
	 	})
	 	 
	 	$(".falseBtn").click(function(){
	 		var index = $(this).index();
	 		var checkConfirm = confirm("해당신고를 허위신고로 처리 하시겠습니까?");
			if(checkConfirm){
				$(".falseReportForm").eq(index).submit();	
			}
	 	})
	 </script>
</body>
</html>
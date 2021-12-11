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
#searchForm{
	width: 200px;
	margin-right: 10px;
	display: inline-block;
	
}
#searchBox{
	display: flex;
	justify-content: flex-end;
}
#Modaltitle{
	margin-top:20px;
	margin-bottom:20px;
	font-size: 20px;
	font-weight: bold;
}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container" style="margin-top:50px;margin-bottom:100px;">
		<div class="mainCate">
		<a href="/adminPage.do" class="cateAtag"><i class="bi bi-chevron-left"></i></a> 
		<span id="blockedMember" style="font-weight:bold">차단 회원 조회</span>
		</div>
		<br><br><br>
		
		<%--총 차단회원 명 수 --%>
		<span>총 차단 회원 </span><span id="blockedCount">${totalCount }</span><span> 명</span>
		
		<%--아이디 검색창 --%>
		<div id="searchBox">
		<form action="/searchBlockedMember.do" method="post">
			<input type="text" name="memberId" value="아이디를 입력하세요" class="form-control" id="searchForm">
			<button class="btn btn-secondary">검색</button>
		</form>
		</div>
		
		<%--차단회원 테이블 --%>
		<form action="/unblockMember.do" method="post">
		<table class="table" style="margin-top:20px; text-align: center;"> 
			<tr>
				<th><input type="checkbox"></th>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>등급</th>
				<th>내용보기</th>
			</tr>
			<c:forEach items="${allblockedList }" var="b">
				<tr>
					<td><input type="checkbox"></td>
					<td>${b.memberId }</td>
					<td>${b.memberName }</td>
					<td>${b.email }</td>
					<c:choose>
						<c:when test="${b.memberGrade > 0 && b.memberGrade < 21 }">
							<td><img src="/resources/img/member/rank/bronze.png" width="35px" height="35px;">브론즈</td>
						</c:when>
						<c:when test="${b.memberGrade >= 21 && b.memberGrade <= 40 }">
							<td><img src="/resources/img/member/rank/silver.png" width="35px" height="35px;">실버</td>
						</c:when>
						<c:when test="${b.memberGrade >= 41 && b.memberGrade <= 60 }">
							<td><img src="/resources/img/member/rank/gold.png" width="35px" height="35px;">골드</td>
						</c:when>
						<c:when test="${b.memberGrade >= 61 && b.memberGrade <= 80 }">
							<td><img src="/resources/img/member/rank/platinum.png" width="35px" height="35px;">플레티넘</td>
						</c:when>
						<c:when test="${b.memberGrade >= 81 && b.memberGrade <= 110 }">
							<td><img src="/resources/img/member/rank/diamond.png" width="35px" height="35px;">다이아</td>
						</c:when>
						<c:when test="${b.memberGrade >= 111 && b.memberGrade <= 140 }">
							<td><img src="/resources/img/member/rank/master.png" width="35px" height="35px;">마스터</td>
						</c:when>
						<c:when test="${b.memberGrade >= 141 && b.memberGrade <= 170 }">
							<td><img src="/resources/img/member/rank/challenger.png" width="35px" height="35px;">챌린저</td>
						</c:when>
					</c:choose>
					<td><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#memberMoreModal">자세히</button></td>
				<tr>
			</c:forEach>
		</table>
		<button type="button" class="btn btn-outline-primary"><i class="bi bi-check2-square"></i>차단 해제</button>
		<div id="pageNavi" style="text-align: center; margin-top:50px;"  >${pageNavi }</div>
		</form>
		
		<!-- 차단회원 내용 Modal -->
		<div class="modal fade" id="memberMoreModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-body">
		      	<p id="Modaltitle">신고 누적 내용</p>
		      	<p>아이디 : user01</p>
		      	<p>이름 : 김수현</p>
		      	<p>이메일 : user1@gmail.com</p>
		      	<table class="table" style="margin-top: 20px;">
		      		<tr>
		      			<th>신고일</th>
		      			<th>사유</th>
		      			<th>댓글 내용</th>
		      		</tr>
		      		<c:forEach begin="0" end="4">
		      			<tr>
		      				<td>2021-11-30</td>	
		      				<td>욕설/인신공격</td>
		      				<td>어쩌구 저쩌구 심한욕</td>
		      			</tr>
		      		</c:forEach>
		      	</table>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
	
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>

















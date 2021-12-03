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
.contestInfoBox>div{
	margin-left: 150px;
	border-top : 1px solid #d9d9d9;
	border-bottom : 1px solid #d9d9d9;
	padding: 30px;
	width: 500px;
}
.contestInfoBox{
	display: flex;
	justify-content: center;
	margin-top:50px;
}
.contestInfoBox>div>p{
	font-size: 20px;

}
.contestInfoBox>div>p>span{
	font-weight: bold;
}
.contestContentBox{
	margin-top: 30px;
}
.contestContentBox>p{
	font-size: 25px;
	font-weight: bold;
}
#conBox{
	padding : 30px;
	border: 1px solid #d9d9d9;
	font-size: 18px;
}
.clickBtn{
	text-align: center;
}
.commentBox{
	margin-top:30px;
	border: 1px solid #d9d9d9;
	padding:20px;
	display: flex;
}
.userInfoBox{
	width: 80px;
}
.userInfoBox>p{
	text-align: center;
	margin-top: 5px;
	font-size: 19px;
	font-weight: bold;
	margin-bottom: 0px;
}
.textBox{
	margin-left: 20px;
	margin-right: 20px;
}
.textBox>textarea{
	width: 1000px;
	height: 100px;
	resize: none;
}
.comentListBox{
	margin-top:30px;
	border: 1px solid #d9d9d9;
	padding:30px;
}
.comentView>span:first-child {
	font-weight: bold;
	display:inline-block;
	width: 100px;
}
.comentView>span:nth-child(2) {
	display:inline-block;
	width: 900px;
}
.comentView>span:nth-child(3) {
	margin-right: 15px;
}
.comentView>a{
	text-decoration: none;
	color : black;
}
.comentView>form>a{
	text-decoration: none;
	color : black;
}
.reComentView>span:first-of-type {
	font-weight: bold;
	display:inline-block;
	width: 100px;
	margin-left: 20px;
}
.reComentView>span:nth-of-type(2) {
	display:inline-block;
	width: 825px;
}
.reComentView>span:nth-of-type(3) {
	margin-right: 15px;
}
.reComentView>a{
	text-decoration: none;
	color : black;
}
.reComentView>form>a{
	text-decoration: none;
	color : black;
}
.recomentBox{
	display: flex;
	align-items: center;
}
.reText{
	margin-top:20px;
	margin-bottom:20px;
	resize: none;
	height: 100px;
}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container" style="margin-bottom: 100px; margin-left: 400px;">
		<p id="mainTitel"><a href="/contestMain.do"><i class="bi bi-chevron-left"></i></a>공모전 상세보기</p>
		<div class="contestTitle" style="margin-top:55px;">
			<p>${c.contestTitle }</p>
		</div>
		<%--공모 이미지+정보 --%>
		<div class="contestInfoBox">
			<img src="/resources/img/contest/${list.contest.contestImg }" width="300px;" height="450px;">
			<div>
				<p><span>주최</span> : ${list.contest.contestHost }</p>
				<p><span>접수기간</span> : ${list.contest.contestDate } ~ ${list.contest.contestDeadline }</p>
				<c:choose>
					<c:when test="${list.contest.contestType eq 1}">
						<p><span>공모유형</span> : 기획</p>
					</c:when>
					<c:when test="${list.contest.contestType eq 2}">
						<p><span>공모유형</span> : 개발</p>
					</c:when>
					<c:otherwise>
						<p><span>공모유형</span> : 디자인</p>
					</c:otherwise>
				</c:choose>
				<p><span>참가자격</span> : ${list.contest.contestQualify }</p>
				<p><span>1등 시상금</span> : ${list.contest.contestPrize } 만원</p>
				<p><span>담당자 이메일</span> : ${list.contest.email }</p>
				<p><span>담당자 전화번호</span> : ${list.contest.phone }</p>
				<p><span>조회수</span> : ${list.contest.contestCount } 회</p>
				<%--신청인원은 추후 데이터 가져올 예정 --%>
				<p><span>신청인원</span> : 30 명</p>
			</div>
		</div>
		<%--공모 요강 --%>
		<div class="contestContentBox">
			<p><i class="bi bi-check2"></i> 공모요강</p>
			<div id="conBox">
				<p>${list.contest.contestContentBr }</p>
				<%--공모 신청 버튼 --%>
				<div class="clickBtn">
					<button class="btn btn-primary btn-lg btn-block" style="margin-top:20px; width: 300px; ">공모 신청</button>
				</div>
			</div>
		</div>
		
		<%--댓글창 --%>
		<%--댓글 입력 창(로그인했을 때 띄우기) --%>
		<c:if test="${not empty sessionScope.m.memberId }">
			<form action="/insertContestComment.do" method="post">
				<div class="commentBox">
					<div class="userInfoBox">
						<img src="/resources/img/userTestImg.png" width="80px;" height="75px;">
						<p>${sessionScope.m.memberId }</p>
					</div>
					<div class="textBox" >
						<textarea class="form-control" name="commentContent"></textarea>
					</div>
					<div>
						<input type="submit" value="등록" class="btn btn-outline-primary" style="height: 100px; width: 100px; font-weight: bold">
					</div>
				</div>
				<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
				<input type="hidden" name="boardNo" value="${list.contest.contestNo }">
				<input type="hidden" name="boardType" value="1">
				<input type="hidden" name="commentType" value="1">
			</form>
		</c:if>
		
		<%--댓글리스트 --%>
		<div class=comentListBox>
			<c:choose>
			<%--댓글이 있는경우 --%>
			<c:when test="${not empty list.commentList }">
				<c:forEach items="${list.commentList }" var="cl" varStatus="i">
					<div style="margin-bottom: 20px;">
						<c:if test="${cl.commentType eq 1 }">
							<div class="comentView">
								<span>${cl.memberId }</span>
								<span>
								${cl.commentContent }
								<a href="javascript:void(0)" class="reComentBtn"><i class="bi bi-chat-dots-fill" style="font-size: 20px"></i></a>
								</span>
								<span>${cl.regDate }</span>
								<%--로그인했을 때만 보여주기 --%>
								<c:if test="${not empty sessionScope.m }">
									<%--내가 쓴 댓글일 경우만 보여주기 --%>
									<c:if test="${cl.memberId eq sessionScope.m.memberId }">
										<a href="#" data-bs-toggle="modal" data-bs-target="#updateComment${i.index }">수정</a>
							
											<%--댓글 수정  Modal --%>
											<div class="modal fade" id="updateComment${i.index }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
											  <div class="modal-dialog  modal-dialog-centered">
											    <div class="modal-content">
											      <div class="modal-body">
											      	<form action="/updateContestComment.do" method="post">
											      	<textarea class="form-control reText" name="commentContent">${cl.commentContent }</textarea>
											      	<input type="hidden" value="${cl.commentNo }" name="commentNo">
											      	<input type="hidden" value="${cl.boardNo }" name="boardNo">
											      	<div style="text-align: right; ">
											      	<button type="submit" class="btn btn-primary">수정</button>
											        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
											        </div>
											        </form>
											      </div>
											    </div>
											  </div>
											</div>
										
										<%--댓글 삭제 --%>
										<form action="/deleteContestComment.do" method="post" class="delForm" style="display: inline;">
											<a href="javascript:void(0);" class="delComment">삭제</a>
											<input type="hidden" value="${cl.commentNo }" name="commentNo">
											<input type="hidden" value="${cl.boardNo }" name="boardNo">
										</form>
									</c:if>
									
									<%--댓글 신고 --%>
									<a href="#"><i class="bi bi-exclamation-circle-fill" style="font-size: 20px;color:#f3969a;"></i></a>
								</c:if>
							</div>
							<%--대댓글 작성 창 --%>
							<form action="/insertContestComment.do" method="post">
								<div class="recomentBox">
									<textarea class="form-control reText" name="commentContent"></textarea>
									<input type="submit" value="등록" class="btn btn-outline-primary" style="height: 100px; width: 80px; font-weight: bold; margin-left:10px; margin-right: 10px">
									<input type="button" value="취소" class="btn btn-outline-secondary cancelBtn" style="height: 100px; width: 80px; font-weight: bold">
									<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
									<input type="hidden" name="boardNo" value="${list.contest.contestNo }">
									<input type="hidden" name="boardType" value="1">
									<input type="hidden" name="commentType" value="2">
									<input type="hidden" name="commentRef" value="${cl.commentNo }">
								</div>
							</form>
							</c:if>
							<%--대댓글 리스트 --%>
							<c:forEach items="${list.commentList }" var="rl" varStatus="j">
								<c:if test="${rl.commentType eq 2 && cl.commentNo eq rl.commentRef}">
									<div class="reComentView">
									<i class="bi bi-arrow-return-right" style="margin-left:20px;"></i>
										<span>${rl.memberId }</span>
										<span>
										${rl.commentContent }
										</span>
										<span>${rl.regDate }</span>
										<%--로그인했을 때만 보여주기 --%>
										<c:if test="${not empty sessionScope.m }">
											<%--내가 쓴 댓글일 경우만 보여주기 --%>
											<c:if test="${rl.memberId eq sessionScope.m.memberId }">
												<a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#updateReComment${j.index }" class="updateBtn">수정</a>
												
												<%--댓글 수정  Modal --%>
												<div class="modal fade" id="updateReComment${j.index }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
												  <div class="modal-dialog  modal-dialog-centered">
												    <div class="modal-content">
												      <div class="modal-body">
												      	<form action="/updateContestComment.do" method="post">
												      	<textarea class="form-control reText" name="commentContent">${rl.commentContent }</textarea>
												      	<input type="hidden" value="${rl.commentNo }" name="commentNo">
												      	<input type="hidden" value="${rl.boardNo }" name="boardNo">
												      	<div style="text-align: right; ">
												      	<button type="submit" class="btn btn-primary">수정</button>
												        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
												        </div>
												        </form>
												      </div>
												    </div>
												  </div>
												</div>
												
												<%--댓글 삭제 --%>
												<form action="/deleteContestComment.do" method="post" class="delForm" style="display: inline;">
													<a href="javascript:void(0);" class="delComment">삭제</a>
													<input type="hidden" value="${rl.commentNo }" name="commentNo">
												    <input type="hidden" value="${rl.boardNo }" name="boardNo">
												</form>
											</c:if>
										<a href="#"><i class="bi bi-exclamation-circle-fill" style="font-size: 20px;color:#f3969a;"></i></a>
										</c:if>
									</div>
								</c:if>
							</c:forEach>
						</div>
				</c:forEach>	
			</c:when>
			<%--댓글이 없는경우 --%>
			<c:otherwise>
				<div style="text-align: center">
					<p><i class="bi bi-chat-square-dots" style="font-size: 35px; display:inline-block;"></i></p>
					<p style="font-weight: bold">등록된 댓글이 없습니다. 댓글을 남겨보세요!</p>
				</div>
			</c:otherwise>
			</c:choose>
		</div>
	</div>
	
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	
	<script>
		$(".reComentBtn").click(function(){
			var index = $(".reComentBtn").index(this);
			$(".recomentBox").eq(index).toggle();
		});
		$(".reComentBtn").trigger('click');
		
		$(".cancelBtn").click(function(){
			var index = $(".cancelBtn").index(this);
			$(".recomentBox").eq(index).css("display","none");
		});
		
		$(".delComment").click(function(){
			var result = confirm('댓글을 삭제하시겠습니까?');
			var index = $(".delComment").index(this);
			if(result){
				$(".delForm").eq(index).submit();
			}
		});
		

		 
	</script>
</body>
</html>












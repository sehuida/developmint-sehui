<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공모전 상세보기</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<style>
.container {
   min-width: 1200px; 
}
#mainTitel{
	font-size: 30px;
	font-weight: bold;
	margin-bottom: 30px;
	margin-top: 50px;
}
.bi{
	
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
	align-items: center;
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
	width: 1020px;
	height: 100px;
	resize: none;
}
.comentListBox{
	margin-top:30px;
	border: 1px solid #d9d9d9;
	padding:30px;
	padding-bottom: 20px;
}

.commentImgBox{
	display:inline-block;
	width: 100px;
	text-align: center;
}
.iddate{
	display:inline-block;
	width: 100px;
	text-align: center;
	
}
.comentView{
	height: 73px;
	display: flex;
	align-items: center;
}
.iddate>p{
	margin : 0;
}
.iddate>p:first-child{
	font-weight: bold;
}
.iddate>p:nth-of-type(2){
	font-size: 14px;
}
.comentView>span:nth-of-type(1) {
	display:inline-block;
	width: 940px;
	margin-right: 50px;
	margin-left: 10px;
}

.iddate>a{
	text-decoration: none;
	color : black;
	font-size: 14px;
}
.iddate>form>a{
	text-decoration: none;
	color : black;
	font-size: 14px;
}
.recommentImgBox {
	font-weight: bold;
	display:inline-block;
	width: 100px;
	margin-left: 20px;
	text-align: center;
}
.reComentView>span:nth-of-type(1) {
	display:inline-block;
	width: 830px;
	margin-right: 60px;
	margin-left: 10px;
}

.reComentView>a{
	text-decoration: none;
	color : black;
}
.reComentView>form>a{
	text-decoration: none;
	color : black;
}
.reComentView{
	height: 73px;
	display: flex;
	align-items: center;
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
.Modaltitle{
	font-size: 30px;
	font-weight: bold;
}
.reportBox>div>p{
	margin-bottom: 0;
	font-size:15px;
}
.reportBox>div:first-of-type>p {
	color:#606060;
	font-size: 14px;
}
.reportBox>div>p>span{
	font-weight: bold;
}
.radioChk{
	margin-right:5px;
}
.reportBox>div:nth-of-type(3)>label {
	margin-bottom:5px;
}
.reportBox>div:nth-of-type(4)>p {
	font-size: 12px;
	color:red;
}
.contestDelBox{
	display: flex;
	justify-content: space-between;
	align-items: center; 
}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container" style="margin-bottom: 100px">
		<p id="mainTitel"><a href="#" onClick="history.back()"><i class="bi bi-chevron-left"></i></a>공모전 상세보기</p>
		<div class="contestDelBox">
			<div class="contestTitle" style="margin-top:55px;">
				<p>${list.contest.contestTitle }</p>
			</div>
			
			<%--자기가 올린 공모전일 경우 삭제 가능 --%>
			<c:if test="${sessionScope.m.memberId ==  list.contest.memberId}">
				<div>
					<form action="/deleteContest.do" class="delForm">
						<button type="button" class="btn btn btn-info btn-sm delBtn">공모전 삭제하기</button>
						<input type="hidden" name="contestNo" value="${list.contest.contestNo }">
					</form>
				</div>
			</c:if>
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
				<p><span>신청인원</span> : ${enrollCount } 명</p>
			</div>
		</div>
		<%---------------------------------------------------------------------------- --%>
		<%--공모 요강 --%>
		<div class="contestContentBox">
			<p><i class="bi bi-check2" style="color:#4ECDC4;"></i> 공모요강</p>
			<div id="conBox">
				<p>${list.contest.contestContentBr }</p>
				<%--로그인 됐으면 신청가능 / 로그인 안됐으면 로그인페이지로 이동 --%>
				<c:choose>
				<c:when test="${not empty sessionScope.m }">
					<c:if test="${list.contest.contestDeadline > today }">
					<%--공모 신청 버튼 --%>
					<div class="clickBtn">
						<button class="btn btn-primary btn-lg btn-block loginClick" style="margin-top:20px; width: 300px; " data-bs-toggle="modal" data-bs-target="#contestMember">공모 신청</button>
					</div>
					<%--공모 신청  Modal --%>
					<div class="modal fade" id="contestMember" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog  modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-body">
									<form action="/insertContestMember.do" method="post" class="insertBtn">
										<p style="font-size: 25px; font-weight: bold">공모전 신청</p>
										<p style="font-size: 22px;">${list.contest.contestTitle }</p>
										<div style="border: 1px solid #d9d9d9; padding: 20px; margin-bottom: 20px;">
											<p><span style="font-weight: bold">신청자 ID</span> : ${sessionScope.m.memberId }</p>
											<p><span style="font-weight: bold">신청자 이름</span> : ${sessionScope.m.memberName }</p>
											<p><span style="font-weight: bold">신청자 전화번호</span> : ${sessionScope.m.phone }</p>
											<p><span style="font-weight: bold">신청자 E-mail</span> : ${sessionScope.m.email }</p>
											<p><span style="font-weight: bold">신청자 Git 주소</span> : </p>
											<input type="text" class="form-control" name="cmGit">
										</div>
										<div style="text-align: right; ">
											<button type="button" class="btn btn-primary contesteEnrollBtn" style="width: 100px;">신청</button>
											<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="width: 100px;">취소</button>
										</div>
										<input type="hidden" name="contestNo" value="${list.contest.contestNo }">
										<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
										<input type="hidden" name="cmStatus" value="1">
									</form>
								</div>
							</div>
						</div>
					</div>
					</c:if>
				</c:when>
				<c:otherwise>
					<c:if test="${list.contest.contestDeadline > today }">
						<div class="clickBtn">
							<a href="/loginFrm.do" class="btn btn-primary btn-lg btn-block" style="margin-top:20px; width: 300px; ">공모 신청</a>
						</div>
					</c:if>
				</c:otherwise>
					
				</c:choose>
			</div>
		</div>
		<%---------------------------------------------------------------------------- --%>
		<%--댓글창 --%>
		
		<%--댓글 입력 창(로그인했을 때 띄우기) --%>
		<c:if test="${not empty sessionScope.m.memberId }">
			<form action="/insertContestComment.do" method="post">
				<div class="commentBox">
					<div class="userInfoBox">
						<c:choose>
							<c:when test="${sessionScope.m.filepath eq null }">
								<img src="/resources/img/member/user.png" style="width: 60px; height:60px; margin-left:10px;">				
							</c:when>
							<c:otherwise>
								<img src="/resources/upload/member/${sessionScope.m.filepath }" style="width: 60px; height:60px; margin-left:10px;">
							</c:otherwise>
						</c:choose>
						<p>${sessionScope.m.memberId }</p>
					</div>
					<div class="textBox" >
						<textarea class="form-control textareaBox" name="commentContent"></textarea>
					</div>
					<div>
						<input type="submit" value="등록" class="btn btn-outline-primary commentBtn" style="height: 100px; width: 100px; font-weight: bold">
					</div>
				</div>
				<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
				<input type="hidden" name="boardNo" value="${list.contest.contestNo }">
				<input type="hidden" name="boardType" value="1">
				<input type="hidden" name="commentType" value="1">
			</form>
		</c:if>
		<%---------------------------------------------------------------------------- --%>
		
		<%--댓글리스트 --%>
		<div class=comentListBox>
			<c:choose>
			<%--댓글이 있는경우 --%>
			<c:when test="${not empty list.commentList }">
				<c:forEach items="${list.commentList }" var="cl" varStatus="i">
					<div style="margin-bottom: 20px;">
						<c:if test="${cl.commentType eq 1 }">
							<div class="comentView">
								<div class="commentImgBox">
									<c:choose>
										<c:when test="${cl.memberImg eq null }">
											<img src="/resources/img/member/user.png" style="width: 60px; height:60px;">				
										</c:when>
										<c:otherwise>
											<img src="/resources/upload/member/${cl.memberImg }" style="width: 60px; height:60px; border-radius: 50%">
										</c:otherwise>
									</c:choose>
								</div>
								<div class="iddate">
									<p>${cl.memberId }</p>
									<p>${cl.regDate }</p>
									<%--로그인했을 때만 보여주기 --%>
									<c:if test="${not empty sessionScope.m }">
										<%--내가 쓴 댓글일 경우만 보여주기 --%>
										<c:if test="${cl.memberId eq sessionScope.m.memberId }">
										<%--댓글 수정  --%>
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
									</c:if>
								</div>
								<span>
									${cl.commentContent }
									<a href="javascript:void(0)" class="reComentBtn"><i class="bi bi-chat-dots-fill" style="font-size: 20px"></i></a>
								</span>
								
								<%--로그인했을 때만 보여주기 --%>
								<c:if test="${not empty sessionScope.m }">
									<%--댓글 신고 --%>
									<a href="#" data-bs-toggle="modal" data-bs-target="#reportComment${i.index }"><i class="bi bi-exclamation-circle-fill" style="font-size: 20px;color:#f3969a;"></i></a>
									
									<%--댓글 신고  Modal --%>
									<div class="modal fade" id="reportComment${i.index }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
									  <div class="modal-dialog  modal-dialog-centered">
									    <div class="modal-content">
									      <div class="modal-body">
									      	<form action="/reportComment.do" method="post" class="reportBox">
										      	<p class="Modaltitle">신고 하기</p>
										      	<div style="border-bottom:1px solid #d9d9d9; padding:5px; margin-bottom: 30px; padding-bottom: 10px;">
										      		<p>신고는 반대 의견을 표시하는 기능이 아닙니다.</p>
										      		<p>글 작성자의 의견에 반대하는 경우 신고대신 [댓글] 기능을 사용해 주세요.</p>
										      	</div>
										      	<div style="padding:5px; margin-bottom: 20px;">
											      	<p style="margin-bottom: 5px;"><span>댓글 작성자</span> : ${cl.memberId }</p>
											      	<p><span>댓글</span> : ${cl.commentContent }</p>
										      	</div>
										      	<div style="margin-bottom: 20px; padding:5px;">
										      		<p style="margin-bottom: 10px;"><span>신고사유</span></p>
											      	<label style="margin-right: 70px;"><input type="radio" class="form-check-input radioChk" name="reportReason" value="1">영리목적/홍보성</label>
											      	<label style="margin-right: 20px;"><input type="radio" class="form-check-input radioChk" name="reportReason" value="2">음란성/선정성</label>
											      	<label><input type="radio" class="form-check-input radioChk" name="reportReason" value="3">불법정보</label><br>					      	
											      	<label style="margin-right: 8px;"><input type="radio" class="form-check-input radioChk" name="reportReason" value="4">같은 내용 반복 게시(도배)</label>
											      	<label style="margin-right: 20px;"><input type="radio" class="form-check-input radioChk" name="reportReason" value="5">욕설/인성공격</label>
											      	<label><input type="radio" class="form-check-input radioChk" name="reportReason" value="6">개인정보누출</label><br>
											      	<label><input type="radio" class="form-check-input radioChk etcBtn" name="reportReason" value="7">기타</label><br>
										      		<textarea class="form-control etc" style="resize: none;" name="reportEtc"></textarea>
										      	</div>
										      	<div style="margin-bottom: 20px; background-color: #F7F7F7; padding:10px;">
										      		<p>◈ 이용규칙에 위배되는 댓글을  5회 이상 작성한 회원은 사이트 제한 조치가 취해집니다.</p>
										      		<p>◈ 허위신고일 경우, 신고자의 서비스 활동이 제한될 수 있으니 유의하시어 신중하게 신고해 주세요.</p>
										      	</div>
										      	<div style="text-align: right;">
										      		<button type="button" class="btn btn-secondary reportBtn" style="width: 100px;">신고</button>
										        	<button type="button" class="btn btn-primary" style="width: 100px;" data-bs-dismiss="modal">취소</button>
												</div>
												<input type="hidden" name="reporterId" value="${sessionScope.m.memberId }">
												<input type="hidden" name="commentNo" value="${cl.commentNo }">
												<input type="hidden" name="reportStatus" value="1">
												<input type="hidden" name="commentContent" value="${cl.commentContent }">
												<input type="hidden" name="contestNo" value="${cl.boardNo }">
												<input type="hidden" name="commentId" value="${cl.memberId }">
									        </form>
									      </div>
										  </div>
									  </div>
									</div>	
								</c:if>
							</div>
							
							
		<%---------------------------------------------------------------------------- --%>
		
							<%--대댓글 작성 창 --%>
							<form action="/insertContestComment.do" method="post">
								<div class="recomentBox">
									<textarea class="form-control reText textareaBox" name="commentContent"></textarea>
									<c:choose>
										<c:when test="${not empty sessionScope.m }">
											<input type="submit" value="등록" class="btn btn-outline-primary" style="height: 100px; width: 80px; font-weight: bold; margin-left:10px; margin-right: 10px">
										</c:when>
										<c:otherwise>
											<input type="button" value="등록" class="btn btn-outline-primary noMember" style="height: 100px; width: 80px; font-weight: bold; margin-left:10px; margin-right: 10px">
										</c:otherwise>
									</c:choose>
									<input type="reset" value="취소" class="btn btn-outline-secondary cancelBtn" style="height: 100px; width: 80px; font-weight: bold">
									<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
									<input type="hidden" name="boardNo" value="${list.contest.contestNo }">
									<input type="hidden" name="boardType" value="1">
									<input type="hidden" name="commentType" value="2">
									<input type="hidden" name="commentRef" value="${cl.commentNo }">
								</div>
							</form>
							</c:if>
							
		<%---------------------------------------------------------------------------- --%>
							<%--대댓글 리스트 --%>
							<c:forEach items="${list.commentList }" var="rl" varStatus="j">
								<c:if test="${rl.commentType eq 2 && cl.commentNo eq rl.commentRef}">
									<div class="reComentView">
									<i class="bi bi-arrow-return-right" style="margin-left:50px; color:#4ECDC4;"></i>
										
										<div class="recommentImgBox">
											<c:choose>
												<c:when test="${rl.memberImg eq null }">
													<img src="/resources/img/member/user.png" style="width: 60px; height:60px;">				
												</c:when>
												<c:otherwise>
													<img src="/resources/upload/member/${rl.memberImg }" style="width: 60px; height:60px; border-radius: 50%">
												</c:otherwise>
											</c:choose>
										</div>
										<div class="iddate">
											<p>${rl.memberId }</p>
											<p>${rl.regDate }</p>
											<%--로그인했을 때만 보여주기 --%>
											<c:if test="${not empty sessionScope.m }">
												<%--내가 쓴 댓글일 경우만 보여주기 --%>
												<c:if test="${rl.memberId eq sessionScope.m.memberId }">
												<%--댓글 수정  --%>
													<a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#updateReComment${j.index }" class="updateBtn">수정</a>
													
													<%--댓글 수정  Modal --%>
													<div class="modal fade" id="updateReComment${j.index }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
													  <div class="modal-dialog  modal-dialog-centered">
													    <div class="modal-content">
													      <div class="modal-body">
													      	<form action="/updateContestComment.do" method="post">
													      	<textarea class="form-control reText textareaBox" name="commentContent">${rl.commentContent }</textarea>
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
											</c:if>
										</div>
										<span>
										${rl.commentContent }
										</span>
										<c:if test="${not empty sessionScope.m }">
										<a href="#" data-bs-toggle="modal" data-bs-target="#reportComment${j.index }"><i class="bi bi-exclamation-circle-fill" style="font-size: 20px;color:#f3969a;"></i></a>
										
										<%--댓글 신고  Modal --%>
										<div class="modal fade" id="reportComment${j.index }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
										  <div class="modal-dialog  modal-dialog-centered">
										    <div class="modal-content">
										      <div class="modal-body">
										      	<form action="/reportComment.do" method="post" class="reportBox">
											      	<p class="Modaltitle">신고 하기</p>
											      	<div style="border-bottom:1px solid #d9d9d9; padding:5px; margin-bottom: 10px; padding-bottom: 10px;">
											      		<p>신고는 반대 의견을 표시하는 기능이 아닙니다.</p>
											      		<p>글 작성자의 의견에 반대하는 경우 신고대신 [댓글] 기능을 사용해 주세요.</p>
											      	</div>
											      	<div style="padding:5px; margin-bottom: 10px;">
												      	<p><span>댓글 작성자</span> : ${rl.memberId }</p>
												      	<p><span>댓글</span> : ${rl.commentContent }</p>
											      	</div>
											      	<div style="margin-bottom: 20px; padding:5px;">
											      		<p style="margin-bottom: 10px;"><span>신고사유</span></p>
												      	<label style="margin-right: 70px;"><input type="radio" class="form-check-input radioChk" name="reportReason" value="1">영리목적/홍보성</label>
												      	<label style="margin-right: 20px;"><input type="radio" class="form-check-input radioChk" name="reportReason" value="2">음란성/선정성</label>
												      	<label><input type="radio" class="form-check-input radioChk" name="reportReason" value="3">불법정보</label><br>					      	
												      	<label style="margin-right: 8px;"><input type="radio" class="form-check-input radioChk" name="reportReason" value="4">같은 내용 반복 게시(도배)</label>
												      	<label style="margin-right: 20px;"><input type="radio" class="form-check-input radioChk" name="reportReason" value="5">욕설/인성공격</label>
												      	<label><input type="radio" class="form-check-input radioChk" name="reportReason" value="6">개인정보누출</label><br>
												      	<label><input type="radio" class="form-check-input radioChk etcBtn" name="reportReason" value="7">기타</label><br>
											      		<textarea class="form-control etc" style="resize: none;" name="reportEtc" ></textarea>
											      	</div>
											      	<div style="margin-bottom: 20px; background-color: #F7F7F7; padding:10px;">
											      		<p>◈ 이용규칙에 위배되는 댓글을  5회 이상 작성한 회원은 사이트 제한 조치가 취해집니다.</p>
											      		<p>◈ 허위신고일 경우, 신고자의 서비스 활동이 제한될 수 있으니 유의하시어 신중하게 신고해 주세요.</p>
											      	</div>
											      	<div style="text-align: right;">
											      		<button type="button" class="btn btn-secondary reportBtn" style="width: 100px;">신고</button>
											        	<button type="button" class="btn btn-primary" style="width: 100px;" data-bs-dismiss="modal">취소</button>
													</div>
													<input type="hidden" name="reporterId" value="${sessionScope.m.memberId }">
													<input type="hidden" name="commentNo" value="${rl.commentNo }">
													<input type="hidden" name="reportStatus" value="1">
													<input type="hidden" name="commentContent" value="${rl.commentContent }">
													<input type="hidden" name="contestNo" value="${rl.boardNo }">
													<input type="hidden" name="commentId" value="${rl.memberId }">
										        </form>
										      </div>
											  </div>
										  </div>
										</div>
										
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
					<p><i class="bi bi-chat-square-dots" style="font-size: 35px; display:inline-block; color:#4ECDC4;"></i></p>
					<p style="font-weight: bold">등록된 댓글이 없습니다. 댓글을 남겨보세요!</p>
				</div>
			</c:otherwise>
			</c:choose>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	
	<script>
	
		//글자수 제한
   		 $('.textareaBox').keydown(function(){
   			 var length = $(".textareaBox").val().length;
  			console.log(length);
  			 if($(this).val().length > 64) {
  				swal({
  	 			  title: "글자수 초과",
  	 			  text: "초과 입력 할 수 없습니다. 초과된 내용은 자동으로 삭제됩니다.",
  	 			  icon: "warning",
  	 			  buttons: true,
  	 			})
                 $(this).val($(this).val().substring(0, 64));
  			 }
   		 })
	
		//대댓글 창 토글
		$(".reComentBtn").click(function(){
			var index = $(".reComentBtn").index(this);
			$(".recomentBox").eq(index).toggle();
		});
		$(".reComentBtn").trigger('click');
		
		//대댓글창 취소 클릭시 닫히기
		$(".cancelBtn").click(function(){
			var index = $(".cancelBtn").index(this);
			$(".recomentBox").eq(index).css("display","none");
		});
		
		//댓글삭제 confirm창 띄우고 ok하면 submit
		$(".delComment").click(function(){
			var result = confirm('댓글을 삭제하시겠습니까?');
			var index = $(".delComment").index(this);
			if(result){
				$(".delForm").eq(index).submit();
			}
		});
		
		//기타버튼 선택 시 textarea 작성가능
		$("input[name=reportReason]").change(function(){
			var radioValue = $(this).val();
			if(radioValue == 7){
				$(".etc" ).attr('readonly', false);
			}else{
				$(".etc" ).attr('readonly', true);
			}	
		});
		
		//신고버튼 누르면 confirm창 띄우고 ok하면 submit
		$(".reportBtn").click(function(){
			var radioCheck = $('input[name=reportReason]').is(":checked");
			if(!radioCheck){
				alert("신고사유를 체크해주세요.");
				return;
			}
			var result = confirm('허위신고일 경우, 신고자가 불이익을 받을 수 있습니다. 신고하시겠습니까?');
			var index = $(".reportBtn").index(this);
			if(result){
				$(".reportBox").eq(index).submit();
			}
		})
		
		//로그인 안하면 댓글 작성 안됨
		$(".noMember").click(function(){
			alert("로그인 후 작성이 가능합니다.");
			location.href="/loginFrm.do";
		})
		
		//깃주소 입력 안하면 신청 안됨 + 중복 지원 막기
		$(".contesteEnrollBtn").click(function(){
			if($('input[name=cmGit]').val() == ""){
				alert("깃주소를 입력해주세요.");
				return false;
			}
			var memberId = '${sessionScope.m.memberId}';
			var contestNo = '${list.contest.contestNo}';
			$.ajax({
				url : "/duplicationCheckCon.do",
				type : 'post',
				data : {memberId:memberId, contestNo:contestNo},
				success : function(data){
					if(data > 0){
						alert("이미 지원하신 공모전 입니다");
						return false;
					}else if(data == 0){
						$(".insertBtn").submit();
					}
				}
				
			});
			
			
		})
		
		//공모전 삭제
		$(".delBtn").click(function(){
			swal({
	 			  title: "공모전 삭제",
	 			  text: "공모전을 삭제하시면 지원자들의 정보가 삭제됩니다. 그래도 삭제하시겠습니까?",
	 			  icon: "warning",
	 			  buttons: true,
	 			  dangerMode: true,
	 			})
	 			.then((willDelete) => {
	 			  if (willDelete) {
	 			   $(".delForm").submit();	
	 			  }
	 			});
		});


	</script>
</body>
</html>












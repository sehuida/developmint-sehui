<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico"/>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta charset="UTF-8">
<title>Develomints</title>
<style>
	.cateImg{
		width: 50px;
		height: 50px;
		margin-left: 30px; 
	}
	.pageCategory{
		margin-top: 50px;
	}
	.pageWrap{
		border: 2px solid #4ecdc4;
		padding: 30px;
	}
	.viewHead,.viewMember{
		padding-bottom: 10px;
		border-bottom: 1px solid #aeaeae;
	}
	.comments{
		border: 2px solid #4ecdc4;
		padding: 30px;	
	}
	.inputCommentBox{
		width: 800px;
		margin: 30px auto;	
		display: flex;
		align-items: center;
		justify-content: space-between;
	}
	.inputCommentBox>textarea{
		width: 500px;
	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container">
		<div class="pageCategory">
			<span style="font-size: 25px; font-family: NotoBold;">${sv.type }</span><img class="cateImg" src="/resources/img/shareBoard/search.png">				
		</div>
		<div class="pageWrap">
			<div class="viewHead">
				<span>${sv.boardTitle }</span><span class="badge bg-info cateBadge">${sv.type }</span>
				<i class="bi bi-chat" style="color: #4ecdc4"></i>${sv.comments }
				<i class="bi bi-suit-heart-fill" style="color: #4ecdc4"></i>${sv.likes }
				<i class="bi bi-eyeglasses" style="color: #4ecdc4"></i>${sv.readCount }
				${sv.regDate }	
			</div>
			<div class="viewMember">
				<img src="/resources/upload/member/${sv.profiles }" style="width: 30px; height: 30px; border-radius: 30px;">
				<span>${sv.memberId }</span>
				<c:choose>
					<c:when test="${sv.memberGrade >=1 && sv.memberGrade <= 20 }">
						<span><img src="/resources/img/member/rank/bronze.png" style="width: 35px; height:35px;"></span>
					</c:when>
					<c:when test="${sv.memberGrade >=21 && sv.memberGrade <= 40 }">
						<span><img src="/resources/img/member/rank/silver.png" style="width: 35px; height:35px;"></span>
					</c:when>
					<c:when test="${sv.memberGrade >=41 && sv.memberGrade <= 60 }">
						<span><img src="/resources/img/member/rank/gold.png" style="width: 35px; height:35px;"></span>
					</c:when>
					<c:when test="${sv.memberGrade >=61 && sv.memberGrade <= 80 }">
						<span><img src="/resources/img/member/rank/platinum.png" style="width: 35px; height:35px;"></span>
					</c:when>
					<c:when test="${sv.memberGrade >=81 && sv.memberGrade <= 110 }">
						<span><img src="/resources/img/member/rank/diamond.png" style="width: 35px; height:35px;"></span>
					</c:when>
					<c:when test="${sv.memberGrade >=111 && sv.memberGrade <= 140 }">
						<span><img src="/resources/img/member/rank/master.png" style="width: 35px; height:35px;"></span>
					</c:when>
					<c:when test="${sv.memberGrade >=141 && sv.memberGrade <= 170 }">
						<span><img src="/resources/img/member/rank/challenger.png" style="width: 35px; height:35px;"></span>
					</c:when>								
				</c:choose>
				<a href=#>쪽지 보내기</a><img style="width: 35px; height: 35px;" src="/resources/img/shareBoard/paper-plane.png">		
			</div>
			<div class="viewContent">
				${sv.boardContent }
			</div>
			<div class="btn-group" role="group" aria-label="Basic example">
			  <button type="button" class="btn btn-primary"><i class="bi bi-hand-thumbs-up-fill"></i>좋아요</button>
			</div>
		</div><!-- 작성글 출력문 종료 -->
		<!-- 회원만 댓글 달 수 있게 제약조건 -->
		<c:if test="${not empty sessionScope.m }">
		<form action="/insertCommentShare.do" method="post">
			<div class="inputCommentBox">
				<i class="bi bi-person-circle" style="color:#4ecdc4; font-size: 4rem;"></i>
				<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
				<input type="hidden" name="boardNo" value="${n.noticeNo }">
				<textarea name="commentContent" class="form-control" rows="3"></textarea>
				<div style="width:150px;">
					<button type="submit" class="btn btn-primary btn-lg btn-block">등록</button>					
				</div>
			</div>
		</form>			
		</c:if>
		<div class="comments"><!-- 댓글 출력문 시작 -->
			<c:forEach items="${list }" var="sc" varStatus="i">
				<c:if test="${sc.commentType eq 1 }">
					<ul class="list-group comments">
					  <li class="list-group-item d-flex justify-content-between align-items-center">
					    <i class="bi bi-person-circle" style="color:#4ecdc4; font-size: 4rem;"></i>
					    <p>${sc.memberId }</p>
					    <p>${sc.regDate }</p>
					  </li>
					  <li class="list-group-item d-flex justify-content-between align-items-center">
					   	<p>${sc.commentContent }</p>
					   	<textarea rows="2" name="commentContent" style="display: none;">${sc.commentContent }</textarea>
					   	<p class="commentBtn">
							<c:if test="${not empty sessionScope.m }">
								<c:if test="${sessionScope.m.memberId eq sc.memberId }">
									<a href="javascript:void(0)" onclick="modifyComment(this,'${nc.ncNo }','${n.noticeNo }')">수정</a>
									<a href="javascript:void(0)" onclick="deleteComment(this,'${nc.ncNo }','${n.noticeNo }')">삭제</a>
									<!-- 로그인한 회원과 출력되는 댓글 작성자가 같은지 체크 -->								
								</c:if>
								<a href="javascript:void(0)" class="recShow">답글달기</a>
								<!-- 댓글수정,삭제,대댓글달기 버튼용 로그인 체크  -->					
							</c:if>					   	
					   	</p>
						<c:if test="${not empty sessionScope.m }">
						<form action="/insertComment.do" class="recoment">
							<input type="hidden" name="ncLevel" value="2">
							<input type="hidden" name="ncWriter" value="${sessionScope.m.memberId }">
							<input type="hidden" name="noticeRef" value="${n.noticeNo }">
							<input type="hidden" name="ncRef" value="${nc.ncNo }">
							<textarea name="ncContent" class="form-control"></textarea>
							<div>
								<button type="submit" class="btn btn-outline-primary">등록</button>
								<button type="reset" class="btn btn-outline-primary recCancel">취소</button>
							</div>
						</form>							
						</c:if>
						<!-- 로그인이 되어있는 경우 대댓글 작성용 form태그 미리 생성 -->					   	
					  </li>
					</ul>				
				</c:if>
			</c:forEach>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
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
		padding: 40px;
   		border-radius: 10px;
   		box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
	}
	.viewHead,.viewMember{
		padding-top: 30px;
		padding-bottom: 30px;
		border-bottom: 1px solid #aeaeae;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	.viewHead span{
		font-size: 16px;
	}
	.viewMember>div>*{
		margin-right: 20px;
	}
	.viewHead>div:last-child>*{
		margin-right: 20px;
	}
	.comments{
		border: 2px solid #4ecdc4;
		border-radius: 10px;
		width: 1100px;
		margin: 50px auto;
		padding: 20px;
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
	.viewContent{
		padding: 20px;
	}
	.likeBtn{
		text-align: center;
	}
	.commentWrap{
		display: flex;
		justify-content: space-between;
		align-items: center;
		/*border: 1px solid #aeaeae; */
	}
	.recommentWrap{
		display: flex;
		justify-content: space-between;
		align-items: center;
		padding-left: 60px;
	}
	.commentContent{
		width: 400px;
	}
	.commentData{
		margin-left: -50px;
	}
	.commentData>*{
		margin-bottom: 5px;
	}
	.recommentForm{
		display: none;
	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container">
		<div class="pageCategory">
			<span style="font-size: 25px; font-family: NotoBold;">${sv.type }</span><img class="cateImg" src="/resources/img/shareBoard/search.png">				
		</div>
		<div class="pageWrap" style="margin-top: 50px;">
			<div class="viewHead">
				<div>
					<span style="font-weight: Bold; margin-right: 15px; font-size: 22px;">${sv.boardTitle }</span><span class="badge bg-info cateBadge">${sv.type }</span>				
				</div>
				<div>
					<i class="bi bi-chat" style="color: #4ecdc4; font-size: 1.3rem;">${sv.comments }</i>
					<i class="bi bi-suit-heart-fill" style="color: #4ecdc4; font-size: 1.3rem;">${sv.likes }</i>
					<i class="bi bi-eyeglasses" style="color: #4ecdc4; font-size: 1.3rem;">${sv.readCount }</i>
					<span class="text-muted">${sv.regDate }</span>					
				</div>
			</div>
			<div class="viewMember">
				<div>
					<c:if test="${not empty sv.profiles }">
						<img src="/resources/upload/member/${sv.profiles }" style="width: 50px; height: 50px; border-radius: 30px;">					
					</c:if>
					<c:if test="${empty sv.profiles }">
						<img src="/resources/img/member/user.png" style="width: 50px; height: 50px; border-radius: 30px;">						
					</c:if>
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
				</div>
				<div>
					<a href=#>쪽지 보내기</a><img style="width: 35px; height: 35px;" src="/resources/img/shareBoard/paper-plane.png">						
				</div>
			</div>
			<div class="viewContent">
				${sv.boardContent }
			</div>
			<div class="likeBtn">
			  <button type="button" class="btn btn-primary"><i class="bi bi-hand-thumbs-up-fill"></i>좋아요</button>
			  <c:if test="${sessionScope.m.memberId eq sv.memberId}">
			  	<!-- 수정 삭제 구현해야함-->
			  	<a href="#" class="btn btn-info">수정</a>
			  	<a href="/deleteBoard.do?boardNo=${sv.boardNo }" class="btn btn-info">삭제</a>
			  </c:if>
			</div>
		</div><!-- 작성글 출력문 종료 -->
		<!-- 회원만 댓글 달 수 있게 제약조건 -->
		<c:if test="${not empty sessionScope.m }">
		<form action="/shareInsertComment.do" method="post">
			<div class="inputCommentBox">
				<i class="bi bi-person-circle" style="color:#4ecdc4; font-size: 4rem;"></i>
				<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
				<input type="hidden" name="boardNo" value="${sv.boardNo }">
				<input type="hidden" name="commentType" value="1">
				<textarea name="commentContent" class="form-control" rows="3"></textarea>
				<div style="width:150px;">
					<button type="submit" class="btn btn-primary btn-lg btn-block">등록</button>					
				</div>
			</div>
		</form>			
		</c:if>
		<div class="comments">
			<c:forEach items="${list }" var="sc" varStatus="i">
				<c:if test="${sc.commentType eq 1 }">
					<!-- 댓글중 타입 1인것들 전체 출력하기 -->
					<div class="commentWrap">
						<div>
							<i class="bi bi-person-circle" style="color:#4ecdc4; font-size: 4rem;"></i>	
						</div>
						<div class="commentData">
							<div><span class="text-info">${sc.memberId }</span></div>
							<div>
								<span>${sc.regDate }</span>
								<!-- 로그인 시에만 대댓글 달 수 있음 -->
								<c:if test="${not empty sessionScope.m }">
								<a href="javascript:void(0)" class="recShow btn btn-secondary btn-sm">답글달기</a>
								</c:if>
							</div>
						</div>
						<div class="commentContent">
							<p>${sc.commentContent }</p>
					   		<textarea rows="2" name="commentContent" style="display: none;">${sc.commentContent }</textarea>
						</div>
						<div>
							<c:if test="${not empty sessionScope.m }">
								<button class="btn btn-danger"><i class="bi bi-cone"></i>신고하기</button>						  														
							</c:if>					  							
							<c:if test="${sessionScope.m.memberId eq sc.memberId }">
							  	<button class="btn btn-info">수정</button>		
							  	<button class="btn btn-info">삭제</button>
							</c:if>
						</div>
					</div>
					<c:if test="${not empty sessionScope.m }">
						<form action="/insertComment.do" class="recommentForm">						
							<input type="hidden" name="commentType" value="2">
							<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
							<input type="hidden" name="boardNo" value="${s.boardNo }">
							<input type="hidden" name="commentRef" value="${sc.commentNo }">
							<textarea name="commentContent" class="form-control" style="width: 70%; margin: 0 auto;"></textarea>
							<button type="submit" class="btn btn-outline-primary">등록</button>
							<button type="reset" class="btn btn-outline-danger recCancel">취소</button>
						</form>							
					</c:if>
					<!-- 로그인이 되어있는 경우 대댓글 작성용 form태그 미리 생성 -->		
				</c:if>
				<c:forEach items="${list }" var="scc" varStatus="i">
					<c:if test="${scc.commentType eq 2 && sc.commentNo eq scc.commentRef}">
						<div class="recommentWrap">
							<div>
								<i class="bi bi-arrow-return-right" style="font-size: 3rem; color: #4ecdc4; "></i>
							</div>
							<div class="commentData">
								<div><span class="text-info">${scc.memberId }</span></div>
								<div>${scc.regDate }</div>
							</div>
							<div class="commentContent">
								<p>${scc.commentContent }</p>
						   		<textarea rows="2" name="commentContent" style="display: none;">${scc.commentContent }</textarea>
							</div>
							<div>	
								<c:if test="${not empty sessionScope.m }">
									<button class="btn btn-danger"><i class="bi bi-cone"></i>신고하기</button>						  														
								</c:if>
								<c:if test="${sessionScope.m.memberId eq scc.memberId }">
								  	<button class="btn btn-info">수정</button>		
								  	<button class="btn btn-info">삭제</button>
								</c:if>
							</div>
						</div>						
					</c:if>
				</c:forEach><!-- 대댓글 반복문 끝 -->
			</c:forEach><!-- 전체댓글 반복문 끝 -->
		</div><!-- 전체 댓글 출력 -->
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<script>
//수정,삭제 onclick 이벤트로 보내주기 swalMsg 이용!

</script>
</body>
</html>
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
		border: 1px solid #aeaeae;
		width: 800px;
		margin: 0 auto;
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
			  	<a href="#" class="btn btn-info">수정</a>
			  	<a href="#" class="btn btn-info">삭제</a>
			  </c:if>
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
		<div class="comments">
			<c:forEach items="${list }" var="sc" varStatus="i">
				<c:if test="${sc.commentType eq 1 }">
					<!-- 댓글중 타입 1인것들 전체 출력하기 -->
					<div class="commentWrap">
						<div>
							<i class="bi bi-person-circle" style="color:#4ecdc4; font-size: 4rem;"></i>	
						</div>
						<div>
							<div>${sv.memberId }</div>
							<div>${sv.regDate }</div>
						</div>
						<div>
							<p>${sc.commentContent }</p>
					   		<textarea rows="2" name="commentContent" style="display: none;">${sc.commentContent }</textarea>
						</div>
						<div>
							
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
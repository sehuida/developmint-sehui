<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<link rel="stylesheet" href="/resources/css/projectTeam/recruitDetail.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Recruit Crue Detail</title>
</head>
<script>

	$(function(){
		$(".return_img").click(function(){
			$(".return_img").css("cursor", "pointer");
			history.back();
		});
	});
	
</script>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container" id="projectContainer">
		<div class="main">
            <div class="returnPage">
                <img class="return_img" src="/resources/img/recruitTeamProject/writePage/left.png">
            </div>
            <div class="main_wrap">
                <div class="titleBox">
                    <p class="titleText">${pt.RTitle }</p>
                </div>
                <div class="noticeInfoFlexBox">
                    <div class="memberInfo">
                    	<c:choose>
                    		<c:when test="${pt.writerImgPath eq null}">
                    			<img class="profileImg" src="/resources/img/recruitTeamProject/common/user.png">
                    		</c:when>
                    		<c:otherwise>
                    			<img class="profileImg" src="/resources/upload/member/${pt.writerImgPath }">
                    		</c:otherwise>
                    	</c:choose>
                        <p class="memberIdText">${pt.projectWriterId}</p>
                        <c:choose>
							<c:when test="${pt.projectWriterGrade >=1 && pt.projectWriterGrade <= 20 }">
								<img class="rankImg" src="/resources/img/recruitTeamProject/common/rank/bronze.png">
							</c:when>
							<c:when test="${pt.projectWriterGrade >=21 && pt.projectWriterGrade <= 40 }">
								<img class="rankImg" src="/resources/img/recruitTeamProject/common/rank/silver.png">
							</c:when>
							<c:when test="${pt.projectWriterGrade >=41 && pt.projectWriterGrade <= 60 }">
								<img class="rankImg" src="/resources/img/recruitTeamProject/common/rank/gold.png">
							</c:when>
							<c:when test="${pt.projectWriterGrade >=61 && pt.projectWriterGrade <= 80 }">
								<img class="rankImg" src="/resources/img/recruitTeamProject/common/rank/platinum.png">
							</c:when>
							<c:when test="${pt.projectWriterGrade >=81 && pt.projectWriterGrade <= 110 }">
								<img class="rankImg" src="/resources/img/recruitTeamProject/common/rank/diamond.png">
							</c:when>
							<c:when test="${pt.projectWriterGrade >=111 && pt.projectWriterGrade <= 140 }">
								<img class="rankImg" src="/resources/img/recruitTeamProject/common/rank/master.png">
							</c:when>
							<c:when test="${pt.projectWriterGrade >=141 && pt.projectWriterGrade <= 170 }">
								<img class="rankImg" src="/resources/img/recruitTeamProject/common/rank/challenger.png">
							</c:when>								
						</c:choose>
                    </div>
                    <div class="writeDate">
                        <b>${pt.RStartDate }</b>
                    </div>
                </div>
                <div class="noticeInfoFlexBox2">
                    <div class="userLanguage">
                        <b class="useLang">사용 언어 : </b>
                        <c:forEach items="${pdLangList }" var="li"  varStatus="i">
                        	<c:if test="${pt.projectNo eq li.projectNo }">
                        		<span class="badge rounded-pill bg-primary" id="languageIcon">${li.langName }</span>
                        	</c:if>
                        </c:forEach>
                    </div>
                    <div class="deadBtnBox">
	                    <c:if test="${sessionScope.m.memberNo eq pt.projectWriterMemberNo}">
	                    	<button type="button" class="btn btn-primary">모집 마감</button>
	                    </c:if>
                    </div>
                </div>
                <div class="line"></div>
                <div class="datailContent">
                    ${pt.RContent }
                </div>
                <div class="bottomContentFlexBox">
                    <div class="bottomContentFlexBox_btnBox">
                    	<c:choose>
                    		<c:when test="${sessionScope.m.memberNo eq pt.projectWriterMemberNo}">
                    			<c:choose>
                    				<c:when test="${pt.projectStatus == 1 }">
                    					<a href="updateRecruitFrm.do?memberNo=${pt.projectWriterMemberNo }&projectNo=${pt.projectNo}"><button type="button" class="btn btn-primary">수정</button></a>
				                        <a href="deleteRecruit.do?memberNo=${pt.projectWriterMemberNo }&projectNo=${pt.projectNo}"> <button type="button" class="btn btn-primary">삭제</button></a>
				                        <button type="button" class="btn btn-primary">지원자 관리</button>
                    				</c:when>
                    				<c:otherwise>
                    					<a href="updateRecruitFrm.do?memberNo=${pt.projectWriterMemberNo }&projectNo=${pt.projectNo}"><button type="button" class="btn btn-primary" disabled="disabled">수정</button></a>
				                        <a href="deleteRecruit.do?memberNo=${pt.projectWriterMemberNo }&projectNo=${pt.projectNo}"> <button type="button" class="btn btn-primary" disabled="disabled">삭제</button></a>
				                        <button type="button" class="btn btn-primary" disabled="disabled">지원자 관리</button>
                    				</c:otherwise>
                    			</c:choose>
                    		</c:when>
                    		<c:otherwise>
                    			<c:choose>
                    				<c:when test="${memberNo == -1 || pt.projectStatus != 1}">
                    					<button type="button" class="btn btn-primary" disabled="disabled">프로젝트 지원</button>
                    				</c:when>
                    				<c:otherwise>
                    					<button type="button" class="btn btn-primary">프로젝트 지원</button>
                    				</c:otherwise>
                    			</c:choose>
                    		</c:otherwise>
                    	</c:choose>
                    </div>
                    <div class="bottomContentFlexBox_iconBox">
                        <img class="countImg" src="/resources/img/recruitTeamProject/recruitPage/eye.png">
                        <span class="countText">${pt.viewCount }</span>
                        <c:choose>
                        	<c:when test="${memberNo == -1 }">
                        		<c:choose>
		                        	<c:when test="${pt.dibCountClickValue ne 0 }">
		                        		<img class="countImg" src="/resources/img/recruitTeamProject/common/full_hart.png">
		                        	</c:when>
		                        	<c:otherwise>
		                        		<img class="countImg" src="/resources/img/recruitTeamProject/common/empty_hart.png">
		                        	</c:otherwise>
		                        </c:choose>
                        	</c:when>
                        	<c:otherwise>
                        		<c:choose>
		                        	<c:when test="${pt.dibCountClickValue ne 0 }">
		                        		<a href="/updateDibCount.do?dibCountClickValue=${pt.dibCountClickValue}"><img class="countImg" src="/resources/img/recruitTeamProject/common/full_hart.png"></a>
		                        	</c:when>
		                        	<c:otherwise>
		                        		<a href="/updateDibCount.do?dibCountClickValue=${pt.dibCountClickValue}"><img class="countImg" src="/resources/img/recruitTeamProject/common/empty_hart.png"></a>
		                        	</c:otherwise>
		                        </c:choose>
                        	</c:otherwise>
                        </c:choose>
                        <span class="countText">${pt.dibCount }</span>
                    </div>
                </div>
                
            </div>
            <div class="commentWriteBox">
                <div class="commentTitle">
                    <p class="commentTitleText"><span>${pt.commentCount }</span>개의 댓글이 있습니다.</p>
                </div>
                <div class="form-group">
                	<c:choose>
                		<c:when test="${memberNo == -1 }">
                			<textarea class="form-control" id="exampleTextarea" rows="3" placeholder="로그인 후 작성 가능합니다." disabled="disabled"></textarea>
                		</c:when>
                		<c:otherwise>
                			<textarea class="form-control" id="exampleTextarea" rows="3" placeholder="댓글을 입력하세요."></textarea>
                		</c:otherwise>
                	</c:choose>
                </div>
                <div class="commentBtnBox">
                	<c:choose>
                		<c:when test="${memberNo == -1 }">
                			 <button type="button" class="btn btn-outline-primary" disabled="disabled">등록</button>
                		</c:when>
                		<c:otherwise>
                			 <button type="button" class="btn btn-outline-primary">등록</button>
                		</c:otherwise>
                	</c:choose>
                   
                </div>
            </div>
            <div class="commentBox">
                <div class="commmentInfoFlexBox">
                    <div class="profileImgBox">
                        <img class="profileImg" src="/resources/img/recruitTeamProject/common/user.png">
                    </div>
                    <p class="memberIdText">MemberId</p>
                    <p class="commentDate">2021-11-28 21:03</p>
                </div>
                <div class="commentContent">
                    <div class="list-group">
                        <a class="list-group-item list-group-item-action flex-column align-items-start active">
                            <p class="mb-1">AWS 내 돈 나가나요?</p>
                        </a>
                    </div>
                    <div class="updateFunction">
                        <a href="#" class="updateText">편집</a>
                        <a href="#" class="updateText">삭제</a>
                        <a href="#" class="updateText">대댓글 달기</a>
                    </div>
                    <div class="updateTextBox">
                        <div class="form-group">
                            <textarea class="form-control" id="exampleTextarea" rows="3" placeholder="댓글을 입력하세요."></textarea>
                        </div>
                        <div class="commentBtnBox">
                            <button type="button" class="btn btn-outline-primary">취소</button>
                            <button type="button" class="btn btn-outline-primary">등록</button>
                        </div>
                    </div>
                </div>
                <div class="nestedCommentFlexBox">
                    <div class="nestedCommnetImgBox">
                        <img src="/resources/img/recruitTeamProject/common/left-arrow.png" class="nestedCommnetImg">
                    </div>
                    <div class="nestedCommentBox">
                        <div class="commmentInfoFlexBox">
                            <div class="profileImgBox">
                                <img class="profileImg" src="/resources/img/recruitTeamProject/common/user.png">
                            </div>
                            <p class="memberIdText">MemberId</p>
                            <p class="commentDate">2021-11-28 21:16</p>
                        </div>
                        <div class="commentContent">
                            <div class="list-group">
                                <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                                    <p class="mb-1">네 나갑니다.</p>
                                </a>
                            </div>
                            <div class="updateFunction">
                                <a href="#" class="updateText">수정</a>
                                <a href="#" class="updateText">삭제</a>
                            </div>
                            <div class="updateTextBox">
                                <div class="form-group">
                                    <textarea class="form-control" id="exampleTextarea" rows="3" placeholder="댓글을 입력하세요."></textarea>
                                </div>
                                <div class="commentBtnBox">
                                    <button type="button" class="btn btn-outline-primary">취소</button>
                                    <button type="button" class="btn btn-outline-primary">등록</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>

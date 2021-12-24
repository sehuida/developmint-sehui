<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.applyResume{
		overflow: hidden;
		border: 3px solid rgb(78, 205, 196);
		border-radius: 30px;
		padding: 30px 20px;
	}
	.applyResume>div{
		float: left;
	}
	#pageNavi{
		display: flex;
		justify-content: center;
		margin: 50px 0px;
	}
</style>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="container" style="margin-top:50px;margin-bottom:100px;">
			<div class="mainCate">
				<span style="font-weight:bold">지원내역</span>
			</div>
			<br><br>
			<p id="unprocessed">입사 지원 수 : <span style="color: rgb(78, 205, 196);">${count }</span> 건</p>
			<%-- <c:forEach items="${list }" var="a" varStatus="i">
			<!-- table로 구성해도 될라나 -->
				<div class="applyResume">
					<div class="resumeTitle">
						${a.resumeTitle }
					</div>
					<div class="memberName">
						${a.memberName } 이슬기
					</div>
					<div class="applyDate">
						${a.applyDate }
					</div>
					<div class="status">
						<c:if test="${a.status eq 1 }">
							지원중
						</c:if> 
						<c:if test="${a.status eq 2 }">
							서류합격
						</c:if> 
						<c:if test="${a.status eq 3 }">
							탈락
						</c:if> 
					</div>
				</div>
			</c:forEach> --%>
			
			<style>
				.memberBox{
					width: 300px;
					height: 250px;
					padding: 20px 30px;
					border: 1px solid gray;
					display: inline-block;
					overflow: hidden;
					text-overflow: ellipsis;
					white-space: nowrap;
				}
				.okNo{
					text-align: center;
				}
				.resumeTitle{
					width: 208px;
					text-overflow: ellipsis;
					font-size: 18px;
				}
			</style>
			
			<!-- 수현누나꺼 가져온거 화면 다시구성해야해 -->
			<c:choose>
			<c:when test="${not empty list }">
				<div class="certiBox">
					<c:forEach items="${list }" var="a" varStatus="i">
						<div class="memberBox">
							
								<a href="/resumeView.do?resumeNo=${a.resumeNo }"></a><strong class="resumeTitle">${a.resumeTitle }</strong>
							
							<div class="infoBox">
								 <span class="infoTitle"><i class="bi bi-person-fill" style="font-size: 20px; color: #898989; margin-right: 5px;"></i>회원이름 : </span><span>${memlist[i.index].memberName }</span><br>
								 <span class="infoTitle"><i class="bi bi-envelope" style="font-size: 20px; color: #898989; margin-right: 5px;"></i>이메일 : </span><span>${memlist[i.index].email }</span><br>
								 <span class="infoTitle"><i class="bi bi-app" style="font-size: 20px; color: #898989; margin-right: 5px;"></i>상태 : </span><span>지원중</span><br>
							</div>
							<div class="okNo">
								<button class="btn btn-primary enrollBtn" style="margin-top: 20px; margin-right: 5px;">서류합격</button><button class="btn btn-secondary noEnrollBtn"  style="margin-top: 20px; margin-left: 5px;">탈락</button>
							</div>
						</div>
					</c:forEach>
				</div>
				<div id="pageNavi" style="text-align: center; margin-top:50px;"  >${pageNavi }</div>
			</c:when>
			<c:otherwise>
				<div class="noList">
					<p><i class="bi bi-chat-square-dots" style="color: #4ECDC4; font-size: 35px;"></i></p>
					<p>지원한 이력서가 없습니다.</p>
				</div>
			</c:otherwise>
		</c:choose>
			
			
			<%-- <div id="pageNavi">${pageNavi }</div> --%>
		</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
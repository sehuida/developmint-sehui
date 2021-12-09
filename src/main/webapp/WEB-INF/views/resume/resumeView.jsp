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
	.memberName{
		margin: 10px;
		font-size: 20px;
		font-weight: 900;
	}
	.info img{
		width: 16px;
		height: 16px;
	}
	.info{
		overflow: hidden;
		margin-left: 140px;
		margin-bottom: 30px;
	}
	.infoBox{
		float: left;
	}
	.infoBox>img{
		margin-left: 10px;
	}
	.infoBox>span{
		margin-left: 10px;
		color: gray;
		font-size: 13px;
	}
	.phone{
		margin-left: 20px;
	}
	.summary{
		margin: 0 auto;
		overflow: hidden;
		width: 1020px;
		padding: 30px 0px;
		background-color: rgb(250, 250, 250);
		position: relative;
	}
	.item{
		float: left;
		position: relative;
	}
	.item div{
		width: 250px;
		text-align: center;
	}
	.after:after {
		content: '';
    	display: block;
    	position: absolute;
    	left: 0;
    	width: 1px;
    	top: 10px;
    	height: 50px;
    	background-color: #888;
	}
	.header{
		color: #888;
		margin-bottom: 8px;
	}
}
	
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container">
		<div class="resumeTitle">
			<p style="font-size: 24px; color: black; font-weight: 900;">${r.resumeTitle }</p>
		</div>
			<hr>
			<div class="info">
				<div class="memberName">
					${m.memberName }
				</div>
				<div class="email infoBox">
					<img src="/resources/img/resume/mail.PNG"><span>${m.email }</span>
				</div>
				<div class="phone infoBox">
					<img src="/resources/img/resume/phone.PNG"><span>${m.phone }</span>
				</div>
			</div>
			<div class="summary">
	            <div class="item" style="margin-left: 0px;">
	                <div class="header">학력</div>
	                <div class="description ellipsis">
	               		${r.schoolName }                 
	                </div>
	            </div>
				
	            <div class="item after">
	                <div class="header">경력</div>
	                <div class="description">
						<c:if test="${r.career eq 1 }">
							<span>신입</span>
						</c:if>
						<c:if test="${r.career eq 2 }">
							<span>경력</span>
						</c:if>
					</div>
	            </div>

		        <div class="item after">
		            <div class="header">희망연봉</div>
		            <div class="description">
		            	<c:if test="${r.money eq 1 }">		<!-- 1 -> 회사내규에 따름 -->
				            <span>회사내규에 따름</span>
						</c:if>
						<c:if test="${r.money eq 2 }">		<!-- 2 -> 2000만 ~ 2400만 -->
							<span>2000만 ~ 2400만</span>
						</c:if>
						<c:if test="${r.money eq 3 }">		<!-- 3 -> 2400만 ~ 2800만 -->
						    <span>2400만 ~ 2800만</span>
						</c:if>
						<c:if test="${r.money eq 4 }">		<!-- 4 -> 2800만 ~ 3200만 -->
						    <span>2800만 ~ 3200만</span>
						</c:if>
						<c:if test="${r.money eq 5 }">		<!-- 5 -> 3200만 ~ 3600만 -->
						    <span>3200만 ~ 3600만</span>
					 </c:if>
						 <c:if test="${r.money eq 6 }">		<!-- 6 -> 3600만 ~ 4000만 -->
						    <span>3600만 ~ 4000만</span>
						</c:if>
						<c:if test="${r.money eq 7 }">		<!-- 7 -> 4000만 이상 -->
							<span>4000만 이상</span>
						</c:if>
		            </div>
		        </div>
		
		        <div class="item after">
		            <div class="header">희망근무지 / 근무형태</div>
		            <div class="description">${r.workPlace }<br>
		            	<c:if test="${r.workForm eq 1 }">		<!-- 1 -> 정규직 -->
							<span>정규직</span>
						</c:if>
						<c:if test="${r.workForm eq 2 }">		<!-- 2 -> 계약직 -->
						    <span>계약직</span>
						</c:if>
						<c:if test="${r.workForm eq 3 }">		<!-- 3 -> 아르바이트 -->
						    <span>아르바이트</span>
						</c:if>
						<c:if test="${r.workForm eq 4 }">		<!-- 4 -> 인턴 -->
						    <span>인턴</span>
						</c:if>
						<c:if test="${r.workForm eq 5 }">		<!-- 5 -> 프리랜서 -->
						    <span>프리랜서</span>
						</c:if>
		            </div>
		        </div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
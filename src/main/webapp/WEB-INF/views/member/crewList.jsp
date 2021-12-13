<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomints</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
	.page-wrap{
		width: 700px;
		margin: 0 auto;
		text-align: center;		
	}
	#pageNavi>ul{
		justify-content: center;
	}
	.page-wrap>table{
		margin-top: 100px;
		margin-bottom: 60px;
	}
	.page-top{
		display: flex;
		justify-content: space-between;
	}
	.notting{
		font-size: 25px;
		font-weight: bold;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<div class="container">
			<div class="page-wrap">
				<div class="page-top">
					<span style="text-align: left; font-family: NotoBold; font-size: 30px;">공모전 신청내역</span>
					<c:choose>
						<c:when test="${sessionScope.m.memberType eq 2 }">
							<a href="/mypageGosu.do" class="btn btn-warning" style="height: 40px;">뒤로가기</a>															
						</c:when>
						<c:otherwise>
							<a href="/mypage.do" class="btn btn-warning" style="height: 40px;">뒤로가기</a>
						</c:otherwise>
					</c:choose>
				</div>
						<table class="table table-hover">
							<tr class="table-primary">
								<th>번호</th><th>프로젝트명</th><th>모집시작일</th><th>지원결과</th>
							</tr>
							<c:forEach items="${list }" var="crew" varStatus="i">
								<tr>
									<td>${start+i.index }</td>
									<td>
										<a href="#">${crew.recruitTitle }</a>
									</td>
									<td>${crew.applyDate }</td>
									<c:choose>
										<c:when test="${crew.enrtyStatus eq 1 }">
											<td>확인중</td>
										</c:when>
										<c:when test="${crew.enrtyStatus eq 2 }">
											<td>탈락</td>
										</c:when>
										<c:when test="${crew.enrtyStatus eq 3 }">
											<td>최종대기</td>
										</c:when>
										<c:when test="${crew.enrtyStatus eq 4 }">
											<td>최종선발</td>
										</c:when>																													
									</c:choose>
								</tr>
							</c:forEach>
						</table>			
					<div id="pageNavi">
						${pageNavi }
					</div>		
			</div>
		</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
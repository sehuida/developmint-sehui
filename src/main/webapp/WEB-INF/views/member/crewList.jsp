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
<link rel="stylesheet" href="/resources/css/member/viewPages.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<div class="container">
			<div class="page-wrap">
				<div class="page-top">
					<div class="page-topImg">
						<span style="text-align: left; font-family: NotoBold; font-size: 30px;">프로젝트신청내역</span>
						<img src="/resources/img/member/multiple-users-silhouette.png" style="width: 50px; height: 50px; margin-left: 10px;">					
					</div>
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
										<a href="/selectOneNotice.do?projectNo=${crew.projectNo }&memberNo=${session.m.memberNo}">${crew.recruitTitle }</a>
									</td>
									<td>${crew.applyDate }</td>
									<c:choose>
										<c:when test="${crew.entryStatus eq 1 }">
											<td class="text-info">확인중</td>
										</c:when>
										<c:when test="${crew.entryStatus eq 2 }">
											<td class="text-danger">탈락</td>
										</c:when>
										<c:when test="${crew.entryStatus eq 3 }">
											<td class="text-warning">최종대기</td>
										</c:when>
										<c:when test="${crew.entryStatus eq 4 }">
											<td class="text-success">최종선발</td>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomints</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
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
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<div class="container">
			<div class="page-wrap">
				<div class="page-top">
					<span style="text-align: left; font-family: NotoBold; font-size: 30px;">공모전 신청내역</span>
					<a href="/mypageGosu.do" class="btn btn-warning" style="height: 40px;">뒤로가기</a>			
				</div>
					<table class="table table-hover">
						<tr class="table-primary">
							<th>번호</th><th>공모전명</th><th>마감여부</th><th>신청상태</th>
						</tr>
						<c:forEach items="${list }" var="ct" varStatus="i">
							<tr>
								<td>${start+i.index }</td>
								<td>
									<a href="/contestView.do?contestNo=${ct.contestNo }">${ct.contestTitle }</a>
								</td>
								<c:choose>
									<c:when test="${ct.contestDeadline eq '마감' }">
										<td class="text-danger">마감</td>
									</c:when>
									<c:otherwise>
										<td>${ct.contestDeadline }</td>									
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${ct.cmStatus eq 1 }">
										<td>처리중</td>
									</c:when>
									<c:when test="${ct.cmStatus eq 2 }">
										<td>신청완료</td>
									</c:when>
									<c:otherwise>
										<td>신청반려</td>
									</c:otherwise>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomints</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<div class="container">
			<h2>고수의 노하우 작성글</h2>
			<table class="table table-hover">
				<tr class="table-primary">
					<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th>
				</tr>
				<c:forEach items="${list }" var="gn" varStatus="i">
					<tr>
						<td>${start+i.index }</td>
						<td>
							<a href="/gosuNoticeContent.do?gnn=${gn.gnoticeNo }">${gn.gnoticeTitle }</a>
						</td>
						<td>${gn.writeId }</td>
						<td>${gn.gnoticeDate }</td>
					</tr>
				</c:forEach>
			</table>
			<div id="pageNavi">
				${pageNavi }
			</div>
		</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
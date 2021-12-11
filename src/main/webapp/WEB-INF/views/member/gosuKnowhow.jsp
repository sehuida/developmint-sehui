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
					<span style="text-align: left; font-family: NotoBold; font-size: 30px;">고수의 노하우 작성글</span>
					<a href="/mypageGosu.do" class="btn btn-warning" style="height: 40px;">뒤로가기</a>			
				</div>
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
		</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	
</body>
</html>
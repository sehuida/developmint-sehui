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
	.details:hover{
		font-weight: bold;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="container">
			<div class="page-top">
				<div>
					<span style="font-size: 25px; font-family: NotoBold;">개발지식 공유 게시판</span><img class="cateImg" src="/resources/img/shareBoard/board.png">				
				</div>
				<div class="btn-group" role="group" aria-label="Basic example">
				  <a type="button" class="btn btn-secondary details">사는 얘기</a>
				  <a type="button" class="btn btn-secondary details">Tech Q&A</a>
				  <a type="button" class="btn btn-secondary details">Tips & 강좌</a>
				  <a type="button" class="btn btn-secondary details">IT NEWS & 정보</a>
				</div>
				<div>
					<span>최신순</span>
					<span>추천순</span>
					<span>조회순</span>
					<span>댓글순</span>
					<a href="/shareWriteFrm.do" class="btn btn-primary">글쓰기</a>
				</div>
			</div>
		</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
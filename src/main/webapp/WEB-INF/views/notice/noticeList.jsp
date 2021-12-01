<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomint</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container">
		<div class="area">
			<div class="nav-sub"><a href="/">홈</a><span> > </span><a href="noticeList.do">고객센터</a><span> > </span><span>공지사항</span></div>
			<div class=""><h2>CS Center</h2></div>
			<div class="">
				<ul>
					<li><span class="">Tel. 2163-8560</span><br><span>평일 9:00~18:00(점심 12:00~13:00)</span></li>
					<li><a href="/qnaFrm.do">1:1 Q&A<br><span>질문 전 FAQ(자주 묻는 질문)을 먼저 확인해 주세요.</span></a></li>
					<li><a href="/faq.do">자주묻는질문<br><span>자주묻는질문</span></a></li>
				</ul>
			</div>
			<div class="contents">
				<h2>Notice</h2>
				<table class="table table-hover">
					<thead>
				    <tr>
				     	<th scope="col-auto">번호</th>
				     	<th scope="col-auto">제목</th>
				     	<th scope="col-auto">등록일</th>
				    </tr>
				 	</thead>
				 	<tbody>
						<tr class="table-light"></tr>
				 	</tbody>
				</table>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
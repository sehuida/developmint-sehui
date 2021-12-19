<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="box_faq_list">
		<header class="n-section-title">
			<h2 class="tit">FAQ</h2>
			<span class="txt_type font-mss">${type } 에 관련된 자주 묻는 질문</span>
			<a class="n-lick" href="/faq.do?category=${category }">전체</a>
			<!-- faq  -->
			<div class="faq-list">
				<c:forEach varStatus="" items="" var="">
					
				</c:forEach>
			</div>
		</header>
	</div>
</body>
</html>
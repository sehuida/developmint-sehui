<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="container" style="margin-top:50px;margin-bottom:100px;">
			<div class="mainCate">
				<span style="font-weight:bold">지원내역</span>
			</div>
			<br><br>
			<p id="unprocessed">입사 지원 수 : <span>${count }</span> 건</p>
			
			<div id="pageNavi">${pageNavi }</div>
		</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
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
		border: 2px solid #a6adad;
        border-radius: 10px;
        display: flex;
	}
	.profiles{
		display : flex;
		align-items: center;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		<div class="page-wrap">
			<div class="profiles">
				<a href="/profiles.do"><img src="/resources/img/member/user.png" style="width: 50px; height:50px;"></a>
			</div>
			<div>
				<div>
					<span>[${sessionScope.m.memberName}]님</span>
					<c:choose>
						<c:when test="${sessionScope.m.memberGrade >=1 && sessionScope.m.memberGrade <= 20 }">
							<span>등급 : 브론즈<img src="/resources/img/member/rank/bronze.png" style="width: 48px; height:48px;"></span>
						</c:when>
					</c:choose>
				</div>
				<div>
					이메일:${sessionScope.m.email }
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
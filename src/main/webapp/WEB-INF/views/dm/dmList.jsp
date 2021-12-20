<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomints</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<style>
	.dmWrap{
		width: 1000px;
		margin: 0 auto;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		<h4 style="font-weight: bold; margin-left: 100px; margin-bottom: 50px; margin-top: 50px; margin-right:">쪽지함<i class="bi bi-chat-dots" style="margin-left:10px;"></i></h4>
		<div class="dmWrap">
			<p class="text-muted">받은 쪽지함</p>
			<table class="table table-hover">
				<tr class="table-active">
					<th>번호</th><th>보낸사람</th><th>내용</th><th>날짜</th><th>읽음여부(Y,N)</th>
				</tr>
				<c:forEach items="${list }" var="dm">
					<c:if test="${dm.receiver eq sessionScope.m.memberId}">
						<tr>
							<td>${dm.dmNo }</td>
							<td>${dm.sender }</td>
							<td>${dm.dmContent }</td>
							<td>${dm.dmTime }</td>
							<td>${dm.readStatus }</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
			<hr>
			<p class="text-muted">보낸 쪽지함</p>
			<table class="table table-hover">
				<tr class="table-active">
					<th>번호</th><th>받는사람</th><th>내용</th><th>날짜</th><th>읽음여부(Y,N)</th>
				</tr>
				<c:forEach items="${list }" var="dm">
					<c:if test="${dm.sender eq sessionScope.m.memberId}">
						<tr>
							<td>${dm.dmNo }</td>
							<td>${dm.receiver }</td>
							<td>${dm.dmContent }</td>
							<td>${dm.dmTime }</td>
							<td>${dm.readStatus }</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>		
		</div><!-- dmWrap -->
	</div>	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
		$("#send").click(function () {
			
			var receiver = $("#receiver").val();
			var dmContent = $("#dmContent").val();
			var sender = $("#sender").val();
			
			$.ajax({
				url : "/sendDm.do",
				data : {receiver:receiver,dmContent:dmContent,sender:sender},
				success : function(data) {
					if(data == 1){
						dmCount(receiver);
						console.log("성공");
					}else{
						console.log("실패");
					}
					location.reload();
				}
			});
		})
	</script>
</body>
</html>
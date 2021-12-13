<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공모전 신청 회원</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</head>
<style>
.mainCate{
	display:flex;
}
#allMember{
	font-size: 25px;
	line-height: 46px;
}
.bi{
	font-size:30px;
}
.dateBox{
		display: flex;
		margin-bottom: 80px;
	}
.contestBox{
	width: 800px;
	margin:0 auto;
	height: 250px;
	margin-top: 40px;
	box-shadow: 0px 1px 5px -2px rgb(0 0 0 / 20%), 0px 0px 1px 0px rgb(0 0 0 / 14%), 0px 1px 8px 0px rgb(0 0 0 / 12%);
	border-radius: 5px;
	display: flex;
}
.imgBox>img{
	width: 230px;
	height: 100%;
	border-bottom-left-radius: 5px;
	border-top-left-radius: 5px;
}
.infoBox{
	padding: 20px;
	width: 420px;
}
.infoBox>p:first-child {
	font-size: 20px;
	font-weight: bold;
}
.infoBox>p:nth-child(2){
	font-size: 17px;
	font-weight: bold;
	color: #3875e6;
}
.infoBox>p:nth-child(3){
	font-size: 17px;
	font-weight: bold;
	margin-top: 35px;
}
.infoBox>p:nth-child(4){
	font-size: 17px;
	margin-bottom: 5px;
}
.viewBtn{
	height: 100%;
	display: flex;
	justify-content: flex-end;
	align-items: flex-end;
	padding-right: 10px;
	font-weight: bold
}
.noContest{
	width: 100%;
	height: 300px;
	box-shadow: 0px 1px 5px -2px rgb(0 0 0 / 20%), 0px 0px 1px 0px rgb(0 0 0 / 14%), 0px 1px 8px 0px rgb(0 0 0 / 12%);
	font-size: 20px;
	font-weight: bold;
	text-align: center;
	padding-top: 70px;
}
.clickP:hover {
	color:#4ECDC4;
	cursor: pointer;
}
.contestMemberView{
	width: 800px;
	margin:0 auto;
	box-shadow: 0px 1px 5px -2px rgb(0 0 0 / 20%), 0px 0px 1px 0px rgb(0 0 0 / 14%), 0px 1px 8px 0px rgb(0 0 0 / 12%);
	margin-top: 20px;
	border-radius: 5px;
	padding:10px;
}

</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container" style="margin-top:50px;margin-bottom:100px;">
		<div class="mainCate">
			<a href="/adminPage.do" class="cateAtag"><i class="bi bi-chevron-left"></i></a> 
			<span id="allMember" style="font-weight:bold">공모전 신청 회원</span>
		</div>
		<br><br><br>
	
		<%--공모전 달력 --%>
		<div class="dateBox">
			<input type="date" class="form-control" name="contestDeadline" value="${date }" style="width: 300px;">
			<button id="searchDate" class="form-control" style="width: 100px; margin-left: 10px;">검색</button>
		</div>
		
		<c:choose>
			<c:when test="${totalCount != 0 }">
				<div>
					<c:forEach items="${list }" var="c">
						<div class="contestBox">
							<div class="imgBox">
								<img src="/resources/img/contest/${c.contestImg }">
							</div>
							<div class="infoBox">
								<p>${c.contestTitle }</p>
								<p>신청회원 : <span>20</span> 명</p>
								<p>
									<span><i class="bi bi-bookmark" style="font-size: 20px;"></i> ${c.contestHost }</span> | 
									<c:choose>
										<c:when test="${c.contestType == 1 }">
											<i class="bi bi-lightbulb" style="font-size: 20px;"></i> 기획
										</c:when>
										<c:when test="${c.contestType == 2 }">
											<i class="bi bi-gear" style="font-size: 20px;"></i> 개발
										</c:when>
										<c:when test="${c.contestType == 3 }">
											<i class="bi bi-palette" style="font-size: 20px;"></i> 디자인
										</c:when>
									</c:choose>
								</p>
								<p><i class="bi bi-person-bounding-box" style="font-size: 20px; margin-right: 5px;"></i>${c.contestQualify }</p>
								<p><i class="bi bi-envelope" style="font-size: 20px; margin-right: 5px;"></i>${c.email }</p>
							</div>
							<div class="viewBtn">
								<p class="clickP">신청 회원 보기 <i class="bi bi-caret-down-fill" style="font-size: 20px;"></i></p>
							</div>
						</div>
						<div class="contestMemberView" style="display:none">gg</div>
						<p style="display: none" class="contestNo">${c.contestNo }</p>
					</c:forEach>			
				</div>
				<div id="pageNavi" style="text-align: center; margin-top:50px;"  >${pageNavi }</div>
			</c:when>
			<c:otherwise>
				<div class="noContest">
					<i class="bi bi-calendar-x" style="font-size:35px; color:#4ECDC4;"></i>
					<p style="margin-top:10px;">마감 예정인 공모전이 없습니다.</p>
					<p>날짜를 선택하여 신청 회원을 확인해보세요.</p>
				</div>
				
			</c:otherwise>
		</c:choose>
		
		
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	<script>
	$("#searchDate").click(function(){
		var contestDeadline = $("input[name=contestDeadline]").val();
		location.href="/contestEnrollMember.do?reqPage=1&date="+contestDeadline;
	})
	
	$(".clickP").click(function(){
		var index = $(".clickP").index(this);
		$(".contestMemberView").eq(index).toggle();
		
		var contestNo = $(".contestNo").eq(index).html();
		
		$.ajax({
			url : "/searchContestMember.do",
			type : 'post',
			data : {contestNo:contestNo},
			success : function(data){
				
			}
		});
		
	})
	
	</script>
</body>
</html>









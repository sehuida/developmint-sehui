<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사 인증 처리</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
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
.certiBox{
	display: flex;
	flex-wrap: wrap;
}
.memberBox{
	border: 1px solid #898989;
	margin-left: 20px;
	width: 600px;
	border-radius: 5px;
	display: flex;
	margin-top: 20px;
}
.imgBox{
	width: 200px;
	height: 200px;
	text-align: center;
}
.imgBox>img{
	width: 70%;
	height: 70%;
	border-radius: 50%;
	margin-top: 17px;
}
.imgBox>p{
	font-weight: bold;
	font-size: 20px;
	margin-top: 5px;
}


.infoBox{
	padding: 10px;
	margin-top: 10px;
}

.infoTitle{
	font-size: 17px;
	font-weight: bold;	
}
.certiBtn{
	margin-top : 25px;
	margin-left: 20px;
}

</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container" style="margin-top:50px;margin-bottom:100px;">
		<div class="mainCate">
			<a href="/adminPage.do" class="cateAtag"><i class="bi bi-chevron-left"></i></a> 
			<span id="allMember" style="font-weight:bold">회사 인증 처리</span>
		</div>
		<br><br><br>
		
		<div class="certiBox">
			<c:forEach items="${list }" var="c" varStatus="i">
				<div class="memberBox">
					<div class="imgBox">
						<c:choose>
							<c:when test="${not empty memlist[i.index].filepath }">
								<img src="/resources/upload/member/${memlist[i.index].filepath }">
							</c:when>
							<c:otherwise>
								<img src="/resources/img/member/user.png">
							</c:otherwise>
						</c:choose>
						<p> ${memlist[i.index].memberId }<p>
					</div>
					<div class="infoBox">
						 <span class="infoTitle"><i class="bi bi-person-fill" style="font-size: 20px; color: #898989; margin-right: 5px;"></i>회원이름 : </span><span>${memlist[i.index].memberName }</span><br>
						 <span class="infoTitle"><i class="bi bi-envelope" style="font-size: 20px; color: #898989; margin-right: 5px;"></i>이메일 : </span><span>${memlist[i.index].email }</span><br>
					</div>
					<div class="certiBtn"><button class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#certiModal${i.index }">인증 사진</button></div>
				</div>
			</c:forEach>
		</div>
		<div id="pageNavi" style="text-align: center; margin-top:50px;"  >${pageNavi }</div>
		
		<!-- 내용보기 Modal -->
		<c:forEach items="${list }" var="c" varStatus="i">
		<div class="modal fade" id="certiModal${i.index }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content" style="border-radius: 0.3rem;">
		      <div class="modal-body">
		      	<img src="/resources/upload/certification/${c.filepath }" width="470">
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
		</c:forEach>
		
		
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사 인증 처리</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
	border: 1px solid #6666;
	margin-left: 20px;
	width: 600px;
	border-radius: 3px;
	display: flex;
	margin-top: 20px;
}
.memberBox:hover{
	border: 1px solid #4ECDC4;
	box-shadow: 0px 1px 1px -2px rgb(0 0 0 / 20%), 0px 0px 1px 0px rgb(0 0 0 / 14%), 0px 1px 8px 0px rgb(0 0 0 / 12%);
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
						 <div class="inputBox">
							 <form action="/enrollMemberCompany.do" class="enrollForm">
								<span><i class="bi bi-briefcase" style="font-size: 20px; color: #898989; margin-right: 5px;"></i></span><span class="infoTitle" style="margin-top: 20px; display: inline-block;">회사 선택</span>
								<select class="form-control selectForm" style="margin-top:7px" name="companyNo"> 
									<option value="no">회사를 선택하세요.</option>
									<c:forEach items="${companyList }" var="com">
										<option value="${com.companyNo }">${com.companyName }</option>
									</c:forEach>
								</select>
								<input type="hidden" name="memberNo" value="${memlist[i.index].memberNo }">
							</form>
						</div>
					</div>
					<div>
						<div class="certiBtn"><button class="btn btn-info" data-bs-toggle="modal" data-bs-target="#certiModal${i.index }">인증 사진</button></div>
						<button class="btn btn-outline-primary enrollBtn" style="margin-top: 70px; margin-right: 5px;">인증</button><button class="btn btn-outline-secondary noEnrollBtn"  style="margin-top: 70px;">반려</button>
					</div>
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
		    </div>
		  </div>
		</div>
		</c:forEach>
		
		
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	<script>
		$(".enrollBtn").click(function(){
			var index = $(".enrollBtn").index(this);
			if($('.selectForm option:selected').eq(index).val() == 'no'){
				alert("회사를 선택해주세요.");
				return;
			}
			swal({
	 			  title: "회사 인증",
	 			  text: "선택한 회사로 인증하시겠습니까?",
	 			  icon: "warning",
	 			  buttons: true,
	 			  dangerMode: true,
	 			})
	 			.then((willDelete) => {
	 			  if (willDelete) {
	 				 $(".enrollForm").eq(index).submit();	
	 			  }
	 			});
		})
		
		$(".noEnrollBtn").click(function(){
			var index = $(".noEnrollBtn").index(this);
			var memberNo = $("[name=memberNo]").eq(index).val();
			swal({
	 			  title: "회사 인증 반려",
	 			  text: "선택한 회원을 반려 처리하시겠습니까?",
	 			  icon: "warning",
	 			  buttons: true,
	 			  dangerMode: true,
	 			})
	 			.then((willDelete) => {
	 			  if (willDelete) {
	 				 location.href="/noEnrollMemberCompany.do?memberNo="+memberNo;	
	 			  }
	 			});
		})
	</script>
</body>
</html>
















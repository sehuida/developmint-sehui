<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UpdateInfo</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
	.update-wrap{
		width: 700px;
		margin: 0 auto;
        padding : 20px;
        margin-bottom: 100px;
        margin-top: 50px;
	}
	.update-top {
		text-align: center;
	}
	.update-top img:hover{
		cursor: pointer;
	}
	.update-middle>form>div{
		width: 400px;
		margin: 0 auto;
	}
	.pageBtn{
		display: flex;
		justify-content: space-around;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<div class="container">
		  <h4 style="text-align: center; font-family: NotoBold">계정설정</h4>
			<div class="update-wrap">
			  <div class="update-top">
				<c:choose>
					<c:when test="${sessionScope.m.filepath eq null }">
						<label for="formFile" class="form-label"><img src="/resources/img/member/profile.png" style="width: 80px; height:80px;"></label>
					</c:when>
					<c:otherwise>
						<label for="formFile" class="form-label"><img src="/resources/upload/member/${sessionScope.m.filepath }" style="width: 80px; height:80px;"></label>
					</c:otherwise>
				</c:choose>
			    <input class="form-control" type="file" id="formFile" style="display: none;" accept=".gif, .jpg, .jpeg, .png">			  
			  </div><!--update-top 끝나는 지점  -->
			  <div class="update-middle">
			    <form action="/updateMyInfo.do" method="post">
					<div class="form-group">
					  <fieldset>
					    <label class="form-label mt-4" for="memberId">아이디</label>
					    <input class="form-control" name="memberId" id="memberId" type="text" value="${sessionScope.m.memberId }" readonly="">
					  </fieldset>
					</div>
					<div class="form-group">
					  <label class="col-form-label mt-4" for="email">이메일</label>
					  <input type="text" class="form-control" name="email" id="email" value="${sessionScope.m.email }" readonly="">
					</div>
					<div class="form-group">
					  <label class="col-form-label mt-4" for="memberName">이름</label>
					  <input type="text" class="form-control" name="memberName" id="memberName" value="${sessionScope.m.memberName }">
					</div>
					<div class="form-group">
					  <label class="col-form-label mt-4" for="phone">전화번호</label>
					  <input type="text" class="form-control" name="phone" id="phone" value="${sessionScope.m.phone }">
					</div>
					<div class="form-group pageBtn"  style="margin-top: 30px;">
						<a href="/changePwFrm.do">비밀번호 변경하기</a>
						<button type="submit" class="btn btn-primary">정보변경</button>	
						<button type="button" class="btn btn-danger resgin">회원탈퇴</button>		  					
					</div>
		        </form>
			  </div><!--update-middle 끝나는 지점  -->
			</div><!--update-wrap 끝나는 지점  -->
		</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
		$(function(){
			$(".resgin").on("click",function(){
				var memberId = $("#memberId").val();
				swal({
				    title: "회원탈퇴를 진행하시겠습니까?",
				    text: "회원 탈퇴를 진행하실경우, 정보 복구는 어렵습니다.",
				    icon: "error",
				    buttons: ["돌아가기", "탈퇴하기"],
				    dangerMode: true
				}).then((willDelete) => {
				    if (willDelete) {
				        
				        $.ajax({
				            url: "/resignMember.do",
				            data: {
				                memberId: memberId
				            },
				            type: "post",
				            success: function (data) {
				            	if(data == 1){
				                    swal({
				                        title: '회원탈퇴완료',
				                        text: '디벨로민트를 이용해주셔서 감사합니다.',
				                        icon: 'success'
				                      }).then(function(){
				                    	 window.location = "/"; 
				                      });
				            	}else{
				            		swal("회원탈퇴에 실패했습니다.", {icon:"warning"});
				            	}
				    
				            }
				        });
				    } else {
				        swal({
				        	text: "탈퇴가 취소되었습니다.",
				        	button: "돌아가기"
				        });
				    }//else문 종료
				});//then delete 문 종료
			});//resign on click 문 종료
		});//$ 펑션 종료
	</script>
</body>
</html>
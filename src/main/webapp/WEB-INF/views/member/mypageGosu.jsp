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
        padding : 20px;
        margin-bottom: 100px;
	}
	.page-top{
        display: flex;
        justify-content: space-around;
        margin-bottom: 20px;
        padding-bottom: 20px;
        border-bottom: 1px solid #a6adad;
	}
	.profiles{
		display : flex;
		align-items: center;
		border-radius: 60%; 
		overflow: hidden;
	}
	.profiles img{
	    object-fit: cover;			
	}
	.profiile-h{
		margin-left: 20px;
	}
	.profile-h>div{
		margin-bottom: 10px;
	}
	.profile-h>div:last-child *{
		margin-right: 10px;
	}
	.page-top{
		margin-top: 20px;
	}
	.page-middle{
		border-bottom: 1px solid #a6adad;
	}
	.page-middle img{
		width: 40px;
		height: 40px;
	}
	.page-middle div{
        display: flex;
        justify-content: space-between;
        padding: 0 40px 0 40px;
        margin-top: 50px;
        margin-bottom: 50px;
	}
	.page-bottom{
		margin-top: 30px;
		margin-left: 30px;
	}
	.page-bottom>a{
		margin-right: 20px;
	}
	.arrow{
		transition: all ease 0.4s;
	}
	.arrow:hover{
		transform: rotate(90deg);
	}
	.pageLists{
		width:400px; 
		line-height: 2; 
		text-decoration: none; 
		color: black;
	}
	.pageLists:hover{
		color:#78c2ad;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		<h4 style="font-weight: bold; margin-left: 300px;">마이페이지</h4>
		 <div class="page-wrap">
			 <div class="page-top">
				<div class="profiles">
					<c:choose>
						<c:when test="${sessionScope.m.filepath eq null }">
							<img src="/resources/img/member/user.png" style="width: 60px; height:60px;">				
						</c:when>
						<c:otherwise>
							<img src="/resources/upload/member/${sessionScope.m.filepath }" style="width: 80px; height:80px; ">
						</c:otherwise>
					</c:choose>
				</div>
				<div class="profile-h">
					<div>
						<span>[${sessionScope.m.memberName}]님</span>
						<c:choose>
							<c:when test="${sessionScope.m.memberGrade >=1 && sessionScope.m.memberGrade <= 20 }">
								<span>등급 : 브론즈<img src="/resources/img/member/rank/bronze.png" style="width: 35px; height:35px;"></span>
							</c:when>
							<c:when test="${sessionScope.m.memberGrade >=21 && sessionScope.m.memberGrade <= 40 }">
								<span>등급 : 실버<img src="/resources/img/member/rank/silver.png" style="width: 35px; height:35px;"></span>
							</c:when>
							<c:when test="${sessionScope.m.memberGrade >=41 && sessionScope.m.memberGrade <= 60 }">
								<span>등급 : 골드<img src="/resources/img/member/rank/gold.png" style="width: 35px; height:35px;"></span>
							</c:when>
							<c:when test="${sessionScope.m.memberGrade >=61 && sessionScope.m.memberGrade <= 80 }">
								<span>등급 : 플래티넘<img src="/resources/img/member/rank/platinum.png" style="width: 35px; height:35px;"></span>
							</c:when>
							<c:when test="${sessionScope.m.memberGrade >=81 && sessionScope.m.memberGrade <= 110 }">
								<span>등급 : 다이아몬드<img src="/resources/img/member/rank/diamond.png" style="width: 35px; height:35px;"></span>
							</c:when>
							<c:when test="${sessionScope.m.memberGrade >=111 && sessionScope.m.memberGrade <= 140 }">
								<span>등급 : 마스터<img src="/resources/img/member/rank/master.png" style="width: 35px; height:35px;"></span>
							</c:when>
							<c:when test="${sessionScope.m.memberGrade >=141 && sessionScope.m.memberGrade <= 170 }">
								<span>등급 : 챌린저<img src="/resources/img/member/rank/challenger.png" style="width: 35px; height:35px;"></span>
							</c:when>								
						</c:choose>
					</div>
					<div>
						<span>이메일:${sessionScope.m.email }</span>
						<a href="/resumeManage.do?memberNo=${sessionScope.m.memberNo }" class="btn btn-primary btn-sm">이력서 관리</a>
						<a href="/applicationCompany.do?memberNo=${sessionScope.m.memberNo } " class="btn btn-primary btn-sm">입사 신청내역</a>
					</div>
				</div>
				<div class="profiles">
					<a href="/updateInfoFrm.do" data-bs-toggle="tooltip" data-bs-placement="top" title="정보수정하기"><img src="/resources/img/member/right-arrow.png" style="width: 30px; height:30px;" class="arrow"></a>
				</div>
			</div>
			<div class="page-middle">
				<h4 style="font-family: NotoBold; margin-bottom: 20px;">커뮤니티</h4>
				<div>
					<img src="/resources/img/member/notes.png">
					<a class="pageLists" href="#">작성게시물 / 댓글보기</a>
					<a href="#"><img src="/resources/img/member/right-arrow.png" style="width: 20px; height:20px;" class="arrow"></a>
				</div>
				<div>
					<img src="/resources/img/member/multiple-users-silhouette.png">
					<a class="pageLists" href="#">팀원신청 / 찜한 내역 확인하기</a>
					<a href="#"><img src="/resources/img/member/right-arrow.png" style="width: 20px; height:20px;" class="arrow"></a>
				</div>
				<div>
					<img src="/resources/img/member/ask.png">
					<a class="pageLists" href="/gosuSituation.do">고수의 노하우 신청내역</a>
					<a href="/gosuSituation.do"><img src="/resources/img/member/right-arrow.png" style="width: 20px; height:20px;" class="arrow"></a>
				</div>
				<div>
					<img src="/resources/img/member/podium.png">
					<a class="pageLists" href="/mycontestPage.do?reqPage=1&memberId=${sessionScope.m.memberId }">공모전 신청내역</a>
					<a href="/mycontestPage.do?reqPage=1&memberId=${sessionScope.m.memberId }"><img src="/resources/img/member/right-arrow.png" style="width: 20px; height:20px;" class="arrow"></a>
				</div>
			</div>
			<div class="page-middle">
					<div>
						<img src="/resources/img/member/chat.png">
						<a class="pageLists" href="/gosuKnowhow.do?reqPage=1&memberId=${sessionScope.m.memberId }">고수의 노하우</a>
						<a href="/gosuKnowhow.do?reqPage=1&memberId=${sessionScope.m.memberId }"><img src="/resources/img/member/right-arrow.png" style="width: 20px; height:20px;" class="arrow"></a>
					</div>		
			</div>
			<div class="page-bottom">
				<a href="/certification.do" class="btn btn-primary btn-sm">회사인증</a>
				<a href="/companyMember.do" class="btn btn-info btn-sm">기업고객 전환</a>
			</div>
		</div>
	 </div>	 
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
		var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
		var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
		  return new bootstrap.Tooltip(tooltipTriggerEl)
		})
		var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
		var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
  		return new bootstrap.Popover(popoverTriggerEl)
		})
	</script>
</body>
</html>
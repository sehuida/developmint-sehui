<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.grayBox{
		width: 1000px;
		margin: 0 auto;
		background-color: rgb(250, 250, 250);
		padding: 30px;
		overflow: hidden;
		margin-top: 15px;		
		margin-bottom: 80px;
	}
	.ceoResume{
		color: rgb(78, 205, 196);
	}
	em{
		font-style: normal;
		font-weight: 900;
		font-size: 20px;
		margin-bottom: 15px;
	}
	.resumeInfo>li{
		color: rgb(158, 158, 158);
	}
	
	
	.resume{
        background-color: rgb(78, 205, 196);
        border: none;
        font-size: 15px;
        font-weight: 900;
        width: 200px;
        height: 50px;
        color: white;
        cursor: pointer;
    }
</style>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container">
		<em>이력서 관리(아직 대충 틀만)</em>		<!-- if 이력서 없으면 등록된 이력서가 없습니다. -->
		<div class="grayBox">
			<div class="resumeHeader">
				<p class="ceoResume">대표이력서</p>
				<div class="resumeTitle">
					<em>이력서 제목</em>	<!-- ${r.getResumeTitle} -->
				</div>
				<ul class="resumeInfo">
	            	<li class="career"><span>신입</span></li>         					<!-- ${r.getResumeCareer} -->           
					<li class="workFrom"><span>희망 직무·직업 : IT개발·데이터</span></li>       <!-- ${r.getResumeWorkForm} -->
					<li class="money"><span>2,800~3,000만원</span></li>                 	<!-- ${r.getResumeMoney} -->   
					<li class="workPlace"><span>희망지역 : 서울 금천구</span></li>                 <!-- ${r.getResumeworkPlace} -->
				</ul>
			</div>
		</div>
		<a href="resumeFrm.do"><button class="resume">이력서 작성하기</button></a>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
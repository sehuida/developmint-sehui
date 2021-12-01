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
	.contain{
		width: 1100px;
		margin: 0 auto;
		margin-top: 50px;
		margin-bottom: 50px;
	}
	.grayBox{
		width: 1000px;
		margin: 0 auto;
		background-color: rgb(250, 250, 250);
		padding: 30px;
		overflow: hidden;
		margin-top: 15px;		
		margin-bottom: 20px;
	}
	.ceoResume{
		color: rgb(78, 205, 196);
	}
	.resumeTitle{
		margin-bottom: 15px;
	}
	em{
		font-style: normal;
		font-weight: 900;
		font-size: 20px;
		margin-bottom: 15px;
	}
	.resumeInfo{
		width: 600px;
	}
	.resumeInfo>li{
		color: rgb(158, 158, 158);
		list-style: none;
		overflow: hidden;
	}
	.resumeInfo>li>div{
		float: left;
	}
	.resumeInfoImg{
		width: 40px;
	}
	.resumeInfoImg>img{
		width: 20px;
	}
	.resumeInfoData{
		margin-left: 30px;
	}
	.money, .career{
		width: 200px;
		display: inline-block;
	}
	.workForm, .workPlace{
		float: right;
	}
	.workPlace{
		display: inline-block;
		padding-right: 52px;
	}
	.message{
		float: left;
	}
	.companyMessage{
		margin-left: 30px;
		border: none;
		width: 250px;
		height: 30px;
		border: none;
		border-radius: 20px;
		color: rgb(150, 150, 150);
		font-size: 14px;
		font-weight: 900;
		background-color: white;
		position: relative;
	}
	.requestCount{
		display: inline-block;
		padding: 5px 10px;
		background-color: rgb(78, 205, 196);
		color: white;
		border-radius: 100px;
		font-size: 12px;
		position: relative;
		left: -25px; 
		top: -10px;
	}
	.update{
		overflow: hidden;
		float: right;	
	}
	.updateResume{
		border: none;
		width: 100px;
		height: 45px;
		border: 2px solid rgb(78, 205, 196);
		border-radius: 10px;
		color: rgb(78, 205, 196);
		background-color: white;
	}
	.resume{
		width: 1000px;
		margin: 0 auto;
	}
	.resumeBtn{
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
	<div class="contain">
		<em>이력서 관리(아직 대충 틀만)</em>		<!-- if 이력서 없으면 등록된 이력서가 없습니다. -->
		<div class="grayBox">
			<div class="resumeHeader">
				<p class="ceoResume">대표이력서</p>
				<div class="resumeTitle">
					<em>이력서 제목</em>	<!-- ${r.getResumeTitle} -->
				</div>
				<ul class="resumeInfo">
	            	<li class="career">
	            		<div class="resumeInfoImg">
	            			<img src="resources/img/resume/career.PNG">
	            		</div>
	            		<div class="resumeInfoData">
	            			<span>신입</span>	<!-- ${r.getResumeCareer} -->
	            		</div>
	            	</li>         					           
					<li class="workForm">
						<div class="resumeInfoImg">
							<img src="resources/img/resume/workForm.PNG">
						</div>
						<div class="resumeInfoData">
							<span>희망 직무·직업 : IT개발·데이터</span>	<!-- ${r.getResumeWorkForm} -->
						</div>
					</li>       
					<li class="money">
						<div class="resumeInfoImg">
							<img src="resources/img/resume/income.PNG">					
						</div>
						<div class="resumeInfoData">
							<span>2,800~3,000만원</span>	<!-- ${r.getResumeMoney} -->
						</div>
					</li>                 	   
					<li class="workPlace">
						<div class="resumeInfoImg">
							<img src="resources/img/resume/workPlace.PNG">
						</div>
						<div class="resumeInfoData">
							<span>희망지역 : 서울 금천구</span>	<!-- ${r.getResumeworkPlace} -->
						</div>
					</li>                 
				</ul>
			</div>
			<div class="message">
				<button class="companyMessage">기업이 보낸 요청</button>		<!-- 웹소켓으로 기업이 이력서 확인 후 합격이면 쪽지 날라가게 만들기 -->
				<span class="requestCount">1</span>		<!-- ${r.getrequestCount} 	VO에 카운트 가져오는 변수 추가해야 할듯 어떻게 가져올지 생각 -->
			</div>
			<div class="update">
				<button class="updateResume">수정하기</button>
			</div>
		</div>
		<div class="resume">
			<a href="resumeFrm.do"><button class="resumeBtn">이력서 작성하기</button></a>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
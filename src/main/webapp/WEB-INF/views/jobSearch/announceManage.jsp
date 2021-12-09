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
		width: 1000px;
		margin: 0 auto;
		margin-top: 50px;
		margin-bottom: 50px;
	}
	.grayBox{
		background-color: rgb(250, 250, 250);
		padding: 30px;
		overflow: hidden;
		margin-top: 15px;		
		margin-bottom: 20px;
	}
	.resumeHeader{
		overflow: hidden;
	}
	.ceoResume>p{
		color: rgb(78, 205, 196);
		float: left;
	}
	.writeDate{
		color: rgb(108, 108, 108);
		float: left;
		margin-left: 20px;
		font-size: 12px;
		padding-top: 3px;
		
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
	.resumeInfo1{
		margin-bottom: 0;
	}
	.resumeInfo1, .resumeInfo2{
		width: 900px;
		overflow: hidden;
	}
	.resumeInfo1>li, .resumeInfo2>li{
		color: rgb(158, 158, 158);
		list-style: none;
		overflow: hidden;
	}
	.resumeInfo1>li>div, .resumeInfo2>li>div{
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
		width: 280px;
		display: inline-block;
	}
	.workForm{
		width: 280px;
		display: inline-block;
		
	}
	.workPlace{
		width: 280px;
		display: inline-block;
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
		color: rgb(80, 80, 80);
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
    .resumeExplain{
    	margin-top: 20px;
    	margin-bottom: 80px;
    }
    .resumeExplain>p{
    	margin-bottom: 0px;
    	color: rgb(108,108,108);
    	font-size: 12px;
    }
    .resumeCount{
    	margin-left: 20px;
    }
    .myResume{
    	margin-top: 30px;
    	margin-left: 15px;
    }
    .register{
    	margin-top: 30px;
    	margin-left: 20px;
    	font-size: 13px;
    	font-weight: 900;
    }
    
    input[type="checkbox"] { 
    	display: none; 
    } 
    .label__on-off {
    	overflow: hidden; 
    	position: relative; 
    	display: inline-block; 
    	width: 58px; height: 26px; 
    	-webkit-border-radius: 13px; 
    	-moz-border-radius: 13px; 
    	border-radius: 13px; 
    	background-color: #ed4956; 
    	color: #fff; 
    	font-weight: bold; 
    	cursor: pointer; 
    	-webkit-transition: all .3s; 
    	-moz-transition: all .3s; 
    	-ms-transition: all .3s; 
    	-o-transition: all .3s; 
    	transition: all .3s; 
    } 
    .label__on-off > * {
    	vertical-align: middle; 
    	-webkit-transition: all .3s; 
    	-moz-transition: all .3s; 
    	-ms-transition: all .3s; 
    	-o-transition: all .3s; 
    	transition: all .3s; 
    	font-size: 14px; 
    } 
    .label__on-off .marble { 
    	position: absolute; 
    	top: 1px; 
    	left: 1px; 
    	display: block;
    	width: 24px; 
    	height: 24px; 
    	background-color: #fff; 
    	-webkit-border-radius: 50%; 
    	-moz-border-radius: 50%; 
    	border-radius: 50%; 
    	-webkit-box-shadow: 0 0 10px rgba(0, 0, 0, .3); 
    	-moz-box-shadow: 0 0 10px rgba(0, 0, 0, .3); 
    	box-shadow: 0 0 10px rgba(0, 0, 0, .3); 
    } 
    .label__on-off .on { 
    	display: none; 
    	padding-left: 12px; 
    } 
    .label__on-off .off { 
    	padding-left: 30px; line-height: 25px; 
    } 
    .input__on-off:checked + .label__on-off { 
    	background-color: #0bba82; 
    } 
    .input__on-off:checked + .label__on-off .on { 
    	display: inline-block; 
    } 
    .input__on-off:checked + .label__on-off .off { 
    	display: none; 
    } 
    .input__on-off:checked + .label__on-off .marble { 
    	left: 33px; 
    }
    .register>p{
    	width: 100px;
    	margin: 0;
    	/* display: inline-block; */
    }
    /* .ceoResumeChk{
    	display: inline-block;
    } */

    
</style>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="contain">
		<em>구인공고 관리</em>				<!-- if 구인글 없을 때 등록된 구인글이 없습니다. -->
	<c:choose>
		<c:when test="${empty list }">
			
		</c:when>
		<c:otherwise>
			
		</c:otherwise>
	</c:choose>
		<div class="grayBox">
			<div class="resumeHeader">
				<div class="ceoResume">
					<p>등록된 공고</p>
				</div>
				<div class="writeDate">
					<span>2021.11.25</span>	
				</div>
			</div>
				<div class="resumeTitle">
					<em>java 신입/경력 개발자 채용 </em>	<!-- r.resumeTitle -->
				</div>
				<ul class="resumeInfo1">
	            	<li class="career">
	            		<div class="resumeInfoImg">
	            			<img src="resources/img/resume/career.PNG">
	            		</div>
	            		<div class="resumeInfoData">
	            			<span>신입/경력</span>	<!-- r.resumeCareer -->
	            		</div>
	            	</li>   
	            	<li class="money">
						<div class="resumeInfoImg">
							<img src="resources/img/resume/income.PNG">					
						</div>
						<div class="resumeInfoData">
							<span>2,800~3,000만원</span>	<!-- r.resumeMoney -->
						</div>
					</li>  
				</ul>
				<ul	class="resumeInfo2">  
				<li class="workPlace">
						<div class="resumeInfoImg">
							<img src="resources/img/resume/workPlaceGray.PNG" style="width:19px; height: 24px;">
						</div>
						<div class="resumeInfoData">
							<span>위치 : 서울 금천구</span>	<!-- r.resumeworkPlace -->
						</div>
					</li>    					           
					<li class="workForm">
						<div class="resumeInfoImg">
							<img src="resources/img/resume/workForm.PNG">
						</div>
						<div class="resumeInfoData">
							<span>직무·직업 : IT개발·데이터</span>	<!-- r.resumeWorkForm -->
						</div>
					</li>               
				</ul>
			<div class="message">
				<a href="applicationStatus.do"><button class="companyMessage">지원 신청 현황</button></a>		<!-- 일반회원이 지원신청을 했을 경우 count증가하고 이력서 열람할 수 있도록 하기 -> 서류합격? 버튼 누를 시 웹소켓으로 쪽지 보내기 -->
				<span class="requestCount">1</span>		<!-- r.requestCount 	VO에 카운트 가져오는 변수 추가해야 할듯 어떻게 가져올지 생각 -->
			</div>
			<div class="update">
				<a href="updateResume.do?resumeNo=${r.resumeNo }"><button class="updateResume">수정하기</button></a>
			</div>
		</div>
		<div class="resume">
			<a href="announceFrm.do"><button class="resumeBtn">구인공고 작성하기</button></a>
		</div>
		<div class="resumeExplain">
			<p>이력서는 최대 10개까지 등록 가능합니다.</p>
			<p>대표이력서 설정은 1개의 이력서만 가능합니다.</p>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
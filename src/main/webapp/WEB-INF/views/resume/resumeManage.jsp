<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
    	margin-bottom: 50px;
    }
    .register{
    	margin-top: 30px;
    	margin-left: 20px;
    	font-size: 13px;
    	font-weight: 900;
    	float: right;
    	position: relative;
    	top: -180px;
    	left: -200px;
    }
    
    input[type="checkbox"] { 
    	display: none; 
    } 
    .label__on-off {
    	overflow: hidden; 
    	position: relative; 
    	display: inline-block; 
    	width: 50px; height: 20px; 
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
    	font-size: 13px; 
    } 
    .label__on-off .marble { 
    	position: absolute; 
    	left: -1.5px; 
    	display: block;
    	width: 20px; 
    	height: 20px; 
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
    	padding-left: 25px; line-height: 10px; 
    }
    .on, .off{
    	position: relative;
    	top: -3px;
    }
    .input__on-off:checked + .label__on-off { 
    	background-color: #0bba82; 
    } 
    .input__on-off:checked + .label__on-off .on { 
    	display: inline-block; 
    } 
    .input__on-off{
    	display: none;
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
	.noResume{
		width: 800px;
		margin: 0 auto;
		margin-top: 40px;
		text-align: center;
	}
    .allResume{
    	
    }
</style>
<script>
	$(function(){
		$(".resumeBtn").click(function(e){
			var count = $(".count").html();
			if($(".count").html() > 10) {
				alert("이력서는 10개까지만 등록이 가능합니다.");
				e.preventDefault();
				console.log(count);
			}
		});
		
		$(".input__on-off").click(function(){
			$.ajax({
				url : "/ceoResume.do",
				method : post,
				data : {
					ceoResume : 1,
				},
				success : function(data) {
					console.log($.trim(data));
				}
			});
		});
		

	});
</script>

<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="contain">
		<em>이력서 관리</em>				<!-- if 이력서 없으면 등록된 이력서가 없습니다. -->
	<%-- <c:choose>
		<c:when test="${empty list }">
			저장된 이력서가 업슴
		</c:when>
		<c:otherwise>
			
		</c:otherwise>
	</c:choose> --%>
	
		<!-- 대표이력서 ceoResume == 1 -->
		<div class="grayBox">
			<div class="resumeHeader">
				<div class="ceoResume">
					<p>대표이력서</p>
				</div>
				<div class="writeDate">
					<span>2021.11.25</span>	
				</div>
			</div>
				<div class="resumeTitle">
					<em>이력서 제목</em>	<!-- r.resumeTitle -->
				</div>
				<ul class="resumeInfo1">
	            	<li class="career">
	            		<div class="resumeInfoImg">
	            			<img src="resources/img/resume/career.PNG">
	            		</div>
	            		<div class="resumeInfoData">
	            			<span>신입</span>	<!-- r.resumeCareer -->
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
							<img src="resources/img/resume/workPlace.PNG">
						</div>
						<div class="resumeInfoData">
							<span>희망지역 : 서울 금천구</span>	<!-- r.resumeworkPlace -->
						</div>
					</li>    					           
					<li class="workForm">
						<div class="resumeInfoImg">
							<img src="resources/img/resume/workForm.PNG">
						</div>
						<div class="resumeInfoData">
							<span>희망 직무·직업 : IT개발·데이터</span>	<!-- r.resumeWorkForm -->
						</div>
					</li>               
				</ul>
			<div class="message">
				<button class="companyMessage">기업이 보낸 요청</button>		<!-- 웹소켓으로 기업이 이력서 확인 후 합격이면 쪽지 날라가게 만들기 -->
				<span class="requestCount">1</span>		<!-- r.requestCount 	VO에 카운트 가져오는 변수 추가해야 할듯 어떻게 가져올지 생각 -->
			</div>
			<div class="update">
				<a href="updateResume.do?resumeNo=${r.resumeNo }"><button class="updateResume">수정하기</button></a>
			</div>
		</div>
		
		
		<div class="resume">
			<a href="resumeFrm.do"><button class="resumeBtn">이력서 작성하기</button></a>
		</div>
		<div class="resumeExplain">
			<p>이력서는 최대 10개까지 등록 가능합니다.</p>
			<p>대표이력서 설정은 1개의 이력서만 가능합니다.</p>
		</div>
		<div class="allResume">
		<div class="resumeCount">
		<c:choose>
			<c:when test="${count eq null }">
			총 0건
			</c:when>
			<c:otherwise>
			총 <p class="count" style="margin: 0; display: inline;">${count }</p>건		
			</c:otherwise>
		</c:choose>
		</div>
		<hr style="width: 885px;">
		<c:choose>
			<c:when test="${empty list }">
				<div class="noResume">
					<img src="/resources/img/resume/no.JPG" style="width: 50px; height: 50px;"><br><br>
				저장된 이력서가 없습니다.
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="rs" varStatus="i">
					<div class="myResume">
							<div class="wd">
								<span style="font-size: 13px; color: gray;">${rs.writeDate }</span>	
							</div>
						<div class="resumeTitle">
							<em>${rs.resumeTitle }</em>	
						</div>
						<ul class="resumeInfo1">
				           	<li class="career">
				            	<div class="resumeInfoImg">
				            		<img src="resources/img/resume/career.PNG">
				            	</div>
				            	<div class="resumeInfoData">
				            	<c:if test="${rs.career eq 1 }">		<!-- 1 -> 신입 -->
				            		<span>신입</span>
				            	</c:if>
				            	<c:if test="${rs.career eq 2 }">		<!-- 2 -> 경력 -->
				            		<span>경력</span>
				            	</c:if>
				            		
				            	</div>
				            </li>
				            <li class="money">
								<div class="resumeInfoImg">
									<img src="resources/img/resume/income.PNG">					
								</div>
								<div class="resumeInfoData">
																		<!-- r.money -->
									<c:if test="${rs.money eq 1 }">		<!-- 1 -> 회사내규에 따름 -->
				            			<span>회사내규에 따름</span>
					            	</c:if>
					            	<c:if test="${rs.money eq 2 }">		<!-- 2 -> 2000만 ~ 2400만 -->
					            		<span>2000만 ~ 2400만</span>
					            	</c:if>
					            	<c:if test="${rs.money eq 3 }">		<!-- 3 -> 2400만 ~ 2800만 -->
					            		<span>2400만 ~ 2800만</span>
					            	</c:if>
					            	<c:if test="${rs.money eq 4 }">		<!-- 4 -> 2800만 ~ 3200만 -->
					            		<span>2800만 ~ 3200만</span>
					            	</c:if>
					            	<c:if test="${rs.money eq 5 }">		<!-- 5 -> 3200만 ~ 3600만 -->
					            		<span>3200만 ~ 3600만</span>
					            	</c:if>
					            	<c:if test="${rs.money eq 6 }">		<!-- 5 -> 3600만 ~ 4000만 -->
					            		<span>3600만 ~ 4000만</span>
					            	</c:if>
					            	<c:if test="${rs.money eq 7 }">		<!-- 5 -> 4000만 이상 -->
					            		<span>4000만 이상</span>
					            	</c:if>
								</div>
							</li>
						</ul>
						<ul class="resumeInfo2">
							<li class="workPlace">
								<div class="resumeInfoImg">
									<img src="resources/img/resume/workPlace.PNG">
								</div>
								<div class="resumeInfoData">
									<span>${rs.workPlace }</span>	<!-- r.resumeworkPlace -->
								</div>
							</li>       					           
							<li class="workForm">
								<div class="resumeInfoImg">
									<img src="resources/img/resume/workFromWhite.PNG">
								</div>
								<div class="resumeInfoData">
																	<!-- r.resumeWorkForm -->
									<c:if test="${rs.workForm eq 1 }">		<!-- 1 -> 정규직 -->
					            		<span>정규직</span>
					            	</c:if>
					            	<c:if test="${rs.workForm eq 2 }">		<!-- 2 -> 계약직 -->
					            		<span>계약직</span>
					            	</c:if>
					            	<c:if test="${rs.workForm eq 3 }">		<!-- 3 -> 아르바이트 -->
					            		<span>아르바이트</span>
					            	</c:if>
					            	<c:if test="${rs.workForm eq 4 }">		<!-- 4 -> 인턴 -->
					            		<span>인턴</span>
					            	</c:if>
					            	<c:if test="${rs.workForm eq 5 }">		<!-- 5 -> 프리랜서 -->
					            		<span>프리랜서</span>
					            	</c:if>
								</div>
							</li>                       
						</ul>
						<div class="register">
							<p>대표이력서 등록</p>
							<div class="ceoResumeChk">
								<input type="radio" id="switch${i.count }" name="switch1" class="input__on-off">
								<label for="switch${i.count }" class="label__on-off"> 
									<span class="marble"></span> 
									<span class="on">on</span> 
									<span class="off">off</span> 
								</label>
							</div>
						</div>					
					</div>
					<hr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
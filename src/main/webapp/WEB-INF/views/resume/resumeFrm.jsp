<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이력서 작성하기</title>
<style>
	.contain{
		width: 1000px;
		margin: 0 auto;
		margin-top: 100px;
		margin-bottom: 100px;
	}
	.grayBox{
		width: 1000px;
		margin: 0 auto;
		background-color: rgb(250, 250, 250);
		padding: 30px;
		overflow: hidden;
		margin-top: 15px;		
		margin-bottom: 80px;
	}
	em{
		float: left;
		font-style: normal;
		font-weight: 900;
		font-size: 20px;
		margin-bottom: 15px;
	}
	b{
		color: rgb(51, 51, 51);
		float: left;
		font-size: 14px;
		line-height: 40px;
		margin-left: 10px;
		width: 80px;
	}
	span{
		color: red;
	}
	#name{
		color: black;
		font-weight: 900;
		font-size: 24px;
		padding-left: 20px;
		padding-bottom: 10px;
		
	}
	.infoType{
		float: left;
	}
	.infoType>pre, .info>pre{
		color: rgb(51, 51, 51);
		font-weight: 900;
		font-size: 17px;
	}
	.info{
		float: left;
	}
	.textInput{
		width: 700px;
		height: 40px;
		padding-left: 5px;
		outline: none;
		margin-left: 50px;
	}
	.smallTextInput{
		width: 300px;
		height: 40px;
		padding-left: 5px;
		outline: none;
		margin-left: 50px;
	}
	.selectInput{
		margin-left: 50px;
		width: 300px;
		height: 40px;
		color: rgb(51, 51, 51);
		outline: none;
	}
	.dateInput{
		width: 142px;
		height: 40px;	
		padding-left: 5px;
		color: rgb(51, 51, 51);
	}
	.firstDateInput{
		margin-left: 50px;
	}
	.aducation{
		text-align: center;
	}
	.schoolInfo{
		width: 800px;
		float: left;
		margin-top: 25px;
	}
	.schoolInfo>div, .activityInfo>div, .certiInfo>div, .benefitInfo>div{
		margin-bottom: 20px;
	}
	.txt_check{
		color: #888;
	}
	.schoolRadio{
		display: none;
	}
	.schoolLabel{
		width: 200px;
		height: 50px;
		line-height: 50px;
		border: 1px solid #dfdfdf;
		margin-bottom: 20px;
	}
	.carrerRadio{
		display: none;
	}
	.carrerLabel{
		width: 200px;
		height: 50px;
		line-height: 50px;
		border: 1px solid #dfdfdf;
		text-align: center;
	}
	
</style>
<script>
	$(function(){
		$(".schoolLabel").click(function(){
			$(this).css("background-color","rgb(78, 205, 196)");	
		});
		
	});
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="contain">
		<form action="resumeManage.do" method="post">
			<em>기본정보</em>
			<div class="grayBox">
				<h3 id="name">이슬기</h3>			<!-- ${sessionScope.m.memberName} -->
				<div class="infoType">
					<pre>
		아이디
		이메일
		휴대폰
					</pre>
				</div>
				<div class="info">
					<pre>
qwe123						<!-- ${sessionScope.m.memberId} -->
ruru0907@naver.com			<!-- ${sessionScope.m.email} -->
010-1234-1234				<!-- ${sessionScope.m.phone} -->
					</pre>
				</div>
			</div>
			<em>이력서 제목</em>
			<div class="grayBox">
				<b>제목<span>*</span></b>
				<input type="text" class="textInput" name="resumeTitle" placeholder="이력서 제목 입력">
			</div>
			
			<em>학력사항</em>
			<div class="grayBox">
				<em>최종학력 정보 입력</em>
				<br><br>
				<div class="aducation">			<!-- radio버튼 display none해주고 라벨로 선택해서 선택시 뒷배경 mint 글씨 흰색으로 변경(아마 자바스크립트로 해야할듯?) -->
	                <label class="schoolLabel" for="school_type_primary">
	                    <input name="schoolType" class="schoolRadio" id="school_type_primary" type="radio" value=1>	<!-- value=1 //초졸 -->
	                    <span class="txt_check">초등학교 졸업</span>
	                </label>
	                <label class="schoolLabel" for="school_type_middle">
	                    <input name="schoolType" class="schoolRadio" id="school_type_middle" type="radio" value=2>		<!-- value=2 //중졸 -->
	                    <span class="txt_check">중학교 졸업</span>
	                </label>
	                <label class="schoolLabel" for="school_type_high">
	                    <input name="schoolType" class="schoolRadio" id="school_type_high" type="radio" value=3>		<!-- value=3 //고졸 -->
	                    <span class="txt_check">고등학교 졸업</span>
	                </label>
	                <label class="schoolLabel" for="school_type_univ" style="background-color: rgb(78, 205, 196); color: #ffffff;">	<!-- script완성하면 style 지우기 -->
	                    <input name="schoolType" class="schoolRadio" id="school_type_univ" type="radio" value=4 checked="">		<!-- value=4 //대졸 -->
	                    <span class="txt_check">대학·대학원 이상 졸업</span>
	                </label>
	            </div>
	            <hr>
				<div class="schoolInfo">
					<div class="schoolNameData">
						<div class="schoolName">
							<b>학교명<span>*</span></b>
						</div>
						<div class="schoolNameInput">
							<input type="text" class="smallTextInput" name="schoolName" placeholder="학교명 입력">
						</div>
					</div>
					<div class="schoolDateData">
						<div class="schoolDate">
							<b>재학기간<span>*</span></b>
						</div>
						<div class="schoolDateInput">
							<input type="date" class="dateInput firstDateInput" name="schoolStartDate"> ~ <input type="date" class="dateInput" name="schoolEndDate">				
						</div>
					</div>
					<div class="schoolLocalData">
						<div class="schoolLocal">
							<b>지역<span>*</span></b>
						</div>
						<div class="schoolLocalInput">
							<input type="text" class="smallTextInput" name="schoolName" placeholder="지역 선택">					
						</div>
					</div>
					<div class="schoolMajorData">		<!-- if value=4(대학생일 경우에만) 전공등록 input이 나오도록 -->
						<div class="schoolMajor">
							<b>전공</b>
						</div>
						<div class="schoolNameInput">
							<select class="selectInput" name="major">
								<option>전공 선택</option>
								<option value=1>전기/전자/정보통신공학</option>
								<option value=2>컴퓨터/시스템공학</option>
								<option value=3>외 공학계열</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			<em>경력사항</em>
			<div class="grayBox">
				<div class="career">			<!-- radio버튼 display none해주고 라벨로 선택해서 선택시 뒷배경 mint 글씨 흰색으로 변경(아마 자바스크립트로 해야할듯?) -->
	                <label class="carrerLabel" for="junior">
	                    <input name="carrerType" class="carrerRadio" id="junior" type="radio" value=1>	<!-- value=1 //주니어(신입) -->
	                    <span class="txt_check">신입</span>
	                </label>
	                <label class="carrerLabel" for="senior">
	                    <input name="carrerType" class="carrerRadio" id="senior" type="radio" value=2>		<!-- value=2 //시니어(경력) -->
	                    <span class="txt_check">경력</span>
	                </label>
	           </div>
			</div>
			<em>대외활동</em>
			<div class="grayBox">
				<div class="activityInfo">
					<div class="activityData">
						<div class="activity">
							<b>활동구분</b>
						</div>
						<div class="activityInput">
							<select class="selectInput" name="activity">	
								<option>활동구분 선택</option>
								<option value=1>교내활동</option>
								<option value=2>인턴</option>
								<option value=3>자원봉사</option>
								<option value=4>아르바이트</option>
								<option value=5>해외연수</option>
							</select>
						</div>
					</div>
					
					<div class="activityNameData">
						<div class="activityName">
							<b>기관/장소</b>
						</div>
						<div class="activityNameInput">
							<input type="text" class="smallTextInput" name="activityName" placeholder="기관/장소 입력">
						</div>
					</div>
					<div class="activityDateData">
						<div class="activityDate">
							<b>활동기간</b>
						</div>
						<div class="activityDateInput">
							<input type="date" class="dateInput firstDateInput" name="activityStartDate"> ~ <input type="date" class="dateInput" name="activityEndDate">				
						</div>
					</div>
					<div class="activityContentData">
						<div class="activityContent">
							<b>활동내용</b>
						</div>
						<div class="activityContentInput">
							<input type="text" class="textInput" name="activityContent" placeholder="활동내용 입력">					
						</div>
					</div>
					
				</div>
			</div>
			<em>자격증/어학/수상내역</em>
			<div class="grayBox">
				<div class="certiInfo">
					<div class="certiNameData">
						<div class="activityName">
							<b>자격증명</b>
						</div>
						<div class="certiNameInput">
							<input type="text" class="smallTextInput" name="certiName" placeholder="자격증명 입력">
						</div>
					</div>
					<div class="certiIssueData">
						<div class="certiIssue">
							<b>발행처</b>
						</div>
						<div class="certiIssueInput">
							<input type="text" class="smallTextInput" name="certiIssue" placeholder="발행처/기관 입력">					
						</div>
					</div>
					<div class="certiPassData">
						<div class="certiPass">
							<b>합격구분</b>
						</div>
						<div class="certiPassInput">
							<select class="selectInput" name="certiPass">	
								<option>합격구분 선택</option>
								<option value=1>필기합격</option>
								<option value=2>실기합격</option>
								<option value=3>최종합격</option>
							</select>
						</div>
					</div>
					<div class="certiDateData">
						<div class="certiDate">
							<b>취득일</b>
						</div>
						<div class="certiDateInput">
							<input type="date" class="dateInput firstDateInput" name="certiDate">			
						</div>
					</div>
				</div>
			</div>
			
			<em>보유기술 및 능력</em>
			<div class="grayBox">
				<!-- 여기 소원누나가 전에 했던 엔터키로 값 받는거 넣기 -->
			</div>
			
			<em>취업 우대사항</em>
			<div class="grayBox">
				<div class="benefitInfo">
					<div class="benefitData">
						<div class="veterans">
							<b>보훈대상</b>
						</div>
						<div class="veteransInput">
							<select class="selectInput" name="veterans">	
								<option value=1>비대상</option>
								<option value=2>대상</option>
							</select>
						</div>
					</div>
					<div class="militaryData">
						<div class="military">
							<b>병역대상</b>
						</div>
						<div class="militaryInput">
							<select class="selectInput" name="military">	
								<option value=1>대상아님</option>
								<option value=2>미필</option>
								<option value=3>군필</option>
								<option value=4>면제</option>
								<option value=5>복무중</option>
							</select>
						</div>
					</div>
					
				</div>
			</div>
			
			<em>자기소개서</em>
			<div class="grayBox">
				<div class="selfIntro">
	              	<div class="">
	                    <input type="text" name="selfIntroTitle" class="textInput" placeholder="자기소개서 제목">
	                </div>
	               
	                <div class="">
	                    <textarea cols="80" rows="10" name="selfIntroContent" class="textarea" placeholder="자기소개서 내용"></textarea>
	                </div>
	                
	           </div>
			</div>
			
			<em>희망 근무지역 선택</em>
			<div class="grayBox">
			
			</div>
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<style>
		.textarea{
			margin-left: 50px;
			width: 700px;
		}
	</style>
</body>
</html>
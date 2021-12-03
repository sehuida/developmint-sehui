<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
	.selfIntro{
		margin: 15px 0px;
	}
	.selfIntroTitle{
		text-align: center;
	}
	.textInput{
		width: 700px;
		height: 40px;
		padding-left: 5px;
		outline: none;
		margin-left: 50px;
	}
	.selfIntroContent{
		text-align: center;
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
	.category{
		text-align: center;
	}

	.txt_check{
		color: #888;
	}
	.category>label{
		width: 180px;
		height: 150px;
		line-height: 150px;
		border: 1px solid #dfdfdf;
		margin-bottom: 20px;
	}
	.category>label>input{
		/* display: none; */
	}

	.carrerLabel{
		width: 200px;
		height: 50px;
		line-height: 50px;
		border: 1px solid #dfdfdf;
		text-align: center;
	}
	.selfIntroContentTextarea{
		padding-top: 10px;
		padding-left: 10px;
		width: 700px;
		border-top: none;
		outline: none;
	}
	
	
	.selectBtn{
		text-align: center;
	}
	.backBtn{
		background-color: orange;
		color: white;
		width: 150px;
		height: 60px;
		font-size: 20px;
		font-weight: 900;
		border: none;
		border-radius: 10px;
		transition: background-color 1s;
	}
	.backBtn:hover{
		background-color: red;
	}
	.resumeBtn{
		background-color: rgb(78, 205, 196);
		color: white;
		width: 150px;
		height: 60px;
		font-size: 20px;
		font-weight: 900;
		border: none;
		border-radius: 10px;
		transition: background-color 1s;
	}
	.resumeBtn:hover{
		background-color: rgb(0, 174, 255);
	}
	
</style>
</head>
<script>
	$(function(){
		
	});
</script>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="contain">
		<form action="resumeManage.do" method="post">
			<em>기본정보</em>
			<br><br><br>
			<hr>
			<div class="grayBox">
				<b>회사명<span>*</span></b>
				<input type="text" class="textInput" name="companyTitle" placeholder="회사명 입력">
			</div>
			

			<div class="grayBox">
				<em>주요 업무 카테고리</em>
				<br><br>
				<p>해당하는 주요 업무의 카테고리를 모두 선택해 주세요.</p>
				<div class="category">
	                <label class="developLabel" for="develop">
	                    <input name="develop" class="developCheckBox" id="develop" type="checkBox" value=1>
	                    <img src="/resources/img/company/develop.PNG">
	                    <span class="txt_check">개발</span>
	                </label>
	                <label class="designLabel" for="design">
	                    <input name="design" class="designCheckBox" id="design" type="checkBox" value=2>
	                    <img src="/resources/img/company/design.PNG">
	                    <span class="txt_check">디자인</span>
	                </label>
	                <label class="planLabel" for="plan">
	                    <input name="plan" class="planCheckBox" id="plan" type="checkBox" value=3>
	                    <img src="/resources/img/company/plan.PNG">
	                    <span class="txt_check">기획</span>
	                </label>
	            </div>
			</div>
			
			<!-- -------- -->
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
	              	<div class="selfIntroTitle">
	                    <input type="text" name="selfIntroTitle" class="textInput" style="margin: 0;" placeholder="자기소개서 제목">
	                </div>
	               
	                <div class="selfIntroContent">
	                    <textarea cols="80" rows="10" name="selfIntroContent" class="selfIntroContentTextarea" placeholder="자기소개서 내용"></textarea>
	                </div>
	                
	           </div>
			</div>
			
			<em>희망 근무지역 선택</em>
			<div class="grayBox">
			
			</div>
			<div class="selectBtn">
				<input type="button" class="backBtn" value="취소">
				<input type="submit" class="resumeBtn" value="저장하기">
			</div>
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
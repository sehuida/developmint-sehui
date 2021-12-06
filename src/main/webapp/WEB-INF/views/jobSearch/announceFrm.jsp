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
		width: 1200px;
		margin: 0 auto;
		margin-bottom: 100px;
	}
	.grayBox{
		width: 900px;
		margin: 0 auto;
		background-color: rgb(250, 250, 250);
		padding: 30px;
		overflow: hidden;
		margin-top: 15px;		
		margin-bottom: 80px;
	}
	.step2Box{
		width: 900px;
		margin: 0 auto;
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
		font-size: 14px;
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
		font-size: 14px;
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
	
	.announceData{
		width: 1100px;
		float: right;	
		position: relative;
	}
	.step{
		position: relative;
		bottom: -330px;
		left: -50px;
	}
	.step>ul{
		list-style: none;
	}
	.step>ul>li{
		font-size: 18px;
		margin-bottom: 5px;
		
	}
	/* 주요 업무 카테고리 */
	.category>div{
		display: inline-block;
		position: relative;	
	}
	.category>div>label{
		width: 200px;
		height: 150px;
		border: 1px solid #dfdfdf;
		margin-bottom: 20px;
	}
	.categoryLabel>img, .categoryLabel>span{
		position: relative;
		top: 45px;
	}
	.categoryLabel>img{
		height: 45px;
	}
	.category>div>input{
		display: none;
	}
	
	/* 분야 */
	.fields{
		overflow: hidden;
		margin-left: 15px;
	}
	.fields>div{
		float: left;
		margin-left: 15px;
	}
	.fields>div>input{
		display: none;
	}
	
	.fieldsLabel{
		background-color: #dfdfdf;
		padding: 5px 15px;
		color: gray;
		border-radius: 15px;
		font-size: 14px;
	}
	.announContent{
		text-align: center;
	}
	.announContentTextarea{
		outline-style: none;
		padding: 10px;
		font-size: 14px;
		margin-top: 30px;
	}
	.step2Box>p{
		font-size: 13px;
		margin-left: 20px;
	}
</style>
</head>
<script>
	$(function(){
		$(".categoryCheckBox").change(function(){
			$(this).next().css("border","3px solid rgb(78,205,196)");
			$(this).next().find("span").css("font-weight","900");
			$(this).parent().siblings().find("label").css("border","1px solid gray");
		});
	});
</script>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
		
	<div class="contain">
		<div class="step">
			<ul>
				<li>1. 기본정보</li>
				<li>2. 구인공고 상세</li>
				<li>3. 급여 및 근무</li>
				<li>4. 구인공고 등록</li>
			</ul>
		</div>
		<div class="announceData">
			<form action="announceManage.do" method="post">
				<div class="step1">
					<em>기본정보</em>
					<br><br><br>
					<hr>
					<br><br>
					<div class="grayBox">
						<em>회사명</em>
						<br><br>
						<b>회사명<span>*</span></b>
						<input type="text" class="textInput" name="companyTitle" placeholder="회사명 입력">
					</div>
					
		
					<div class="grayBox">
						<em>주요 업무 카테고리</em>
						<br><br>
						<p>해당하는 주요 업무의 카테고리를 모두 선택해 주세요.</p>
						<div class="category">
							<div class="develop">
				                <input name="category" class="categoryCheckBox" id="develop" type="checkBox" value=1>
				                <label class="categoryLabel" for="develop">
				                    <img src="/resources/img/company/develop.PNG"><br>
				                    <span class="txt_check">개발</span>
				                </label>
				                
							</div>
							<div class="design">
				                <input name="category" class="categoryCheckBox" id="design" type="checkBox" value=2>
				                <label class="categoryLabel" for="design">
				                    <img src="/resources/img/company/design.PNG"><br>
				                    <span class="txt_check">디자인</span>
				                </label>
			                </div>
			                <div class="plan">
				                <input name="category" class="categoryCheckBox" id="plan" type="checkBox" value=3>
				                <label class="categoryLabel" for="plan">
				                    <img src="/resources/img/company/plan.PNG"><br>
				                    <span class="txt_check">기획</span>
				                </label>
			                </div>
			            </div>
					</div>
					
					<div class="grayBox">
						<em>분야</em>
						<br><br>
						<div class="fields">
							<div class="web">
				                <input name="fields" class="fieldsCheckBox" id="web" type="checkBox" value=1>
				                <label class="fieldsLabel" for="web">웹</label>  
							</div>
							<div class="app">
				                <input name="fields" class="fieldsCheckBox" id="app" type="checkBox" value=2>
				                <label class="fieldsLabel" for="app">어플리케이션</label>
			                </div>
			                <div class="com">
				                <input name="fields" class="fieldsCheckBox" id="com" type="checkBox" value=3>
				                <label class="fieldsLabel" for="com">커머스, 쇼핑몰</label>
			                </div>
			                <div class="com">
				                <input name="fields" class="fieldsCheckBox" id="sw" type="checkBox" value=4>
				                <label class="fieldsLabel" for="sw">일반 소프트웨어</label>
			                </div>
			                <div class="com">
				                <input name="fields" class="fieldsCheckBox" id="pub" type="checkBox" value=5>
				                <label class="fieldsLabel" for="pub">퍼블리싱</label>
			                </div>
			                <div class="com">
				                <input name="fields" class="fieldsCheckBox" id="im" type="checkBox" value=6>
				                <label class="fieldsLabel" for="im">임베디드</label>
			                </div>
			                <div class="com">
				                <input name="fields" class="fieldsCheckBox" id="game" type="checkBox" value=7>
				                <label class="fieldsLabel" for="game">게임</label>
			                </div>
			                <div class="com">
				                <input name="fields" class="fieldsCheckBox" id="etc" type="checkBox" value=8>
				                <label class="fieldsLabel" for="etc">기타</label>
			                </div>
			            </div>
					</div>
					
					<div class="grayBox">
						<em>학력</em>
						<br><br>
						<div class="school">
							<b>최종학력</b>
						</div>
						<div class="activityInput">
							<select class="selectInput" name="activity">	
								<option value=1>초졸</option>
								<option value=2>중졸</option>
								<option value=3>고졸</option>
								<option value=4 selected="">대졸이상</option>
							</select>
						</div>		
					</div>
					
					<div class="grayBox">
						<em>근무형태</em>
						<br><br>
						<div class="school">
							<b>근무형태</b>
						</div>
						<div class="activityInput">
							<select class="selectInput" name="activity">	
								<option value=1>정규직</option>
								<option value=2>계약직</option>
								<option value=3>아르바이트</option>
								<option value=4>인턴</option>
								<option value=4>프리랜서</option>
							</select>
						</div>		
					</div>
					
					<!-- 다음버튼 -->
					
				</div>
				
				<div class="step2">
					<em>상세정보</em>
					<br><br><br>
					<hr>
					<br><br>
					<div class="step2Box">
						<h5 style="color: black; font-weight: 900;">상시 업무 내용</h5>
						<p style="color: rgb(108, 108, 108);">
							업무 내용을 상세하게 작성해주실수록, 더 적합한 파트너를 만날 수 있습니다.<br>
							파트너가 알아야 할 유의사항(필수 사항, 전문 경험 등)도 함께 작성해 주세요.
						</p>
			            <div class="announContent">
			                <textarea cols="120" rows="30" name="announContent" class="announContentTextarea" placeholder="  

  <프로젝트의 현재 상황>
  예시) 프로젝트의 목적, 현재 준비 상황, 진행 계획 등

  <상세한 업무 내용>
  예시) 사이트의 용도, 주요 기능 List, 작업 분량, 필요한 조건 등

  <참고자료 / 유의사항>
  예시) 참고사이트, 기타 유의사항 등"></textarea>
			        	</div>  
			    	</div>
			    	
			    	<div class="step2Box">
						<h5 style="color: black; font-weight: 900; margin-bottom: 0px;">관련기술</h5>
						<t style="font-size: 13px;">더 적합한 파트너가 프로젝트를 찾고 지원할 수 있도록 프로젝트와 관련된 기술을 입력해주세요.</t>
						<br><br>
						
						<input type="text" class="textInput" style="width: 800px; margin-left: 0px;" name="skiils" placeholder="추가할 기술명을 입력하세요."><br>
						<t style="font-size: 13px; margin-left: 30px; color: rgb(108,108,108);">기술명을 입력한 후, 해당하는 기술을 선택하거나 엔터키를 눌러 추가해 주세요.</t>
					</div>
					
					<!-- 이전, 다음버튼 -->	
				</div>
				
				<div class="step3">
					<em>급여 및 근무</em>
					<br><br><br>
					<hr>
					<br><br>
					<div class="grayBox">
						<em>급여</em>
						<br><br>
						<b>급여</b>
						<input type="text" class="smallTextInput" name="money" placeholder="급여 입력">
					</div>
					
					<div class="grayBox">
						<em>근무 일시</em>
						<br><br>
						<div class="school">
							<b>근무 횟수</b>
						</div>
						<div class="activityInput">
							<select class="selectInput" name="activity">	
								<option value=0>근무 횟수 선택</option>
								<option value=1>주 4일</option>
								<option value=2>주 5일</option>
								<option value=3>주 6일</option>
								<option value=5>주말</option>
							</select>
						</div>		
					</div>
					
					<div class="grayBox">
						<em>근무형태</em>
						<br><br>
						<div class="school">
							<b>근무형태</b>
						</div>
						<div class="activityInput">
							<select class="selectInput" name="activity">	
								<option value=1>정규직</option>
								<option value=2>계약직</option>
								<option value=3>아르바이트</option>
								<option value=4>인턴</option>
								<option value=4>프리랜서</option>
							</select>
						</div>		
					</div>
					
					<!-- 이전, 등록하기 버튼 -->
					
				</div>
				
				<div class="selectBtn">
					<input type="button" class="backBtn" value="취소">
					<input type="submit" class="resumeBtn" value="저장하기">
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
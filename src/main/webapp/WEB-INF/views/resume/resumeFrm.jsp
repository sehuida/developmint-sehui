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
		margin-bottom: 30px;
	}
	em{
		float: left;
		font-style: normal;
		font-weight: 900;
		font-size: 20px;
	}
	a{
		color: rgb(51, 51, 51);
		float: left;
		font-size: 14px;
		line-height: 40px;
		margin-left: 10px;
	}
	span{
		color: red;
	}
	#name{
		color: black;
		font-weight: 900;
		font-size: 20px;
		padding-left: 20px;
		padding-bottom: 10px;
		
	}
	.infoType{
		float: left;
	}
	.info{
		float: left;
	}
	.textInput{
		width: 800px;
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
	}
	.dateInput{
		width: 130px;
		height: 40px;	
	}
	.firstDateInput{
		margin-left: 50px;
	}
	.schoolInfo{
		width: 800px;
		float: left;
	}
	.schoolInfo>div{
		margin-bottom: 20px;
	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="contain">
		<em>기본정보</em>
		<div class="grayBox">
			<h3 id="name">이슬기</h3>
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
			<a>제목<span>*</span></a>
			<input type="text" class="textInput" name="resumeTitle" placeholder="이력서 제목 입력">
		</div>
		
		<em>학력사항</em>
		<div class="grayBox">
			<em>최종학력 정보 입력</em>
			<br><br>
			<div class="schoolInfo">
				<div class="schoolNameData">
					<div class="schoolName">
						<a>학교명<span>*</span></a>
					</div>
					<div class="schoolNameInput">
						<input type="text" class="smallTextInput" name="schoolName" placeholder="학교명 입력">
					</div>
				</div>
				<div class="schoolDateData">
					<div class="schoolDate">
						<a>재학기간<span>*</span></a>
					</div>
					<div class="schoolDateInput">
						<input type="date" class="dateInput firstDateInput"> ~ <input type="date" class="dateInput">				
					</div>
				</div>
				<div class="schoolLocalData">
					<div class="schoolLocal">
						<a>지역<span>*</span></a>
					</div>
					<div class="schoolLocalInput">
						<input type="text" class="smallTextInput" name="schoolName" placeholder="지역 선택">					
					</div>
				</div>
				<div class="schoolMajorData">
					<div class="schoolMajor">
						<a>전공</a>
					</div>
					<div class="schoolNameInput">
						<select class="selectInput">
							<option>전공 선택</option>
							<option>전기/전자/정보통신공학</option>
							<option>컴퓨터공학</option>
							<option>전공 선택</option>
						</select>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
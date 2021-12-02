<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공모 등록</title>
</head>
<style>
#mainTitel{
	font-size: 30px;
	font-weight: bold;
	margin-bottom: 30px;
	margin-top: 50px;
}
.dateInput{
	float: left;
}
#dateTd{
	overflow: hidden;
}
#dateTd>span{
	float: left;
}
.submitBtn{
	width: 990px;
}
.prize{
	float: left;
}
#won{
	line-height: 35px;
	margin-left: 5px;
	font-size: 18px;
}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container" style="margin-bottom: 100px; margin-left: 400px;">
		<p id="mainTitel">공모전 등록</p>
		<form action="/insertContest.do" method="post" enctype="multipart/form-data">

			<table class="table" style="width: 1000px;">
				<tr>
					<th class="table-active">주최사</th>
					<td><input type="text" name="contestHost" class="form-control"></td>
				</tr>
				
				<tr>
					<th class="table-active">공모명</th>
					<td><input type="text" name="contestTitle" class="form-control"></td>
				</tr>
				<tr>
					<th class="table-active">접수기간</th>
					<td id="dateTd">
						<input type="date" class="form-control dateInput" name="contestDate" style="width: 47%">
						<span>　~　</span>
						<input type="date" class="form-control" id="mindate" min="" name="contestDeadline" style="width: 47%">
					</td>
				</tr>
				<tr>
					<th class="table-active">공모유형</th>
					<td>
						<label style="margin-right:20px;"><input type="radio" name="contestType" value="1" class="form-check-input" >기획</label> 
						<label style="margin-right:20px;"><input type="radio" name="contestType" value="2" class="form-check-input">개발</label> 
						<label><input type="radio" name="contestType" value="3" class="form-check-input">디자인</label>
					</td>
				</tr>
				<tr>
					<th class="table-active">참가자격</th>
					<td>
						<label style="margin-right:20px;"><input type="checkbox" name="contestQualify" value="대학생" class="form-check-input">대학생</label>
						<label style="margin-right:20px;"><input type="checkbox" name="contestQualify" value="대학원생" class="form-check-input">대학원생</label> 
						<label style="margin-right:20px;"><input type="checkbox" name="contestQualify" value="고등학생"class="form-check-input">일반인</label> 
						<label style="margin-right:20px;"><input type="checkbox" name="contestQualify" value="일반인" class="form-check-input">고등학생</label> 
						<label><input type="checkbox" name="contestQualify" value="제한없음" class="form-check-input">제한없음</label>
						</td>
				</tr>
				<tr>
					<th class="table-active">1등 시상금</th>
					<td><input type="text" name="contestPrize" class="form-control prize" style="width: 47%" placeholder="숫자만 입력해주세요"><span id="won">만원</span></td>
				</tr>
				<tr>
					<th class="table-active">담당자 이메일</th>
					<td><input type="email" name="email" class="form-control"></td>
				</tr>
				<tr>
					<th class="table-active">담당자 전화번호</th>
					<td><input type="text" name="phone" class="form-control" placeholder="010-XXXX-XXXX"></td>
				</tr>
				<tr>
					<th class="table-active">공모요강</th>
					<td><textarea id="contestContent" name="contestContent" class="form-control" style="height: 600px"></textarea></td>
				</tr>
				<tr>
					<th class="table-active">포스터 이미지</th>
					<td><input type="file" class="form-control-file" name="files"></td>
				</tr>
				<tr>
					<td colspan="2"><i class="bi bi-exclamation-circle-fill"></i>
						공모전은 관리자 승인 후 등록됩니다.
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="button" class="btn btn-primary submitBtn" value="등록하기">
					</th>
				</tr>
			</table>
			<input type="hidden" name="memberId" value="seulgi">
		</form>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	
<script>

	//접수기간 데드라인 선택은 오늘날짜부터 선택 가능
	$(function(){
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1;
		var yyyy = today.getFullYear();
		 if(dd<10){
		        dd='0'+dd
		    } 
		    if(mm<10){
		        mm='0'+mm
		    } 
		today = yyyy+'-'+mm+'-'+dd;
		document.getElementById("mindate").setAttribute("min", today);
	});

	//모두 입력해야 등록가능
	$(".submitBtn").click(function(){
		console.log("dd");
		if($('input[name=contestHost]').val() == ""){
			alert("주최사를 입력해주세요.");
			return;
		}
		if($('input[name=contestTitle]').val() == ""){
			alert("공모명을 입력해주세요.");
			return;
		}
		if($('input[name=contestDate]').val() == ""){
			alert("공모 시작 날짜를 입력해주세요.");
			return;
		}
		if($('input[name=contestDeadline]').val() == ""){
			alert("공모 종료 날짜를 입력해주세요.");
			return;
		}
		var radioCheck = $('input[name=contestType]').is(":checked");
		if(!radioCheck){
			alert("공모유형을 체크해주세요.");
			return;
		}
		var checkBoxCheck = $('input[name=contestQualify]').is(":checked");
		if(!checkBoxCheck){
			alert("공모자격을 체크해주세요.");
			return;
		}
		
		if($('input[name=contestPrize]').val() == ""){
			alert("시상금을 입력해주세요.");
			return;
		}
		
		//1등 시상금 유효성검사
		var numCheck = /^[0-9]*$/;
		if(!numCheck.test($('input[name=contestPrize]').val())){
			alert("시상금은 숫자만 입력가능합니다.");
			return;
		}
		
		if($('input[name=email]').val() == ""){
			alert("담당자 이메일을 입력해주세요.");
			return;
		}
		if($('input[name=phone]').val() == ""){
			alert("담당자 전화번호를 입력해주세요.");
			return;
		}
		if($('input[name=contestContent]').val() == ""){
			alert("공모요강을 입력해주세요.");
			return;
		}
		if($('input[name=files]').val() == ""){
			alert("공모전 포스터를 등록해주세요.");
			return;
		}
		
		//전부 입력됐으면 form data 전송
		$("form").submit();
	})
</script>
</body>
</html>
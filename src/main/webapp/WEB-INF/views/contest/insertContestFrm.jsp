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
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container" style="margin-bottom: 100px; margin-left: 400px;">
		<p id="mainTitel">공모전 등록</p>
		<form action="/insertContest.do" method="post">
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
						<input type="date" class="form-control" name="contestDeadline" style="width: 47%">
					</td>
				</tr>
				<tr>
					<th class="table-active">공모유형</th>
					<td>
						<label style="margin-right:20px;"><input type="radio" name="contestType" alue="1" class="form-check-input" >기획</label> 
						<label style="margin-right:20px;"><input type="radio" name="contestType" value="2" class="form-check-input">개발</label> 
						<label><input type="radio" name="contestType" value="3" class="form-check-input">디자인</label>
					</td>
				</tr>
				<tr>
					<th class="table-active">참가자격</th>
					<td>
						<label style="margin-right:20px;"><input type="checkbox" name="contestQualify" value="1" class="form-check-input">대학생</label>
						<label style="margin-right:20px;"><input type="checkbox" name="contestQualify" value="2" class="form-check-input">대학원생</label> 
						<label style="margin-right:20px;"><input type="checkbox" name="contestQualify" value="3"class="form-check-input">일반인</label> 
						<label style="margin-right:20px;"><input type="checkbox" name="contestQualify" value="4" class="form-check-input">고등학생</label> 
						<label><input type="checkbox" name="contestQualify" value="5" class="form-check-input">제한없음</label>
						</td>
				</tr>
				<tr>
					<th class="table-active">시상금</th>
					<td><input type="text" name="contestPrize" class="form-control"></td>
				</tr>
				<tr>
					<th class="table-active">담당자 이메일</th>
					<td><input type="email" name="email" class="form-control"></td>
				</tr>
				<tr>
					<th class="table-active">담당자 전화번호</th>
					<td><input type="text" name="phone" class="form-control"></td>
				</tr>
				<tr>
					<th class="table-active">공모요강</th>
					<td><textarea id="contestContent" name="contestContent" class="form-control" style="height: 600px"></textarea></td>
				</tr>
				<tr>
					<th class="table-active">포스터 이미지</th>
					<td><input type="file" class="form-control-file" name="contestImg"></td>
				</tr>
				<tr>
					<td colspan="2"><i class="bi bi-exclamation-circle-fill"></i>
						공모전은 관리자 승인 후 등록됩니다.
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="submit" class="btn btn-primary submitBtn" value="등록하기">
					</th>
				</tr>
			</table>
		</form>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>
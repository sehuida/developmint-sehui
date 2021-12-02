<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container * {
	text-decoration: none;
}

.container {
	min-width: 1200px;
}

.container>h3 {
	display: flex;
	justify-content: center;
	margin-top: 50px;
	font-size: 45px;
	font-weight: 900;
}

.gosu, .g-content {
	display: flex;
	justify-content: center;
	margin-top: 100px;
	margin-bottom: 100px;
}

.gosu table {
	width: 100%;
}

.gosu .gosu_img {
	text-align: center;
	width: 300px;
	height: 200px;
}

.gosu td {
	padding: 10px;
	padding-right: 30px;
	padding-left: 30px;
	text-align: left;
}

.gosu hr {
	max-width: 100%;
	font-weight: bold;
	background-color: rgb(199, 199, 199);
	height: 1px;
}

.gosu button:hover {
	background-color: rgb(223, 245, 235);
}

.gosu li {
	list-style-type: none;
}

.g-content input, .g-content textarea {
	padding: 10px;
}

.g-content tr th, .g-content tr td {
	padding: 20px;
	padding-left: 40px;
	padding-right: 40px;
}

input:focus, textarea:focus {
	outline: none;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<h3>
			<span style="color: rgb(78, 205, 196);">고수</span>에게 피드백 신청하기
		</h3>



		<div class="gosu">
			<button class="card border-primary mb-3"
				style="border-width: 5px; max-width: 1800rem; border-radius: 50px; padding: 30px; width: 90%;">
				<table>
					<tr>
						<td rowspan="4" class="gosu_img" style="width: 30%;"><img
							src="/resources/img/gosu/g_img_basic.png"
							style="border-radius: 50%;"></td>
						<td><a href="">제목</a></td>
					</tr>
					<tr>
						<td><hr></td>
					</tr>
					<tr>

						<td>
							<li>한줄소개</li>
						</td>
					</tr>
					<tr>
						<td>
							<li>피드백 예상견적</li>
						</td>
					</tr>
					<tr>
						<td style="text-align: center; font-weight: bold;">고수 xxxx</td>
						<td>4.0</td>
					</tr>
				</table>
			</button>
		</div>
		<div class="g-content">
			<div>
				<table border="1">
					<tr>
						<th>제목 <span style="color: red;">* </span></th>
						<td><input type="text" name="" style="width: 100%;"></td>
					</tr>
					<tr>
						<th>내용 <span style="color: red;"> * </span></th>
						<td><textarea cols="100" rows="30" name=""
								placeholder="
                        * 피드백 받고 싶은 내용에 대해 자세하게 적어주세요!
                        
                        "></textarea></td>
					</tr>

				</table>
			</div>
		</div>
		<div style="display: flex; justify-content: center;">
			<a class="btn btn-primary"
				style="width: 200px; margin: 100px; padding: 10px;"><b>피드백
					신청하기</b></a>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
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
	color: black;
}

.container {
	min-width: 1200px;
}

input:focus, textarea:focus {
	outline: none;
}

.container>h3 {
	display: flex;
	justify-content: center;
	margin-top: 50px;
	font-size: 45px;
	font-weight: 900;
}

.talk-wrap {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	margin-top: 100px;
	margin-bottom: 100px;
}

.g-feedback h3 {
	font-weight: bold;
	margin-top: 100px;
	margin-bottom: 40px;
}

.g-feedback span {
	padding: 20px;
}

.talk-one {
	border: 4px solid rgb(144, 209, 180);
	width: 80%;
	padding-top: 40px;
	margin-bottom: 100px;
}

.talk-one table img {
	border-radius: 50%;
	width: 60px;
}

.talk-one table {
	width: 100%;
}

.talk-one table td, .talk-one table th {
	padding: 20px;
}

.talk-me {
	background-color: rgb(144, 209, 180);
	border: 1px solid gray;
}

.talk-me p {
	background-color: white;
}

.talk-sub {
	display: flex;
	justify-content: center;
}

.talk-sub>div {
	padding: 40px;
	padding-left: 60px;
	padding-right: 60px;
}

.talk-sub table th, .talk-sub table td {
	padding: 10px;
}

.gosu-mail {
	display: flex;
	justify-content: right;
}

.gosu-mail a {
	font-weight: bold;
	font-size: 20px;
}

.gosu-mail span {
	font-weight: bold;
	color: white;
	background-color: red;
	border-radius: 50%;
	text-align: center;
	width: 20px;
	margin-left: 50px;
	display: block;
	font-size: 13px;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<div class="gosu-mail">
			<a href=""><span>1</span>요청서</a>
		</div>
		<h3>
			<span style="color: rgb(78, 205, 196);">신청한 내역</span>
		</h3>
		<div class="g-feedback">
			<h3>Q. &nbsp;미묘한 교향악이다</h3>
			<span>피드백내용내욘애내앵요ㅐ요ㅐ요ㅐ요애ㅛ애</span>
		</div>

		<div class="talk-wrap">
			<div class="talk-one">
				<table>
					<tr>
						<th style="text-align: right; width: 150px;"><img
							src="/resources/img/gosu/g_img_basic.png"></th>
						<th style="font-size: 30px;"><span
							style="color: rgb(78, 205, 196);">고수 </span> XXX</th>
						<td style="text-align: right; padding-right: 50px; color: gray;">2021.XX.XX</td>
					</tr>
					<tr>
						<th style="text-align: right;">첨부파일</th>
						<td colspan="2"><input type="file"></td>
					</tr>
					<tr>
						<td colspan="3" style="text-align: center; padding: 40px;"><p
								style="border: 1px solid gray; padding: 30px;">ddddddddddddddddddddddddddddd
								dddddddddddddddddddddddddddddddddd
								ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
								dddddddddddddddddddddddddddddddddd
								dddddddddddddddddddddddddddddddddd
								dddddddddddddddddddddddddddddddddd
								dddddddddddddddddddddddddddddddddd</p></td>
					</tr>
				</table>
			</div>
			<div class="talk-one talk-me">
				<table>

					<tr>
						<th style="text-align: right;">첨부파일</th>
						<td><input type="file"></td>
						<td style="text-align: right; padding-right: 50px; color: gray;">2021.XX.XX</td>
					</tr>
					<tr>
						<td colspan="3" style="text-align: center; padding: 40px;"><p
								style="border: 1px solid gray; padding: 30px;">ddddddddddddddddddddddddddddd
								dddddddddddddddddddddddddddddddddd
								ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
								dddddddddddddddddddddddddddddddddd
								dddddddddddddddddddddddddddddddddd
								dddddddddddddddddddddddddddddddddd
								dddddddddddddddddddddddddddddddddd</p></td>
					</tr>
				</table>
			</div>
			<div class="talk-one">
				<table>
					<tr>
						<th style="text-align: right; width: 150px;"><img
							src="/resources/img/gosu/g_img_basic.png"></th>
						<th style="font-size: 30px;"><span
							style="color: rgb(78, 205, 196);">고수 </span> XXX</th>
						<td style="text-align: right; padding-right: 50px; color: gray;">2021.XX.XX</td>
					</tr>
					<tr>
						<th style="text-align: right;">첨부파일</th>
						<td colspan="2"><input type="file"></td>
					</tr>
					<tr>
						<td colspan="3" style="text-align: center; padding: 40px;"><p
								style="border: 1px solid gray; padding: 30px;">ddddddddddddddddddddddddddddd
								dddddddddddddddddddddddddddddddddd
								ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
								dddddddddddddddddddddddddddddddddd
								dddddddddddddddddddddddddddddddddd
								dddddddddddddddddddddddddddddddddd
								dddddddddddddddddddddddddddddddddd</p></td>
					</tr>
				</table>
			</div>
			<div class="talk-one talk-me">
				<table>

					<tr>
						<th style="text-align: right;">첨부파일</th>
						<td><input type="file"></td>
						<td style="text-align: right; padding-right: 50px; color: gray;">2021.XX.XX</td>
					</tr>
					<tr>
						<td colspan="3" style="text-align: center; padding: 40px;"><p
								style="border: 1px solid gray; padding: 30px;">ddddddddddddddddddddddddddddd
								dddddddddddddddddddddddddddddddddd
								ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
								dddddddddddddddddddddddddddddddddd
								dddddddddddddddddddddddddddddddddd
								dddddddddddddddddddddddddddddddddd
								dddddddddddddddddddddddddddddddddd</p></td>
					</tr>
				</table>
			</div>
			<div class="talk-one">
				<table>
					<tr>
						<th style="text-align: right; width: 150px;"><img
							src="/resources/img/gosu/g_img_basic.png"></th>
						<th style="font-size: 30px;"><span
							style="color: rgb(78, 205, 196);">고수 </span> XXX</th>
						<td style="text-align: right; padding-right: 50px; color: gray;">2021.XX.XX</td>
					</tr>
					<tr>
						<th style="text-align: right;">첨부파일</th>
						<td colspan="2"><input type="file"></td>
					</tr>
					<tr>
						<td colspan="3" style="text-align: center; padding: 40px;"><p
								style="border: 1px solid gray; padding: 30px;">ddddddddddddddddddddddddddddd
								dddddddddddddddddddddddddddddddddd
								ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
								dddddddddddddddddddddddddddddddddd
								dddddddddddddddddddddddddddddddddd
								dddddddddddddddddddddddddddddddddd
								dddddddddddddddddddddddddddddddddd</p></td>
					</tr>
				</table>
			</div>
			<div class="talk-one talk-me">
				<table>

					<tr>
						<th style="text-align: right;">첨부파일</th>
						<td><input type="file"></td>
						<td style="text-align: right; padding-right: 50px; color: gray;">2021.XX.XX</td>
					</tr>
					<tr>
						<td colspan="3" style="text-align: center; padding: 40px;"><p
								style="border: 1px solid gray; padding: 30px;">ddddddddddddddddddddddddddddd
								dddddddddddddddddddddddddddddddddd
								ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
								dddddddddddddddddddddddddddddddddd
								dddddddddddddddddddddddddddddddddd
								dddddddddddddddddddddddddddddddddd
								dddddddddddddddddddddddddddddddddd</p></td>
					</tr>
				</table>
			</div>
		</div>
		<hr>
		<span style="color: gray; font-size: small;">* 전송할 내용을 아래에
			입력해주세요<br> * 첨부파일은 한 번에 하나씩만 전송 가능합니다.
		</span> <br> <br> <br>
		<div class="talk-sub">

			<div>
				<form>
					<table>
						<tr>
							<th>첨부파일</th>
							<td><input type="file"></td>
						</tr>
						<tr>
							<td colspan="2"><textarea name="" cols="100" rows="10"></textarea></td>
						</tr>
						<tr style="text-align: right;">
							<td colspan="2"><button type="submit"
									class="btn btn-primary">전송</button></td>
						</tr>
					</table>

				</form>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.container * {
	text-decoration: none;
	color: black;
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

.container>.g-msg {
	margin: 50px;
	display: flex;
	justify-content: center;
	color: rgb(153, 153, 153);
	text-align: center;
	font-size: 13px;
	font-weight: bold;
}

.gosu {
	display: flex;
	justify-content: center;
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

.gosu-search {
	display: flex;
	justify-content: right;
	margin-top: 50px;
	margin-bottom: 50px;
}

.gosu-search * {
	padding: 10px;
}

.gosu-search input {
	width: 350px;
}

.gosu button:hover {
	background-color: rgb(223, 245, 235);
}

#pageNavi {
	display: flex;
	justify-content: center;
}

.gosu-write-wrap {
	position: fixed;
	z-index: 1000;
	
	margin-left:1200px;
}

.gosu-write {
	border: 1px solid rgb(190, 190, 190);
	padding: 40px;
	text-align: center;
	justify-content: right;
	background-color: white;
}

.gosu-write a {
	margin-top: 20px;
	padding: 10px;
	width: 200px;
}

.gosu-write * {
	font-weight: bold;
	line-height: 30px;
}
  .gosu-mail{
        display: flex;
        justify-content: right;
        
    }
    .gosu-mail a{
        font-weight: bold;
        font-size: 20px;
    }
    .gosu-mail span{
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
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
	<div class="gosu-mail">
			<a href="/gosuRequestList.do"><span>1</span>요청서</a>
	</div>
		<h3>
			<span style="color: rgb(78, 205, 196);">고수</span>를 소개합니다
		</h3>
		<div class="g-msg">
			고수에게 피드백을 신청해보세요!<br> 당신의 작품을 평가해줍니다. 마음껏 질문하세요!
		</div>
		<div class="gosu-search">

			<input type="text" value="" placeholder="내용을 입력해주세요"> <select>
				<option value="" selected disabled hidden>검색</option>
				<option value="">제목</option>
				<option value="">작성자</option>
			</select>

		</div>
		<c:if test="${sessionScope.m.memberType eq 2}">
		<div class="gosu-write-wrap">
			<div class="gosu-write">
				<h5 style="font-size: small; color: gray;">
					고수님의 능력을<br> 마음껏 펼쳐주세요!
				</h5>
				<a href="/gosuWriteFrm.do" class="btn btn-primary" style="font-weight:bold;">작성하기</a>
			</div>
		</div>
		</c:if>
		<div class="gosu-wrap">
			<div class="gosu">
				<button type="button" class="card border-primary mb-3"
					style="border-width: 5px; max-width: 1800rem; border-radius: 50px; padding: 30px; width: 90%;">
					<table>
						<tr>
							<td rowspan="4" class="gosu_img" style="width: 30%;"><img
								src="/resources/img/gosu/g_img_basic.png"
								style="border-radius: 50%;"></td>
							<td><a href="/gosuContent.do">제목</a></td>
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
			<div class="gosu">
				<button type="button" class="card border-primary mb-3"
					style="border-width: 5px; max-width: 1800rem; border-radius: 50px; padding: 30px; width: 90%;">
					<table>
						<tr>
							<td rowspan="4" class="gosu_img" style="width: 30%;"><img
								src="/resources/img/gosu/g_img_basic.png"
								style="border-radius: 50%;"></td>
							<td><a href="/gosuContent.do">제목</a></td>
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
			<div class="gosu">
				<button type="button" class="card border-primary mb-3"
					style="border-width: 5px; max-width: 1800rem; border-radius: 50px; padding: 30px; width: 90%;">
					<table>
						<tr>
							<td rowspan="4" class="gosu_img" style="width: 30%;"><img
								src="/resources/img/gosu/g_img_basic.png"
								style="border-radius: 50%;"></td>
							<td><a href="/gosuContent.do">제목</a></td>
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
			<div class="gosu">
				<button type="button" class="card border-primary mb-3"
					style="border-width: 5px; max-width: 1800rem; border-radius: 50px; padding: 30px; width: 90%;">
					<table>
						<tr>
							<td rowspan="4" class="gosu_img" style="width: 30%;"><img
								src="/resources/img/gosu/g_img_basic.png"
								style="border-radius: 50%;"></td>
							<td><a href="/gosuContent.do">제목</a></td>
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
			<div class="gosu">
				<button type="button" class="card border-primary mb-3"
					style="border-width: 5px; max-width: 1800rem; border-radius: 50px; padding: 30px; width: 90%;">
					<table>
						<tr>
							<td rowspan="4" class="gosu_img" style="width: 30%;"><img
								src="/resources/img/gosu/g_img_basic.png"
								style="border-radius: 50%;"></td>
							<td><a href="/gosuContent.do">제목</a></td>
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
			<div class="gosu">
				<button type="button" class="card border-primary mb-3"
					style="border-width: 5px; max-width: 1800rem; border-radius: 50px; padding: 30px; width: 90%;">
					<table>
						<tr>
							<td rowspan="4" class="gosu_img" style="width: 30%;"><img
								src="/resources/img/gosu/g_img_basic.png"
								style="border-radius: 50%;"></td>
							<td><a href="/gosuContent.do">제목</a></td>
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
			<div class="gosu">
				<button type="button" class="card border-primary mb-3"
					style="border-width: 5px; max-width: 1800rem; border-radius: 50px; padding: 30px; width: 90%;">
					<table>
						<tr>
							<td rowspan="4" class="gosu_img" style="width: 30%;"><img
								src="/resources/img/gosu/g_img_basic.png"
								style="border-radius: 50%;"></td>
							<td><a href="/gosuContent.do">제목</a></td>
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
			<div class="gosu">
				<button type="button" class="card border-primary mb-3"
					style="border-width: 5px; max-width: 1800rem; border-radius: 50px; padding: 30px; width: 90%;">
					<table>
						<tr>
							<td rowspan="4" class="gosu_img" style="width: 30%;"><img
								src="/resources/img/gosu/g_img_basic.png"
								style="border-radius: 50%;"></td>
							<td><a href="/gosuContent.do">제목</a></td>
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
			<div class="gosu">
				<button type="button" class="card border-primary mb-3"
					style="border-width: 5px; max-width: 1800rem; border-radius: 50px; padding: 30px; width: 90%;">
					<table>
						<tr>
							<td rowspan="4" class="gosu_img" style="width: 30%;"><img
								src="/resources/img/gosu/g_img_basic.png"
								style="border-radius: 50%;"></td>
							<td><a href="/gosuContent.do">제목</a></td>
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

		</div>
		<div id="pageNavi"></div>
	</div>

	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
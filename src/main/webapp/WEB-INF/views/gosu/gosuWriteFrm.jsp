<%@page import="kr.or.gosu.vo.GosuProject"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	ArrayList<GosuProject> gProjectList = new ArrayList<GosuProject>();
%>
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
	margin-top: 50px;
	margin-bottom: 50px;
	min-width: 1200px;
}

.container textarea {
	width: 1000px;
	height: 500px;
}

.container .g-plus {
	display: flex;
	justify-content: right;
	color: rgb(78, 205, 196);
	text-align: right;
	font-weight: bold;
}

.container h4 {
	font-weight: bold;
	color: black;
	margin-top: 40px;
	margin-bottom: 40px;
	margin-bottom: 50px;
}

.gosu-content-wrap {
	width: 900px;
}

.gosu {
	display: flex;
	justify-content: center;
}

.gosu img {
	border-radius: 50%;
}

.gosu td {
	width: 500px;
	font-weight: bold;
	font-size: 35px;
}

.gosu td>span {
	color: rgb(78, 205, 196);
}

.gosu-photos ul li {
	float: left;
	list-style-type: none;
	margin: 10px;
}

.gosu-photos {
	overflow: hidden;
}

.gosu-photos ul li img {
	width: 120px;
}

.container>div>div>div {
	margin-top: 100px;
	margin-bottom: 200px;
}

.container>div>div>div>div a {
	padding: 10px;
	width: 150px;
	margin-top: 30px;
}

.review-one li {
	float: left;
	list-style-type: none;
	padding-right: 30px;
}

.review-one {
	overflow: hidden;
	margin: 10px;
	font-size: 12px;
}

.review-avg table td {
	padding: 10px;
}

.g-photo-one button {
	border: none;
	background-color: transparent;
}

.g-photo-one * {
	width: 200px;
}
.g-photo-one img {
	height: 200px;
}

.g-photo-one .g-b {
	height: 30px;
	overflow: hidden;
	display: block;;
	text-overflow:ellipsis;
	text-align: center;
}

.g-photo-one .g-p {
	text-align: center;
	display: block;
	height: 50px;
	overflow: hidden;
	text-overflow:ellipsis;
}

.g-photo-wrap {
	display: flex;
	justify-content: space-around;
	 flex-wrap: wrap;
}

.container input {
	width: 800px;
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

.hrm-wrap {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	display: flex;
	align-items: center;
	justify-content: center;
	z-index: 10000;
}

.hrm-btn-wrap {
	width: 100%;
	display: flex;
	justify-content: center;
}

#hrm-modal h3 {
	background-color: #78c2ad;
	padding: 30px;
	font-weight: 900;
	text-align: center;
}

#hrm-modal {
	background-color: white;
}

.hrm-btn-wrap a {
	margin: 30px;
	margin-top: 50px;
	padding:10px;
	width:100px;
}

.hrm-content b {
	font-size: 20px;
	margin-right: 50px;
	margin-bottom: 100px;
	margin-left: 50px;
}

.hrm-content textarea {
	width: 800px;
	padding: 10px;
}

.hrm-content input {
	padding: 10px;
	margin-bottom: 50px;
	width: 800px;
}

#gimage_container {
	text-align: center;
}

#gimage_container img {
	width: 300px;
}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<div class="gosu-mail">
			<a href="/gosuRequestList.do">요청서</a>
		</div>
		<h4>
			&gt; &nbsp;<span style="color: rgb(78, 205, 196);">고수</span>를 소개합니다!
		</h4>
		<form action="/gosuWrite.do" method="post" enctype="multipart/form-data">
		<div style="text-align: right; margin-top: 50px;">
				<input type="hidden" name="gsouNo"
					value="${sessionScope.m.memberNo }">
		</div>
		<div style="display: flex; justify-content: center;">
			<div class="gosu-content-wrap">
				<div class="gosu">
					<table>
						<tr>
							<c:if test="${empty sessionScope.m.filepath }">
								<th rowspan="6" style="padding: 40px; padding-right: 100px;"><img
									src="/resources/img/gosu/g_img_basic.png" style="width: 250px;"></th>
							</c:if>
							<c:if test="${not empty sessionScope.m.filepath }">
								<th rowspan="6" style="padding: 40px; padding-right: 100px;"><img
									src="/resources/upload/member/${sessionScope.m.filepath }" style="width: 250px;"></th>
							</c:if>
						</tr>
						<tr>
							<td><span style="color: rgb(78, 205, 196);">제목 <span
									style="color: red;">* </span></span></td>
						</tr>
						<tr>
							<td style="font-size: 25px;"><input type="text"
								name="gosuTitle"></td>
						</tr>
						<tr>
							<td><hr></td>
						</tr>
						<tr>
							<td>한줄소개 <span style="color: red;">* </span></td>
						</tr>
						<tr>
							<td style="font-size: 25px;"><input type="text"
								name="gosuSelf"></td>
						</tr>
					</table>
				</div>
				<div>
					<h4>
						상세설명 <span style="color: red;">* </span>
					</h4>
					<div>
						<p>
							<textarea name="gosuExplain" ></textarea>
						</p>
					</div>

				</div>

				<div class="gosu-photos">
					<h4>사진</h4>
					<div style="overflow: hidden;">
						<input type="file" name="photoFilepath" multiple>
					</div>

				</div>


				<div class="gosu-act">
					<h4>
						활동 및 자격 <span style="color: red;">* </span>
					</h4>
					<div >
						<p>
							<textarea name="gosuAct"></textarea>
						</p>
					</div>
				</div>
				<div class="gosu-project">
					<h4>프로젝트</h4>
					<div class="g-photo-wrap"></div>
					<div style="display: flex; justify-content: center;">
						<a id="gProject" class="btn btn-primary"style="padding:10px; width:100px;">추가하기</a>
					</div>
				</div>
				<div class="gosu-feedback">

					<h4>
						피드백 비용 <span style="color: red; margin-right: 100px;">* </span> <span><input
							type="text" name="gosuCost" style="width: 400px;"> &nbsp;
							&nbsp;원</span>
					</h4>

				</div>
			</div>
			<div class="hrm-wrap" style="display: none;">
				<div id="hrm-modal">
					<h3 style="color: white;">프로젝트 추가하기</h3>
					<div class="hrm-content">
						<b>메인사진</b> <input type="file" class="gprojectFilepath"
							id="gprojectFilepath" accept="image/*" ><br>
						<div id="gimage_container"></div>
						<b>제목</b><input type="text" class="gprojectTitle"
							id="gprojectTitle"  placeholder="내용을 입력해주세요."><br>
						<b style="float: left;">내용</b>
						<textarea cols="80" class="gprojectContent" id="gprojectContent"
							placeholder="내용을 입력해주세요."></textarea>
						<br>
					</div>
					<div class="hrm-btn-wrap">
						<a id="hrm-close" class="btn btn-outline-success">취소</a> <a
							id="gProjectArr" class="btn btn-primary" onclick="gProjectArr();">확인</a>
					</div>
				</div>
			</div>
		</div>
		<div style="display: flex; justify-content: center;">
			<button type="submit" class="btn btn-primary"
				style="width: 200px; margin: 100px; padding: 10px;">작성하기</button>
		</div>
		</form>
	</div>
	<script>
		$("#gProject").click(function() {
			var gprojectTitle = $("#gprojectTitle");
			var gprojectContent = $("#gprojectContent");
			var gprojectFilepath = $("#gprojectFilepath");
			gprojectTitle.val("");
			gprojectContent.val("");
			gprojectFilepath.val("");
			$("#gimage_container").empty();
			$(".hrm-wrap").css("display", "flex");

		});
		$("#hrm-close").click(function() {

			$(".hrm-wrap").css("display", "none");

		});

		$(function() {

			var gprojectFilepath = $("#gprojectFilepath");
			var upload = document.querySelector('#gprojectFilepath');
			var preview = document.querySelector('#gimage_container');
		
			upload.addEventListener('change', function(e) {
				$("#gimage_container").empty();
				var get_file = e.target.files;
				var image = document.createElement('img');
				var reader = new FileReader();
				reader.onload = (function(aImg) {
					return function(e) {

						
						aImg.src = e.target.result;
						var html = "";
						var div = $(".g-photo-wrap");
						html += "<div class='g-photo-one'><dl>";
						html += "<dt id='gimg'><img></dt>";
						html += "<dd><b class='g-b' style='font-size: 19px;'></b></dd>";
						html += "<dd><p class='g-p'></p></dd>";
						html += "</dl></div>";
						div.append(html);
						
						$(".g-photo-one").last().find("#gimg>img").attr("src", e.target.result);
					}
				})(image)

				if (get_file) {
					reader.readAsDataURL(get_file[0]);
				}

				preview.appendChild(image);	
				
			});


		});
		function gProjectArr() {
			var gprojectTitle = $("#gprojectTitle").val();
			console.log(gprojectTitle);
			var gprojectContent = $("#gprojectContent").val();
			console.log(gprojectContent);

			var gprojectFilepath = $("#gprojectFilepath");
			
			var form = new FormData();
			var files = $("#gprojectFilepath")[0].files[0];
			console.log(files);
			form.append("gprojectFilepath",files);
			form.append("gprojectContent",gprojectContent);
			form.append("gprojectTitle",gprojectTitle);
			 $.ajax({
					url : "/gProjectAjax.do"
					, type : "post"
					, data : form
					, processData : false
					, contentType : false
					, success : function(data) {
						console.log(data);
						console.log(data.gprojectFilepath);
						console.log(data.gprojectTitle);
						console.log(data.gprojectContent);
						$(".g-photo-one").last().append("<input type='hidden' name='gprojectFilepath' value='"+data.gprojectFilepath+"'>");
						$(".g-photo-one").last().append("<input type='hidden' name='gprojectTitle' value='"+data.gprojectTitle+"'>");
						$(".g-photo-one").last().append("<input type='hidden' name='gprojectContent' value='"+data.gprojectContent+"'>");
						
					}
			 });

				var gb = $(".g-photo-one").last().find(".g-b");
				console.log(gb);
				gb.append(gprojectTitle);

				var gp = $(".g-photo-one").last().find(".g-p");
				console.log(gp);
				gp.append(gprojectContent);
				$(".hrm-wrap").css("display", "none");
			
		}
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
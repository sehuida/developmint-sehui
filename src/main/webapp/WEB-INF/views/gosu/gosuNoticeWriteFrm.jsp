<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

.container .g-plus {
	display: flex;
	justify-content: right;
	color: rgb(78, 205, 196);
	text-align: right;
	font-weight: bold;
}

.container h4 {
	font-weight: bold;
	margin-top: 40px;
	margin-bottom: 40px;
	margin-bottom: 50px;
}

.g-center {
	display: flex;
	justify-content: center;
}

.g-content {
	display: flex;
	justify-content: center;
	margin-top: 100px;
	margin-bottom: 100px;
	
}

.g-content input, .g-content textarea {
	padding: 10px;
}

.g-content tr th, .g-content tr td {
	padding: 40px;
}

input:focus, textarea:focus {
	outline: none;
}

.g-content th {
 font-size: 25px;
}
.g-content>div{
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
			<a href=""><span>1</span>요청서</a>
		</div>
		<h4>
			&gt; &nbsp;<span style="color: rgb(78, 205, 196);">고수</span>의 게시판
			작성하기
		</h4>


		<div class="g-content g-center">
			<div>
				<table>
					<tr>
						<th>첨부파일 <span style="color: red;">* </span></th>
						<td><input type="file" name="" style="width: 100%;"></td>
					</tr>
					<tr>
						<th>제목 <span style="color: red;">* </span></th>
						<td><input type="text" name="" style="width: 100%;"></td>
					</tr>
					<tr>
						<th>내용 <span style="color: red;"> * </span></th>
						<td><textarea cols="100" rows="30" name=""
								placeholder="* 고수님만의 노하우를 작성해주세요!"></textarea></td>
					</tr>

				</table>
			</div>
		</div>
		<div class="g-center">
			<a class="btn btn-info"
				style="width: 200px; margin: 100px; padding: 10px;font-weight:bold;">취소</a> <a
				class="btn btn-primary"
				style="width: 200px; margin: 100px; padding: 10px;font-weight:bold;">확인</a>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico"/>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
<meta charset="UTF-8">
<title>Develomints</title>
<style>
	.bi{
		color: #4ecdc4;
		font-size: 2rem;
	}
	#page-head{
		font-size: 30px;
		font-family: NotoBold;
		margin-right: 25px;
	}
	.page-wrap{
		width: 900px;
		margin: 0 auto;
		margin-top:50px;
		margin-bottom: 100px;
   		border-radius: 10px;
   		box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
   		padding: 40px;
	}
	.categorys{
		display: flex;
		align-items: center;
	}
	.cateImg{
		width: 25px;
		height: 25px;
		margin-top: 13px;
		margin-left: 15px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="container">
			<span id="page-head">글작성하기</span><i class="bi bi-pen"></i>
			<div class="page-wrap">
			    <div class="form-group">
			      <div class="categorys">
				      <label for="boardType" class="form-label mt-4">상세 유형</label><img src="/resources/img/shareBoard/options-lines.png" class="cateImg">
			      </div>
			      <select class="form-select" id="boardType" name="boardType">
			        <option value="1">사는 얘기</option>
			        <option value="2">Tech Q&A</option>
			        <option value="3">Tips & 강좌</option>
			        <option value="4">IT NEWS & 정보</option>
			      </select>
			    </div>
				<div class="form-group">
				  <label class="col-form-label mt-4" for="boardTitle">글 제목</label>
				  <input type="text" class="form-control" id="boardTitle" name="boardTitle">
				</div>
				<div class="form-group">
			      <label for="boardContent" class="form-label mt-4">글 내용</label>
			      <textarea class="form-control" id="boardContent" name="boardContent" rows="3"></textarea>
			    </div>				
			</div>
		</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<!-- Jquery 먼저 불러고오고, summerNote가 돌아야함 -->
	<script src="/resources/summernote/summernote-lite.js"></script>
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
	<script>
	  $(function(){
		
		$("#boardContent").summernote({
			height: 500,
			minHeight: 500,
			maxHeight: 500,
			lang : "ko-KR"
		});
		  
	  });
	</script>	
</body>
</html>
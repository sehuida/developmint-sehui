<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <c:set var="today" value="<%=new java.util.Date()%>"/>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Develomint</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<link rel="stylesheet" href="/resources/css/notice/noticeList.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<script src="/resources/summernote/summernote-lite.js"></script>
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
	<link rel="stylesheet" href="/resources/css/projectTeam/bootstrap-datepicker.css">
	<link rel="stylesheet" href="/resources/css/projectTeam/writePage.css">

	<div class="container" style="margin-bottom: 50px;">
		<div class="area">
			<div class="nav-sub" style="margin-top: 30px;"><a href="/" class="text-hover">홈</a><span> > </span><a href="/noticehome.do" class="text-hover">고객센터</a><span> > </span><span>공지사항</span></div>
			<div class="title"><h2 style="color: #78c2ad;">CS Center</h2></div>
			<div class="center_tap">
				<ul>
					<li><span class="">Tel. 2163-8560</span><br><span class="last-span">평일 9:00~18:00(점심 12:00~13:00)</span></li>
					<li><a href="/tocounsel.do" class="text-hover">1:1 Q&A<br><span class="last-span">질문 전 FAQ(자주 묻는 질문)을 먼저 확인해 주세요.</span></a></li>
					<li><a href="/faq.do" class="text-hover">자주묻는질문<br><span class="last-span">자주묻는질문</span></a></li>
				</ul>
			</div>
			<c:if test="${sessionScope.m.memberType eq 9 }">
			<div class="contents" style="padding: 20px;">
				<div class="title" style="border-bottom: none;padding: 0;"><h2 style="display: inline-block;">Notice Write</h2> 작성날짜 <fmt:formatDate value="${today}" pattern="yyyy-MM-dd" /></div>
				<div class="notice-contents" style="padding: 0;border-bottom: none;">
					<form action="/insertNotice.do" method="post" enctype="multipart/form-data">
						<fieldset>
						<label class="col-form-label mt-4" for="noticeTitle"><i class="bi bi-toggles" style="font-size: 1.2em;"></i> 상단게시물 고정유무<span style="color: #f3969a;font-size: ">*</span></label>
					    <div class="form-check form-switch">
				        	<input class="form-check-input" type="checkbox" id="pin" checked="2">
				        	<label class="form-check-label" for="pin">상단게시물 고정</label>
				      	</div>
						<div class="form-group">
						  <label class="col-form-label mt-4" for="noticeWriter"><i class="bi bi-hand-index" style="font-size: 1.2em;"></i> 작성자<span style="color: #f3969a;">*</span></label>
						  <input type="text" class="form-control" id="noticeWriter" value="${sessionScope.m.memberId }" readonly>
						</div>
						<div class="form-group">
						  <label class="col-form-label mt-4" for="noticeTitle"><i class="bi bi-pencil" style="font-size: 1.2em;"></i> 공지 제목<span style="color: #f3969a;">*</span></label>
						  <input type="text" class="form-control" placeholder="제목을 입력하세요" id="noticeTitle" required>
						</div>
						<div class="form-group">
					      <label for="formFile" class="form-label mt-4"><i class="bi bi-files" style="font-size: 1.2em;"></i> 첨부파일<span style="font-size: small;color: #999;"> *첨부파일은 한개만 가능합니다</span></label>
					      <input class="form-control" type="file" id="formFile">
					    </div>
						<div class="form-group">
							<label class="col-form-label mt-4" for="noticeContent"><i class="bi bi-pencil-square" style="font-size: 1.2em;"></i> 공지 내용<span style="color: #f3969a;">*</span></label>
                            <textarea class="form-control" id="noticeContent" rows="20" name="noticeContent" required ></textarea>
                            <span style="color: #f3969a;float: left;">*는 필수 입력사항입니다.</span>
                        </div>
                        <div class="form-group" style="padding: 10px 0 0 0;float: right;">
                        	<button type="submit" class="btn btn-primary" id="nWriteBtn">Submit</button>
                        </div>
                         </fieldset>
					</form>
				</div>
			</div>
			</c:if>
		</div>
	</div>
	<script>
	$(function(){
		$("#noticeContent").summernote({
			height : 800,
			lang : "ko-KR",
			placeholder: '최대 2048자까지 쓸 수 있습니다',
			callbacks :{
				onImageUpload : function(files){
					uploadImage(files[0],this);	
				}
			}
		});
	});
	function uploadImage(file,editor){
		data = new FormData();
		data.append("file",file);
		$.ajax({
			url : "/uploadImage.do",
			type :"post",		//file전송을 위해 ajax를 할떄는 type을 post로 해줘야한다
			data : data,
			enctype : 'multipart/form-data',
			processData : false,
			contentType : false,
			success : function(data){
				console.log(data);
				
				$(editor).summernote("insertImage",data);
			}
		});
	}
	$("#nWriteBtn").click(function(){
		 if($("#noticeTitle").val()!=null&&$("#noticeContent").val()!=null){
			 swal({
				   title: "가입성공!",
				   text: "공지사항이 등록되었습니다.",
				   icon: "success", //"info,success,warning,error" 중 택1
				   button: "둘러보기",
				})
			 .then((value) => {
			 	$("form").submit();			 
			 });
		 }else{
			 swal({
				   title: "가입실패",
				   text: "입력값을  다시 확인해주세요.",
				   icon: "warning", //"info,success,warning,error" 중 택1
				   button: "돌아가기",
				})
			 return false;
		 }
	  });
</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
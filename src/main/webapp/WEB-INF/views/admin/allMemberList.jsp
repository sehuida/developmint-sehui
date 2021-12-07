<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeveloMint 전체 회원 조회</title>
</head>
<style>
.mainCate{
	display:flex;
}
#allMember{
	font-size: 25px;
	line-height: 46px;
}
.bi{
	font-size:30px;
}

.listTag{
	color : black;
	text-decoration: none;
	margin-right: 10px;
}

.totalBox{
	border : 1px solid #d9d9d9;
	display: flex;
	justify-content: space-evenly;
	margin-bottom: 80px;
	text-align: center;
}

.totalBox>div>p{
	font-size: 20px;
	font-weight: bold;
	margin-top:15px;
	
}
.totalBox>div>span:first-of-type {
	font-size: 20px;
	margin-top: 15px;
	margin-bottom: 15px;
	display: inline-block;
	font-weight: bold;
}
.table{
	margin-top : 30px;
	text-align: center;
}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container" style="margin-top:50px;margin-bottom:100px;">
		<div class="mainCate">
		<a href="/adminPage.do" class="cateAtag"><i class="bi bi-chevron-left"></i></a> 
		<span id="allMember" style="font-weight:bold">전체 회원 조회</span>
		</div>
		<br><br><br>
	
	<%--회원 total Box --%>
	<div class="totalBox">
		<div>
			<p>총 회원</p>
			<span>${totalCount[0] }</span><span> 명</span>
		</div>
		<div>
			<p>일반 회원</p>
			<span>${totalCount[1] }</span><span> 명</span>
		</div>
		<div>
			<p>고수 회원</p>
			<span>${totalCount[2] }</span><span> 명</span>
		</div>
		<div>
			<p>기업 회원</p>
			<span>${totalCount[3] }</span><span> 명</span>
		</div>
	</div>
	
	<%--조회 카테고리 --%>
	<a href="/allMemberList.do?reqPage=1&type=0&list=member_no" id="newList" class="listTag">최신순</a>
	<a href="/allMemberList.do?reqPage=1&type=0&list=member_grade" id="gradeList" class="listTag">등급순</a>
	<a href="/allMemberList.do?reqPage=1&type=1&list=member_no" id="memberList" class="listTag">일반회원</a>
	<a href="/allMemberList.do?reqPage=1&type=2&list=member_no" id="gosuList" class="listTag">고수회원</a>
	<a href="/allMemberList.do?reqPage=1&type=3&list=member_no" id="companyList" class="listTag">기업회원</a>
	
	<%--조회 리스트 테이블 --%>
	<%--최신순(전체회원조회) --%>
	<table class="table newListTbl ">
		<tr>
			<th><input type="checkbox" id="checkAll" class="form-check-input"></th>
			<th>아이디</th>
			<th>이름</th>
			<th>등급</th>
			<th>포인트</th>
			<th>신고당한 횟수</th>
			<th>가입일</th>
			<th>등급 변경</th>
			<th>회원 차단</th>
		</tr>
		<c:forEach items="${memberList }" var="ml" varStatus="i">
			<tr class="tblTr">
				<td><input type="checkbox" class="form-check-input chk"></td>
				<td>${ml.memberId }</td>
				<td>${ml.memberName}</td>
				<c:choose>
					<c:when test="${ml.memberGrade > 0 && ml.memberGrade < 21 }">
						<td><img src="/resources/img/member/rank/bronze.png" width="35px" height="35px;">브론즈</td>
					</c:when>
					<c:when test="${ml.memberGrade >= 21 && ml.memberGrade <= 40 }">
						<td><img src="/resources/img/member/rank/silver.png" width="35px" height="35px;">실버</td>
					</c:when>
					<c:when test="${ml.memberGrade >= 41 && ml.memberGrade <= 60 }">
						<td><img src="/resources/img/member/rank/gold.png" width="35px" height="35px;">골드</td>
					</c:when>
					<c:when test="${ml.memberGrade >= 61 && ml.memberGrade <= 80 }">
						<td><img src="/resources/img/member/rank/platinum.png" width="35px" height="35px;">플레티넘</td>
					</c:when>
					<c:when test="${ml.memberGrade >= 81 && ml.memberGrade <= 110 }">
						<td><img src="/resources/img/member/rank/diamond.png" width="35px" height="35px;">다이아</td>
					</c:when>
					<c:when test="${ml.memberGrade >= 111 && ml.memberGrade <= 140 }">
						<td><img src="/resources/img/member/rank/master.png" width="35px" height="35px;">마스터</td>
					</c:when>
					<c:when test="${ml.memberGrade >= 141 && ml.memberGrade <= 170 }">
						<td><img src="/resources/img/member/rank/challenger.png" width="35px" height="35px;">챌린저</td>
					</c:when>
				</c:choose>
				<td>${ml.memberGrade }</td>
				<td>3</td>
				<td>${ml.enrollDate }</td>
				<td>
					<select class="selLevle form-control"> 
						<option>브론즈</option>
						<option>실버</option>
						<option>골드</option>
						<option>플레티넘</option>
						<option>다이아</option>
						<option>마스터</option>
						<option>챌린저</option>
					</select>
				</td>
				<td><button class="btn btn-outline-primary btn-sm" style="color:#4ECDC4; border-color: #4ECDC4">차단하기</button></td>
			</tr>
		</c:forEach>
	</table>
		<button class="btn btn-primary changeBtn" style="float: right; margin-right:20px;">등급변경</button>
		<div id="pageNavi" style="text-align: center; margin-top:50px;"  >${pageNavi }</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	 <script>
	 //체크박스 전체 선택
	 $("#checkAll").click(function(){
		if($("#checkAll").prop("checked")){
	           $(".chk").prop("checked",true);
	    }else{
	           $(".chk").prop("checked",false);
	    }
	});
	 
	 $(".changeBtn").click(function(){
		var inputs = $(".chk:checked");
		var memberId = new Array(); //회원번호 저장할 배열
		var level = new Array(); //변경할 등급을 저장할 배열
		
		inputs.each(function(idx,item){
			var memberNo = $(item).parent().next().html();
			console.log(memberNo);
			memberId.push(memberNo);
			var memberLevel = $(item).parent().parent().find("select").val();
			console.log(memberLevel);
			level.push(memberLevel);
		});
		var checkBoxCheck = $('.chk').is(":checked");
		if(!checkBoxCheck){
			alert("등급을 변경할 회원을 선택해주세요.");
			return;
		}
		var checkConfirm = confirm("선택한 회원의 등급을 변경하시겠습니까?");
		if(checkConfirm){
			location.href="/chkChangeLevel.do?memberId="+memberId.join("/")+"&level="+level.join("/");	
		}
	 });
	 	
	 	
	 	
	 	
	 </script>
</body>
</html>
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
		<a href="#" class="cateAtag" onclick="history.go(-1)"><i class="bi bi-chevron-left"></i></a> 
		<span id="allMember" style="font-weight:bold">전체 회원 조회</span>
		</div>
		<br><br><br>
	
	<%--회원 total Box --%>
	<div class="totalBox">
		<div>
			<p>총 회원</p>
			<span>100</span><span> 명</span>
		</div>
		<div>
			<p>일반 회원</p>
			<span>100</span><span> 명</span>
		</div>
		<div>
			<p>고수 회원</p>
			<span>100</span><span> 명</span>
		</div>
		<div>
			<p>기업 회원</p>
			<span>100</span><span> 명</span>
		</div>
	</div>
	
	<%--조회 카테고리 --%>
	<a href="javascript:void(0)" id="newList" class="listTag">최신순</a>
	<a href="javascript:void(0)" id="gradeList" class="listTag">등급순</a>
	<a href="javascript:void(0)" id="memberList" class="listTag">일반회원</a>
	<a href="javascript:void(0)" id="gosuList" class="listTag">고수회원</a>
	<a href="javascript:void(0)" id="companyList" class="listTag">기업회원</a>
	
	<%--조회 리스트 테이블 --%>
	<%--최신순(전체회원조회) --%>
	<table class="table newListTbl ">
		<tr>
			<th>No.</th>
			<th>아이디</th>
			<th>총 게시글</th>
			<th>등급</th>
			<th>포인트</th>
			<th>신고당한 횟수</th>
			<th>가입일</th>
			<th>등급 변경</th>
		</tr>
		<c:forEach varStatus="i" begin="0" end="9">
			<tr class="tblTr ">
				<td>${i.count }</td>
				<td>user${i.count }</td>
				<td>${i.count }</td>
				<td>Bronze</td>
				<td>10</td>
				<td>3</td>
				<td>2021-11-29</td>
				<td>
					<select> 
						<option>브론즈</option>
						<option>실버</option>
						<option>골드</option>
						<option>플레티넘</option>
						<option>다이아</option>
						<option>챌린저</option>
						<option>마스터</option>
					</select>
				</td>
			</tr>
		</c:forEach>
	</table>

	<%--등급순(전체회원조회) --%>
	<table class="table gradeListTbl" style="display:none">
		<tr>
			<th>No.</th>
			<th>아이디</th>
			<th>총 게시글</th>
			<th>등급</th>
			<th>포인트</th>
			<th>신고당한 횟수</th>
			<th>가입일</th>
			<th>등급 변경</th>
			
		</tr>
		<c:forEach varStatus="i" begin="0" end="9">
			<tr class="tblTr">
				<td>${i.count }</td>
				<td>user${i.count }</td>
				<td>${i.count }</td>
				<td>Master</td>
				<td>120</td>
				<td>3</td>
				<td>2021-11-29</td>
				<td>
					<select>
						<option>브론즈</option>
						<option>실버</option>
						<option>골드</option>
						<option>플레티넘</option>
						<option>다이아</option>
						<option>챌린저</option>
						<option>마스터</option>
					</select>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<%--일반회원(게시물 수) --%>
	<table class="table memberistTbl" style="display:none">
		<tr>
			<th>No.</th>
			<th>아이디</th>
			<th>총 게시글</th>
			<th>등급</th>
			<th>포인트</th>
			<th>신고당한 횟수</th>
			<th>가입일</th>
			<th>등급 변경</th>
		</tr>
		<c:forEach varStatus="i" begin="0" end="9">
			<tr class="tblTr">
				<td>${i.count }</td>
				<td>user${i.count }</td>
				<td>${i.count }</td>
				<td>Platinum</td>
				<td>65</td>
				<td>3</td>
				<td>2021-11-29</td>
				<td>
					<select>
						<option>브론즈</option>
						<option>실버</option>
						<option>골드</option>
						<option>플레티넘</option>
						<option>다이아</option>
						<option>챌린저</option>
						<option>마스터</option>
					</select>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<%--고수회원 --%>
	<table class="table gosuListTbl" style="display:none">
		<tr>
			<th>No.</th>
			<th>아이디</th>
			<th>노하우 게시글</th>
			<th>피드백 진행</th>
			<th>피드백 완료</th>
			<th>완료율</th>
			<th>가입일</th>
			<th>등급 변경</th>
		</tr>
		<c:forEach varStatus="i" begin="0" end="9">
			<tr class="tblTr">
				<td>${i.count }</td>
				<td>user${i.count }</td>
				<td>${i.count }</td>
				<td>10</td>
				<td>5</td>
				<td>50%</td>
				<td>2021-11-29</td>
				<td>
					<select>
						<option>브론즈</option>
						<option>실버</option>
						<option>골드</option>
						<option>플레티넘</option>
						<option>다이아</option>
						<option>챌린저</option>
						<option>마스터</option>
					</select>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<%--기업회원 --%>
	<table class="table companyListTbl" style="display:none">
		<tr>
			<th>No.</th>
			<th>아이디</th>
			<th>기업명</th>
			<th>대표자 명</th>
			<th>업종</th>
			<th>구인게시물 수</th>
			<th>가입일</th>
			<th>등급 변경</th>
		</tr>
		<c:forEach varStatus="i" begin="0" end="9">
			<tr class="tblTr">
				<td>${i.count }</td>
				<td>user${i.count }</td>
				<td>develomint</td>
				<td>김진호</td>
				<td>개발</td>
				<td>5</td>
				<td>2021-11-29</td>
				<td>
					<select>
						<option>브론즈</option>
						<option>실버</option>
						<option>골드</option>
						<option>플레티넘</option>
						<option>다이아</option>
						<option>챌린저</option>
						<option>마스터</option>
					</select>
				</td>
			</tr>
		</c:forEach>
	</table>
		<button class="btn btn-primary" style="float: right; margin-right:20px;">등급변경</button>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	 <script>
	 
	 	<%--최신순 클릭시--%>
	 	$("#newList").click(function(){
	 		<%--초기화--%>
	 		$(".table").css("display","none");
	 		$(".listTag").css("color","black")
	 		<%--테이블 띄우고 카테고리 색 바뀌기--%>
	 		$(".newListTbl").css("display","inline-table");
	 		$("#newList").css("color","#4ECDC4")
	 	});
	 	$("#newList").trigger("click");
	 	
	 	<%--등급순 클릭시--%>
	 	$("#gradeList").click(function(){
	 		<%--초기화--%>
	 		$(".table").css("display","none");
	 		$(".listTag").css("color","black");
	 		<%--테이블 띄우고 카테고리 색 바뀌기--%>
	 		$(".gradeListTbl").css("display","inline-table");
	 		$("#gradeList").css("color","#4ECDC4");
	 	});
	 	
	 	<%--일반회원 클릭시--%>
	 	$("#memberList").click(function(){
	 		<%--초기화--%>
	 		$(".table").css("display","none");
	 		$(".listTag").css("color","black");
	 		<%--테이블 띄우고 카테고리 색 바뀌기--%>
	 		$(".memberistTbl").css("display","inline-table");
	 		$("#memberList").css("color","#4ECDC4");
	 	});
	 	
	 	<%--고수회원 클릭시--%>
	 	$("#gosuList").click(function(){
	 		<%--초기화--%>
	 		$(".table").css("display","none");
	 		$(".listTag").css("color","black");
	 		<%--테이블 띄우고 카테고리 색 바뀌기--%>
	 		$(".gosuListTbl").css("display","inline-table");
	 		$("#gosuList").css("color","#4ECDC4");
	 	});
	 	
	 	<%--기업회원 클릭시--%>
	 	$("#companyList").click(function(){
	 		<%--초기화--%>
	 		$(".table").css("display","none");
	 		$(".listTag").css("color","black");
	 		<%--테이블 띄우고 카테고리 색 바뀌기--%>
	 		$(".companyListTbl").css("display","inline-table");
	 		$("#companyList").css("color","#4ECDC4");
	 	});
	 	
	 	
	 	
	 	
	 	
	 </script>
</body>
</html>
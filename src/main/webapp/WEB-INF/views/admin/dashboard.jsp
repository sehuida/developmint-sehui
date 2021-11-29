<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeveloMint DashBoard</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
</head>
<style>
.mainCate{
	display:flex;
}
#dashboard{
	font-size: 25px;
	line-height: 46px;
}
.bi{
	font-size:30px;
}
.todayInfo{
	display: flex;
	justify-content: space-around;
}
.todayInfo>div{
	border : 2px solid #d9d9d9;
	width: 250px;
	text-align: center;
	border-radius: 5px;
	
}
.boxLine{
	border : 1px solid #d9d9d9;
	width: 200px;
	margin: 0 auto;
}
.todayInfo>div>p{
	font-size: 20px;
	font-weight: bold;
	margin-top:15px;
}
.todayInfo>div>span:first-of-type {
	font-size: 20px;
	margin-top: 15px;
	margin-bottom: 15px;
	display: inline-block;
	font-weight: bold;
}
.title{
	font-weight: bold;
	margin-bottom : 30px;
}
.cate2Box{
	display: flex;
	border-bottom: 1px solid #e9e9e9;
	padding-bottom: 70px;
}
#chartBox{
	border: 1px solid #d9d9d9;
	height: 450px;
	width: 860px;
	border-radius : 5px;
}
#myChart{
	width: 300px;
}
#cateChartBox{
	margin-left:70px;
	width: 350px;
	border: 1px solid #d9d9d9;
	height: 450px;
	border-radius : 5px;
}
.btns{
	display: flex;
	justify-content: space-evenly;
	margin-top: 15px;
	margin-bottom: 15px;
}
.cate3Box>div{
	display: flex;
	justify-content: space-evenly;
}
.BoardList{
	width: 400px;
	border : 1px solid #d9d9d9;
	border-radius : 5px;
	padding: 25px;

}
.BoardList>div{
	display: flex;
	
	
}
.moreTag{
	margin-left: auto;
	color : black;
	text-decoration: none;
}
.newBoard{
	color : #565656;
	text-decoration: none;
}
.newBoardDate{
	color : #565656;
	float:right;
}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container" style="margin-top:100px;margin-bottom:100px;">
	
		<div class="mainCate">
		<a href="#" class="cateAtag" onclick="history.go(-1)"><i class="bi bi-chevron-left"></i></a> 
		<span id="dashboard" style="font-weight:bold">대시보드</span>
		</div>
		<br><br><br>
		
		<%-- TODAY 사이트 현황 --%>
		<p class="title">TODAY ${today }</p>
		<div class="todayInfo">
			<div>
				<p>총 회원</p>
				<div class="boxLine"></div>
				<span>100</span><span> 명</span>
			</div>
			<div>
				<p>가입 회원</p>
				<div class="boxLine"></div>
				<span>100</span><span> 명</span>
			</div>
			<div>
				<p>탈퇴 회원</p>
				<div class="boxLine"></div>
				<span>100</span><span> 명</span>
			</div>
			<div>
				<p>총 게시물</p>
				<div class="boxLine"></div>
				<span>100</span><span> 명</span>
			</div>
		</div>
		
		<%--회원 가입/탈퇴현황 + 사이트 통계 --%>
		<div class="cate2Box">
			<div class="joinDelete">
				<p class="title" style="margin-top:100px;">회원 가입/탈회 현황</p>
				<div id="chartBox" >
					<canvas id="myChart1" ></canvas>
				</div>
			</div>
			<div id="cateChart">
				<p class="title" style="margin-top:100px; margin-left:70px;">사이트 통계</p>
				<div id="cateChartBox" >
					<div class="btns">
					<button class="btn btn-outline-primary btn1">성별</button><button class="btn btn-outline-primary btn2">등급별</button><button class="btn btn-outline-primary btn3">카테고리별</button>
					</div>
					<canvas id="myChart2" ></canvas>
				</div>
			</div>
		</div>
		
		<%--게시판 별 최신글 --%>	
		<div class="cate3Box">	
			<div>
				<div class="BoardList" style="margin-top:50px;">
					<div>
					<p class="title">공지사항</p><a href="#" class="moreTag"><p class="title">더보기<i class="bi bi-chevron-right" style="font-size:15px;"></i></p></a>
					</div>
					<c:forEach var="i" begin="0" end="5">
					<a href="#" class="newBoard"><span>최신 공지사항 입니다.</span></a><span class="newBoardDate">2021-11-29</span><br>
					</c:forEach>
				</div>
				
				<div class="BoardList" style="margin-top:50px;">
					<div>
					<p class="title">QnA</p><a href="#" class="moreTag"><p class="title">더보기<i class="bi bi-chevron-right" style="font-size:15px;"></i></p></a>
					</div>
					<c:forEach var="i" begin="0" end="5">
					<a href="#" class="newBoard"><span>최신 QnA 입니다.</span></a><span class="newBoardDate">2021-11-29</span><br>
					</c:forEach>
				</div>
				
				<div class="BoardList" style="margin-top:50px;">
					<div>
					<p class="title">QnA</p><a href="#" class="moreTag"><p class="title">더보기<i class="bi bi-chevron-right" style="font-size:15px;"></i></p></a>
					</div>
					<c:forEach var="i" begin="0" end="5">
					<a href="#" class="newBoard"><span>최신 QnA 입니다.</span></a><span class="newBoardDate">2021-11-29</span><br>
					</c:forEach>
				</div>
			</div>
		</div>
		
		
		
		
	</div>
	<%--  
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	 --%>
	 <script>
	 <%-- 가입/탈퇴 차트(line타입)--%>
	 new Chart(document.getElementById("myChart1"), {
		  type: 'line',
		  data: {
		    labels: ['2021-11-23','2021-11-24','2021-11-25','2021-11-26','2021-11-27','2021-11-28'],
		    datasets: [{ 
		        data: [10,20,5,4,17,50],
		        label: "가입",
		        borderColor: "#4ECDC4",
		        fill: false
		      }, { 
		        data: [3,0,5,10,4,6],
		        label: "탈퇴",
		        borderColor: "#90D1B4",
		        fill: false
		      }
		    ]
		  },
		  options: {
		    title: {
		      display: true,
		      text: 'DeveloMint 회원 가입 / 탈퇴 현황'
		    }
		  }
		});
	 
	 <%-- 성별버튼 클릭시 나오는 파이차트--%>
	 $(".btn1").click(function(){
		 $(".myChart2").val("");
		 new Chart(document.getElementById("myChart2"), {
			    type: 'pie',
			    data: {
			      labels: ["남성","여성"],
			      datasets: [{
			        label: "Population (millions)",
			        backgroundColor: ["#4ECDC4", "#90D1B4"],
			        data: [60,40]
			      }]
			    },
			    options: {
			      title: {
			        display: true,
			        text: 'DeveloMint 회원 성별 통계'
			      }
			    }
			});
	 });
	 $(".btn1").trigger("click");
	 
	 <%-- 등급별버튼 클릭시 나오는 파이차트--%>
	 $(".btn2").click(function(){
		 $(".myChart2").val("");
		 new Chart(document.getElementById("myChart2"), {
			    type: 'pie',
			    data: {
			      labels: ["Bronze","Silver","Gold","Platinum","Diamond","Master","Challenger"],
			      datasets: [{
			        label: "Population (millions)",
			        backgroundColor: ["#4ECDC4","#90D1B4","#9cd19f","#B7CD99","#E4ECB7","#EDF6B9","#EDEBE9"],
			        data: [30,30,15,7,7,6,5]
			      }]
			    },
			    options: {
			      title: {
			        display: true,
			        text: 'DeveloMint 회원 등급 통계'
			      }
			    }
			});
	 });
	 
	 <%-- 카테고리별버튼 클릭시 나오는 파이차트--%>
	 $(".btn3").click(function(){
		 $(".myChart2").val("");
		 new Chart(document.getElementById("myChart2"), {
			    type: 'pie',
			    data: {
			      labels: ["프로젝트 팀원모집","개발지식 공유","구인구직","고수의 노하우","공모전"],
			      datasets: [{
			        label: "Population (millions)",
			        backgroundColor: ["#4ECDC4", "#90D1B4","#9cd19f","#E4ECB7","#EDF6B9"],
			        data: [20,30,15,15,10]
			      }]
			    },
			    options: {
			      title: {
			        display: true,
			        text: 'DeveloMint 카테고리별 게시물 통계'
			      }
			    }
			});
	 });
	
	 </script>
</body>
</html>
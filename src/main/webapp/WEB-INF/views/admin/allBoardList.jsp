<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 게시판 조회</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
</head>
<style>
.container {
   min-width: 1200px; 
}
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
.cateBox{
	display:flex;
	justify-content: space-around;
	border: 1px solid #d9d9d9;
	padding: 25px;
}
.chartBox{
	width: 320px;
	height: 320px;
	box-shadow: 1px 2px 10px 0 rgb(0 0 0 / 15%);
	padding:20px;
}
.cate_1{
	padding: 5px;
	
}
.listTag{
	color : black;
	text-decoration: none;
	font-size: 20px;
	margin-left: 5px;
	
}
.chartTableBox{
	margin-top: 50px;
	display: flex;	
	justify-content: space-around;
}
.title{
	font-weight: bold;
	margin-bottom : 30px;
	background-color: #f8f9fc;
	height: 40px;
	padding-left: 10px;
	line-height: 40px;
	color:#1A1B3D;
}
.boardTable{
	box-shadow: 1px 2px 10px 0 rgb(0 0 0 / 15%);
	width: 900px;
	height: 600px;
}
.box1{
	box-shadow: 1px 2px 10px 0 rgb(0 0 0 / 15%);
	width: 320px;
	height: 160px;
}
	
</style>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container" style="margin-top:50px;margin-bottom:100px;">
	
		<div class="mainCate">
			<a href="/adminPage.do" class="cateAtag"><i class="bi bi-chevron-left"></i></a> 
			<span id="dashboard" style="font-weight:bold">전체 게시판 조회</span>
		</div>
		<br><br><br>
		
		<%--조회 카테고리 --%>
		<div class="cateBox">
			<div class="cate_1">
				<i class="bi bi-people-fill" style="color : #4ECDC4; font-size:20px;"></i>
				<a href="/allBoardList.do?reqPage=1&type=1" class="listTag"> 팀원모집</a>
			</div>
			<div class="cate_1">
				<i class="bi bi-chat-square-text" style="color : #4ECDC4; font-size:20px;"></i>
				<a href="/allBoardList.do?reqPage=1&type=2" class="listTag">개발지식공유</a>
			</div>
			<div class="cate_1">
				<i class="bi bi-briefcase" style="color : #4ECDC4; font-size:20px;"></i>
				<a href="/allBoardList.do?reqPage=1&type=3" class="listTag">구인구직</a>
			</div>
			<div class="cate_1">
				<i class="bi bi-lightbulb" style="color : #4ECDC4; font-size:20px;"></i>
				<a href="/allBoardList.do?reqPage=1&type=4" class="listTag">고수의 노하우</a>
			</div>
			<div class="cate_1">
				<i class="bi bi-trophy" style="color : #4ECDC4; font-size:20px;"></i>
				<a href="/allBoardList.do?reqPage=1&type=5" class="listTag">공모전</a>
			</div>
		</div>
		
		<div class="chartTableBox">
			<div class="flexBox">
				<p class="title" style="margin-top:20px; width: 320px;">게시물 비율</p>	
				<div class="chartBox">
					<canvas id="bar-chart-grouped" width="100%" height="100%"></canvas>
				</div>
				
				<p class="title" style="margin-top:50px; width: 320px;">뭘 넣을까</p>	
				<div class="box1">
					
				</div>
			</div>
			<div class="flexBox">
				<p class="title" style="margin-top:20px; width: 900px;">최신 게시물</p>	
				<div class="boardTable">
					
				</div>
			</div>
		</div>
		
		
		
		
		
	</div>
<%@include file="/WEB-INF/views/common/footer.jsp" %>
<script>
	$(function(){
		var type = '${type}';
		var boardType = $(".listTag").eq(type-1).html()
		
		//차트
		new Chart(document.getElementById("bar-chart-grouped"), {
		    type: 'bar',
		    data: {
		      labels: ["게시물 수"],
		      datasets: [
		        {
		          label: boardType,
		          backgroundColor: "#f3969a",
		          data: [15]
		        }, {
		          label: "전체게시물",
		          backgroundColor: "#4ECDC4",
		          data: [60]
		        }
		      ]
		    },
		    options: {
		      title: {
		        display: true,
		        text: boardType+' 게시판 게시물 수'
		      }
		    }
		});
		
		
		//카테고리 색
		if(type == 1){
			$(".listTag").eq(0).css("color","#4ECDC4");
			$(".cate_1").eq(0).css("border-bottom","3px solid #4ECDC4");
		}else if(type == 2){
		 	$(".listTag").eq(1).css("color","#4ECDC4");
		 	$(".cate_1").eq(1).css("border-bottom","3px solid #4ECDC4");
		}else if(type == 3){
			$(".listTag").eq(2).css("color","#4ECDC4");
			$(".cate_1").eq(2).css("border-bottom","3px solid #4ECDC4");
		}else if(type == 4){
			$(".listTag").eq(3).css("color","#4ECDC4");
			$(".cate_1").eq(3).css("border-bottom","3px solid #4ECDC4");
		}else if(type == 5){
			$(".listTag").eq(4).css("color","#4ECDC4");
			$(".cate_1").eq(4).css("border-bottom","3px solid #4ECDC4");
		}
	})
</script>
</body>
</html>
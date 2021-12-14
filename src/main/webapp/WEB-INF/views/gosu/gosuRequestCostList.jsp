<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
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
	font-size: 30px;
	font-weight: 900;
}

.requestList {
	display: flex;
	justify-content: center;
	margin-top: 100px;
	margin-bottom: 50px;
}

.requestList * {
	padding: 20px;
}

.requestList>table {
	width: 100%;
}

.requestList>table>tbody>tr>td {
	padding: 0;
	display: flex;
	justify-content: center;
}

.g-one-tbl img {
	border-radius: 50%;
	width: 150px;
}

.g-one-tbl {
	width: 90%;
	border: 1px solid rgb(211, 211, 211);
	margin-bottom: 50px;
}

.g-one-tbl:hover {
	border: 1px solid black;
}

.g-one-tbl th {
	width: 200px;
}

.g-one-tbl td {
	padding-right: 50px;
	text-align: center;
}

#pageNavi {
	display: flex;
	justify-content: center;
}

.g-style {
	text-align: center;
	margin: 10px;
	display: flex;
	justify-content: center;
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

#hrm-modal {
	background-color: white;
	width: 800px;
	padding: 30px;
}

.hrm-btn-wrap {
	width: 100%;
	display: flex;
	justify-content: center;
}

.hrm-btn-wrap a {
	margin: 30px;
	margin-top: 50px;
	padding: 10px;
	width: 100px;
}

.hrm-content span {
	font-size: 30px;
	font-weight: 900;
}

.hrm-content input {
	border: none;
	background: transparent;
	text-align: center;
	margin-top:20px;margin-bottom:20px;
}

.hrm-content td, .hrm-content th {
	font-size: 30px;
	font-weight: 900;
	width: 400px;
}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<h3>
			<span style="color: rgb(78, 205, 196);">고수에게 </span> &nbsp;받은 견적서
		</h3>

		<div class="requestList">
			<c:choose>
				<c:when test="${empty memberRequestCostList }">
					<span
						style="font-size: 30px; font-weight: 900; color: gray; margin-top: 100px; margin-bottom: 100px;">아직
						도착한 견적서가 없어요!</span>

				</c:when>
				<c:otherwise>
					<table>



							<c:forEach items="${memberRequestCostList }" var="mrcl"
								varStatus="i">
								<tr>
									<td>
										<table class="g-one-tbl">
											<tr>
												<th rowspan="3"><c:if test="${empty mrcl.gosuImg }">
														<img src="/resources/img/gosu/g_img_basic.png">
													</c:if> <c:if test="${not empty mrcl.gosuImg }">
														<img src="/resources/upload/member/${mrcl.gosuImg}">
													</c:if></th>
												<th><span style="color: rgb(78, 205, 196);padding:0; padding-right: 10px;">고수</span>${mrcl.gosuId }</th>
												<td style="text-align: right;">${mrcl.costDate }</td>
											</tr>
											<tr>
												<td colspan="2"style="max-width: 1000px;" ><span style="width:100%; background-color:  rgba(239, 239, 239, 0.3);">${mrcl.costContentBr }</span></td>

											</tr>
											<tr>
												<th>비용 <span  style="color:red;padding: 0;">${mrcl.cost}</span>원</th>
												<td style="display: flex; justify-content: right;">
													<button type="button"
														onclick="gosuProjectJSPAjax(${mrcl.costNo});"
														class="btn btn-primary" style="width: 150px;">진행하기</button>
												</td>
											</tr>
										</table>
									</td>
								</tr>
						</c:forEach>
					</table>

				</c:otherwise>
			</c:choose>
		</div>
		<div class="hrm-wrap" style="display: none; margin: 0;">
			<div id="hrm-modal">
				<div class="hrm-content">
					<br>&nbsp;&nbsp;&nbsp;&nbsp; <span>결제하시겠습니까?</span> <br>
					<br> <br>
					<div class="g-style">
						<table>
							<tr>
								<th><span style="color: rgb(78, 205, 196);">고수</span></th>
								<td><input type="text" id="gosuIdSend" disabled></td>
							</tr>
							<tr>
								<th>날짜</th>
								<td><input type="text" id="costDateSend" disabled>
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea id="contentSend" disabled style="text-align:center;  font-size: 15px; padding:10px; width: 100%; margin-top:20px;margin-bottom:20px;border: none;"></textarea></td>
							</tr>
							<tr>
								<th>견적비용</th>
								<td><input type="text" id="costSend" disabled></td>
								<input type="hidden" id="requestNo">
								<input type="hidden" id="costNo">
								<input type="hidden" id="ggmemberId">
								<input type="hidden" id="ggcostContent">


							</tr>
						</table>
					</div>

				</div>
				<div class="hrm-btn-wrap">

					<a id="projectCostAjax" class="btn btn-success">결제 진행</a> <a
						id="hrm-close" class="btn btn-outline-success">취소</a>
				</div>
			</div>
		</div>


		<div id="pageNavi"></div>
	</div>
	<script>
		$("#hrm-close").click(function() {
			$(".hrm-wrap").css("display", "none");
		});
		function gosuProjectJSPAjax(costNo){
			$(".hrm-wrap").css("display", "flex");
			$.ajax({
				url : "/selectGosuRequestCost.do",
				data : {
					"costNo" : costNo
				},
				success : function(data) {
					console.log(data);
					$("#costSend").val(data.cost);
					$("#contentSend").val(data.costContentBr);
					$("#gosuIdSend").val(data.gosuId);
					$("#costDateSend").val(data.costDate);

					$("#costNo").val(data.costNo);
					$("#requestNo").val(data.requestNo);
					$("#ggmemberId").val(data.memberId);
					$("#ggcostContent").val(data.costContent);
				}
			});
			
			
		};

		$("#projectCostAjax").click(function(){
			
			var gfTitle = $("#ggcostContent").val();
			var mId = $("#ggmemberId").val();
			 var cost = $("#costSend").val();
			var IMP = window.IMP;
			  IMP.init('imp37172515');
			  console.log(cost);
			IMP.request_pay({
			    pg : 'kakao', 
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : gfTitle,
			    amount : cost, //판매 가격
			    buyer_name : mId
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
						var costNo = $("#costNo").val();
						var requestNo = $("#requestNo").val();
			   		 $.ajax({
						url : "/gosuRequestProjectSubAjax.do"
						, type : "post"
						, data : {

							"requestNo" : requestNo,
							"costNo" : costNo,
							}
						, success : function(data) {
							console.log(data);
							location.href="/gosuProject.do?rpsNo="+data;
						}
				 });
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			    
			
		})
		});
		
		
	</script>

	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
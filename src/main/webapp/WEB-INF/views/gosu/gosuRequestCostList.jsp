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
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<h3>
			<span style="color: rgb(78, 205, 196);">고수에게 </span> &nbsp;받은 견적서
		</h3>
		<div class="requestList">
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
									<th><span style="color: rgb(78, 205, 196);">고수</span>${mrcl.gosuId }</th>
									<td style="text-align: right;">${mrcl.costDate }</td>
								</tr>
								<tr>
									<td colspan="2" style="max-width: 1000px;">${mrcl.costContentBr }</td>

								</tr>
								<tr>
									<th>비용 ${mrcl.cost}원</th>
									<td style="display: flex; justify-content: right;"><a
										href="/gosuProject.do" class="btn btn-primary"
										style="width: 150px;">진행하기</a></td>
								</tr>
							</table>
						</td>
					</tr>
				</c:forEach>

			</table>


		</div>

		<div id="pageNavi"></div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
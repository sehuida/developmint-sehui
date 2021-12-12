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
	em{
		font-style: normal;
		font-weight: 900;
		font-size: 30px;
		margin-bottom: 15px;
		color: #373f57;
	}
	.tabWrap {
	    display: block;
	    padding: 10px 20px 10px 0;
	    font-size: 20px;
	    font-weight: bold;
	    letter-spacing: -1px;
	    line-height: 27px;
	    margin-bottom: 30px;
		list-style: none;
	}
	.tab{
		text-decoration: none;
		color: #888;
	}
	.tabWrap li {
    float: left;
    padding-right: 20px;
	}
	
	.tabWrap .tab .badge {
    display: inline-block;
    margin: 0 0 0 8px;
    padding: 0 12px 0 13px;
    min-width: 36px;
    height: 28px;
    line-height: 25px;
    border-radius: 14px;
    box-sizing: border-box;
    color: #fff;
    font-size: 16px;
    letter-spacing: 0;
    vertical-align: top;
    background: rgb(78, 205, 196);
}


	
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="container">
			<em>입사지원 현황</em>
			<ul class="tabWrap">
        		<li class="select"><a href="#" class="tab">전체<span class="badge">0</span></a></li>
        		<li><a href="#" class="tab">지원서 작성중<span class="badge">0</span></a></li>
    		</ul>
    		
    		<div class="status">
	            <div class="item new _dashboardDiv select">
	            	<button type="button" class="_dashboardBtn"><em>지원완료</em><span class="num">1</span></button>
	            </div>
	            <div class="item">
	            	<button type="button" class="_dashboardBtn"><em>전형 진행중</em><span class="num">0</span></button>
	            </div>
	            <div class="item">
	            	<button type="button" class="_dashboardBtn"><em>최종발표</em><span class="num">0</span></button>
	            </div>
        	</div>
		</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
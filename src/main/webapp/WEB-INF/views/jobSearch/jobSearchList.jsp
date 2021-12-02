<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구인구직게시판</title>
</head>
<style>
    .contain{
        width: 1200px;
        margin: 0 auto;
    }
    .jobSearchListHeader{
        overflow: hidden;
        margin-left: 100px;
    }
    .headerText1{
        margin-top: 150px;
        margin-right: 100px;
        font-weight: 900;
        font-size: 20px;
        float: left;
    }
    .headerText1>h1{
        margin: 5px 0px;
        color: black;
        font-weight: 900;
    }
    .headerText1>p{
    	margin-top: 20px;
        width: 300px;
        color: gray;
        font-size: 13px;
    }
    .resume{
        background-color: rgb(78, 205, 196);
        border: none;
        font-size: 15px;
        font-weight: 900;
        width: 200px;
        height: 50px;
        color: white;
        cursor: pointer;
    }
    .resume>a{
        text-decoration: none;
    }
    .headerImg{
        float: left;
    }
    .mainHeader{
        width: 1000px;
        margin: 0 auto;
    }
    .mainHeader>p{
        font-size: 18px;
        margin-left: 10px;
        margin-bottom: 50px;
        color: rgb(65, 65, 65);
    }
    .mainCenter{
        width: 1000px;
        margin: 0 auto;
    }
    .mainCenter>select{
        width: 310px;
        height: 50px;
        padding-left: 15px;
        margin-right: 20px;
        outline: none;
    }
    .mainCenter>input{
        width: 330px;
        height: 50px;
        padding-left: 15px;
        outline: none;
    }
    .content{
        margin-top: 50px;
        width: 995px;
        border: 1px solid gray;
        padding: 30px;
        padding-bottom: 0;
        overflow: hidden;
        padding-left: 50px;
        box-sizing: border-box;
    }
    .status{
        float: left;
        width: 70px;
        height: 30px;
        text-align: center;
        line-height: 30px;
        color: white;
        background-color: rgb(78, 205, 196);
    }
    .cpName{
        float: left;
        margin-left: 20px;
        padding-top: 3px;
        font-size: 13px;
	    }
    .cpName>a{
        color: blue;
        text-decoration: none;
    }
    .title{
        margin-top: 40px;
        margin-bottom: 15px;
    }
    .title>a{
        text-decoration: none;
        font-size: 24px;
        font-weight: 900;
        color: black;
    }
    .info{
        overflow: hidden;
    }
    .humanInfo{
        float: left;
    }
    .humanInfo>span{
        margin-right: 20px;
        color: gray;
    }
    .workInfo{
        float: left;
    }
    .workInfo>span{
        margin-left: 20px;
        color: gray;
    }
    .mainFooter{
        overflow: hidden;
        margin-top: 30px;
    }
    .tech{
        float: left;
        height: 50px;
    }
    .tech span{
        background-color: rgb(226, 226, 226);
        color: gray;
        padding: 10px;
        width: 50px;
        height: 30px;
        border-radius: 10px;
    }
    .subInfo{
        float: left;
        margin-left: 30px;
        color: rgb(100, 100, 100);
    }
    .subInfo>span{
    	font-size: 13px;
    }
    .situation{
        float: right;
        color: gray;
        padding-bottom: 30px;
        padding-right: 20px;
        font-size: 14px;
    }
    .date>span{
        color: rgb(78, 205, 196);
    }
    .apply>span{
        color: rgb(78, 205, 196);
    }
</style>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="contain">
        <div class="jobSearchListHeader">
            <div class="headerText1">
                <h1>IT구인구직은</h1>
                <h1>디벨로민트에서</h1>
                <h1>빠르고 안전하게</h1>
                <p>애플리케이션 개발, 웹 개발, 일반 소프트웨어 개발, 웹 디자인, 커머스, 쇼핑몰 등</p>
                <%-- <c:choose>
                	<c:when test="${not empty sessionScope.m.memberId }">
                <a href="resumeManage.do"><button class="resume">이력서 작성하기</button></a>                		
                	</c:when>
                	<c:otherwise>
                <a href="loginFrm.do"><button class="resume">이력서 작성하기</button></a>                		
                	</c:otherwise>
                </c:choose> --%>
                <a href="resumeManage.do"><button class="resume">이력서 작성하기</button></a>   		<!-- 나중에 choose 주석지우고 이거지우기 -->             		
            </div>
            <div class="headerImg">
                <img src="resources/img/jobSearch/jobSearchList.PNG">
            </div>
        </div>
        <div class="jobSearchListMain">
            <div class="mainHeader">
                <h2>채용정보</h2>
                <p>12개의 구인글</p>
            </div>
            <div class="mainCenter">
                <select>
                    <option>지역 선택</option>
                    <option>서울</option>
                    <option>경기</option>
                    <option>부산</option>
                </select>
                <select>
                    <option>직업 선택</option>
                    <option>웹 개발</option>
                    <option>디자인</option>
                    <option>기획</option>
                </select>
                <input type="text" placeholder="검색" class="search">
                <div class="content">
                    <div class="status">모집중</div>
                    <div class="cpName"><a href="companyInfo.do">케이씨환경서비스(주)</a></div>	<!-- 회사번호 -->	<!-- ?companyNo=${c.companyNo} -->
                    <div class="title">
                        <a href="jobSearchView.do?announce_no=1">2021 하반기 경영지원실 신입/경력 채용 공고</a>	<!-- 공고번호 -->
                    </div>
                    <div class="info">
                        <div class="humanInfo">
                            <span>경력</span> <span>신입·경력</span><br>
                            <span>학력</span> <span>대졸(4년제) 이상</span>
                        </div>
                        <div class="workInfo">
                            <span>|</span><span>개발</span><br>
                            <span>|</span><span>애플리케이션</span>
                        </div>
                    </div>
                    <div class="mainFooter">
                        <div class="tech">
                            <span>Java</span> <span>Android</span>		<!-- forEach문으로 ${r.tech } -->
                        </div>
                        <div class="subInfo">
                            <span>서울특별시 강남구</span> <span>등록일자 2021.11.23.</span>
                        </div>
                        <div class="situation">
                            <div class="date">마감 <span>7</span>일 전</div>		<!-- 7 -> 마감일-현재일 이거 어캐하지 -->
                            <div class="apply">총 <span>2</span>명 지원</div>		<!-- 2 -> 지원한 이력서 갯수 count  흠  -->
                        </div>
                    </div>
                </div>
                <div class="content">
                    <div class="status">모집중</div>
                    <div class="cpName"><a href="companyInfo.do?companyNo=1">케이씨환경서비스(주)</a></div>
                    <div class="title">
                        <a href="jobSearchView.do?announce_no=1">2021 하반기 경영지원실 신입/경력 채용 공고</a>
                    </div>
                    <div class="info">
                        <div class="humanInfo">
                            <span>경력</span> <span>신입·경력</span><br>
                            <span>학력</span> <span>대졸(4년제) 이상</span>
                        </div>
                        <div class="workInfo">
                            <span>|</span><span>개발</span><br>
                            <span>|</span><span>애플리케이션</span>
                        </div>
                    </div>
                    <div class="mainFooter">
                        <div class="tech">
                            <span>Java</span> <span>Android</span>
                        </div>
                        <div class="subInfo">
                            <span>서울특별시 강남구</span> <span>등록일자 2021.11.23.</span>
                        </div>
                        <div class="situation">
                            <div class="date">마감 <span>7</span>일 전</div>
                            <div class="apply">총 <span>2</span>명 지원</div>
                        </div>
                    </div>
                </div>
                <div class="content">
                    <div class="status">모집중</div>
                    <div class="cpName"><a href="companyInfo.do?companyNo=1">케이씨환경서비스(주)</a></div>
                    <div class="title">
                        <a href="jobSearchView.do?announce_no=1">2021 하반기 경영지원실 신입/경력 채용 공고</a>
                    </div>
                    <div class="info">
                        <div class="humanInfo">
                            <span>경력</span> <span>신입·경력</span><br>
                            <span>학력</span> <span>대졸(4년제) 이상</span>
                        </div>
                        <div class="workInfo">
                            <span>|</span><span>개발</span><br>
                            <span>|</span><span>애플리케이션</span>
                        </div>
                    </div>
                    <div class="mainFooter">
                        <div class="tech">
                            <span>Java</span> <span>Android</span>
                        </div>
                        <div class="subInfo">
                            <span>서울특별시 강남구</span> <span>등록일자 2021.11.23.</span>
                        </div>
                        <div class="situation">
                            <div class="date">마감 <span>7</span>일 전</div>
                            <div class="apply">총 <span>2</span>명 지원</div>
                        </div>
                    </div>
                </div>
                <div class="content">
                    <div class="status">모집중</div>
                    <div class="cpName"><a href="companyInfo.do?companyNo=1">케이씨환경서비스(주)</a></div>
                    <div class="title">
                        <a href="jobSearchView.do?announce_no=1">2021 하반기 경영지원실 신입/경력 채용 공고</a>
                    </div>
                    <div class="info">
                        <div class="humanInfo">
                            <span>경력</span> <span>신입·경력</span><br>
                            <span>학력</span> <span>대졸(4년제) 이상</span>
                        </div>
                        <div class="workInfo">
                            <span>|</span><span>개발</span><br>
                            <span>|</span><span>애플리케이션</span>
                        </div>
                    </div>
                    <div class="mainFooter">
                        <div class="tech">
                            <span>Java</span> <span>Android</span>
                        </div>
                        <div class="subInfo">
                            <span>서울특별시 강남구</span> <span>등록일자 2021.11.23.</span>
                        </div>
                        <div class="situation">
                            <div class="date">마감 <span>7</span>일 전</div>
                            <div class="apply">총 <span>2</span>명 지원</div>
                        </div>
                    </div>
                </div>
                <div class="content">
                    <div class="status">모집중</div>
                    <div class="cpName"><a href="companyInfo.do?companyNo=1">케이씨환경서비스(주)</a></div>
                    <div class="title">
                        <a href="jobSearchView.do?announce_no=1">2021 하반기 경영지원실 신입/경력 채용 공고</a>
                    </div>
                    <div class="info">
                        <div class="humanInfo">
                            <span>경력</span> <span>신입·경력</span><br>
                            <span>학력</span> <span>대졸(4년제) 이상</span>
                        </div>
                        <div class="workInfo">
                            <span>|</span><span>개발</span><br>
                            <span>|</span><span>애플리케이션</span>
                        </div>
                    </div>
                    <div class="mainFooter">
                        <div class="tech">
                            <span>Java</span> <span>Android</span>
                        </div>
                        <div class="subInfo">
                            <span>서울특별시 강남구</span> <span>등록일자 2021.11.23.</span>
                        </div>
                        <div class="situation">
                            <div class="date">마감 <span>7</span>일 전</div>
                            <div class="apply">총 <span>2</span>명 지원</div>
                        </div>
                    </div>
                </div>
                <div class="content">
                    <div class="status">모집중</div>
                    <div class="cpName"><a href="companyInfo.do?companyNo=1">케이씨환경서비스(주)</a></div>	<!-- 회사번호 -->
                    <div class="title">
                        <a href="jobSearchView.do?announce_no=1">2021 하반기 경영지원실 신입/경력 채용 공고</a>	<!-- 공고번호 -->
                    </div>
                    <div class="info">
                        <div class="humanInfo">
                            <span>경력</span> <span>신입·경력</span><br>
                            <span>학력</span> <span>대졸(4년제) 이상</span>
                        </div>
                        <div class="workInfo">
                            <span>|</span><span>개발</span><br>
                            <span>|</span><span>애플리케이션</span>
                        </div>
                    </div>
                    <div class="mainFooter">
                        <div class="tech">
                            <span>Java</span> <span>Android</span>
                        </div>
                        <div class="subInfo">
                            <span>서울특별시 강남구</span> <span>등록일자 2021.11.23.</span>
                        </div>
                        <div class="situation">
                            <div class="date">마감 <span>7</span>일 전</div>
                            <div class="apply">총 <span>2</span>명 지원</div>
                        </div>
                    </div>
                </div>
                <br>
                <p class="imsi" style="margin-top: 30px; margin-bottom: 60px; text-align: center">페이징 처리 하기</p>
            </div>
        </div>
    </div>
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
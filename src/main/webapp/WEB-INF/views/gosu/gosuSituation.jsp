<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container>h1{
    display: flex;
    justify-content: center;
    margin-top: 50px;
    font-size: 55px;
    font-weight: 900;
}

.container *{
	text-decoration : none;
	color:black;
}
.container{
    min-width: 1200px;
    margin-bottom:100px;
    margin-top:100px;
}
.g-sa-wrap h4{
    font-weight: 900;
    color: rgb(78, 205, 196);
    margin-top: 100px;
    margin-bottom: 100px;
    font-size: 40px;
}
.container>div>div>div table td{
    width: 75%;
    padding: 10px;
    text-align: center;
}

.container>div>div>div table a{
    margin-top: 20px;
    width: 200px;
    margin-bottom: 20px;

}
.container>div>div>div{
    border: 1px solid rgb(160, 160, 160);
    width: 400px;
    padding-left: 20px;
    padding-right: 20px;
 
}
.container>div>div{
    display: flex;
    justify-content: space-around;
}
.container>div>div>div table img{
    border-radius: 50%;
    width: 80px;
}

.review-one li{
    float: left;
    list-style-type: none;
    padding-right: 30px;
}
.review-one{
    overflow: hidden;
    
    padding: 20px;
}
.review-one p{
    text-align:center;
    padding: 10px;
    margin: 0;

}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp"%>
    <div class="container">
        <h1>나의 현황</h1>  
        <hr>
        <p style="margin-bottom: 100px;">신청하신 전체 내역을 확인하실 수 있습니다.</p>
        <div class="g-sa-wrap">
            <h4>신청한 내역</h4>
            <div>
                <div>
                    <table>
                        <tr style="font-size: x-small;">
                            <td style="text-align: left; color: red; padding-top: 20px;"><b>진행 중</b></td>
                            <td style="padding-top: 20px;">2021.XX.XX</td>
                        </tr>
                        <tr>
                            <td><b>제목제목제목</b></td>
                            <td rowspan="2"><img src="/resources/img/gosu/g_img_basic.png"></td>
                        </tr>
                        <tr>
                            <td> 내용내용</td>
                        </tr>
                        <tr>
                            <td colspan="2"><a class="btn btn-primary">자세히 보기</a></td>
                        </tr>

                    </table>
                </div>
        
                <div>
                    <table>
                        <tr style="font-size: x-small;">
                            <td style="text-align: left; color: red; padding-top: 20px;"><b>진행 중</b></td>
                            <td style="padding-top: 20px;">2021.XX.XX</td>
                        </tr>
                        <tr>
                            <td><b>제목제목제목</b></td>
                            <td rowspan="2"><img src="/resources/img/gosu/g_img_basic.png"></td>
                        </tr>
                        <tr>
                            <td> 내용내용</td>
                        </tr>
                        <tr>
                            <td colspan="2"><a class="btn btn-primary">자세히 보기</a></td>
                        </tr>

                    </table>
                </div>
          </div>
            <h4>신청받은 내역</h4>
            <div>
                <div>
                    <table>
                        <tr style="font-size: x-small;">
                            <td style="text-align: left; color: red; padding-top: 20px;"><b>진행 중</b></td>
                            <td style="padding-top: 20px;">2021.XX.XX</td>
                        </tr>
                        <tr>
                            <td><b>제목제목제목</b></td>
                            <td rowspan="2"><img src="/resources/img/gosu/g_img_basic.png"></td>
                        </tr>
                        <tr>
                            <td> 내용내용</td>
                        </tr>
                        <tr>
                            <td colspan="2"><a class="btn btn-primary">자세히 보기</a></td>
                        </tr>

                    </table>
                </div>
          
                <div>
                    <table>
                        <tr style="font-size: x-small;">
                            <td style="text-align: left; color: red; padding-top: 20px;"><b>진행 중</b></td>
                            <td style="padding-top: 20px;">2021.XX.XX</td>
                        </tr>
                        <tr>
                            <td><b>제목제목제목</b></td>
                            <td rowspan="2"><img src="/resources/img/gosu/g_img_basic.png"></td>
                        </tr>
                        <tr>
                            <td> 내용내용</td>
                        </tr>
                        <tr>
                            <td colspan="2"><a class="btn btn-primary">자세히 보기</a></td>
                        </tr>

                    </table>
                </div>
            </div>
 
            <h4>작성한 리뷰</h4>
            <div style="margin-bottom:100px;">
                <div class="review-one" style="width: 80%;">
                    <ul>
                        <li><b><span style="color: rgb(78, 205, 196);"> 고수 </span>XXX</b></li>
                        <li>별별별별별</li>
                        <li style="color:gray">2021.12.01</li>
                    </ul>
                    <br>
                    <div style="display: flex; justify-content: center;">
                        <p>리뷰리뷰리뷰리리뷰리뷰리뷰리리뷰리뷰리뷰리리뷰리뷰리뷰리리뷰리뷰리뷰리리뷰리뷰리뷰리리뷰리뷰리뷰리리뷰리뷰리뷰리뷰리뷰립류ㅣ뷰리뷰리뷰리뷰리리뷰리뷰리뷰리뷰리뷰립류ㅣ뷰리뷰리뷰리뷰리리뷰리뷰리뷰리뷰리뷰립류ㅣ뷰리뷰리뷰리뷰리리뷰리뷰리뷰리뷰리뷰립류ㅣ뷰리뷰리뷰리뷰리리뷰리뷰리뷰리뷰리뷰립류ㅣ뷰리뷰리뷰리뷰리</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
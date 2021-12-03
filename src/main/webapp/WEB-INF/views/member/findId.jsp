<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<link rel="stylesheet" href="/resources/css/member/login.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta charset="UTF-8">
<title>Find ID/PW</title>
    <style>
        #loginlogo{
            width: 170px;
            height: 40px;
        }
        #login-l{
            text-align: center;
        }
        #loginForm{
            background-color: #ffff;
            border-radius: 10px;
            width: 450px;
            margin: 50 auto;
            padding: 40px 70px 40px 70px;
        }
        #loginForm div{
            padding: 10px;
        }
        #finding{
            width: 50%;
            text-align: center;
        }
        #finding>a{
            color: #5a5a5a;
        }
        #finding .active{
            color: #ffff;
            background-color: rgb(78, 205, 196);
        }
        #idFind{
            margin-top: 40px;
            margin-bottom: 10px;
        }
        #findBtn{
            width: 100%;
            margin-top: 50px;
        }
    </style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div class="container">
        <div id="loginForm">
                <div id="login-l">
                    <img src="/resources/img/logo/Develomint_logo.png" id="loginlogo">
                </div>
                <ul class="nav nav-tabs">
                    <li class="nav-item" id="finding">
                      <a class="nav-link active" data-bs-toggle="tab" href="#ids">아이디찾기</a>
                    </li>
                    <li class="nav-item" id="finding">
                      <a class="nav-link" data-bs-toggle="tab" href="#pws">비밀번호찾기</a>
                    </li>
                </ul>
                  <div id="myTabContent" class="tab-content">
                    <div class="tab-pane fade active show" id="ids">
                        <strong>이메일로 찾기</strong><img src="/resources/img/member/email.png" style="width: 32px; height: 32px; margin-left: 10px;">
                        <div class="form-group">
                            <fieldset>
                                <div class="form-floating mb-3">
                                    <input type="email" class="form-control" id="email" name="email" placeholder="name@example.com">
                                    <label for="email" style="color: rgb(78, 205, 196); font-size: 14px;">이메일을 입력하세요</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="email" class="form-control" id="emailRe" name="emailRe" placeholder="name@example.com">
                                    <label for="emailRe" style="color: rgb(78, 205, 196); font-size: 14px;">이메일을 다시 입력하세요</label>
                                </div>
                            </fieldset>
                            <button type="button" class="btn btn-primary" id="findBtn">아이디 찾기</button>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="pws">
                      <p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit.</p>
                    </div>
                  </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script>
        $(function(){
            $("#findBtn").on("click",function(){
                var emailVal = $("#email").val();
                var emailRe = $("#emailRe").val();
                
				console.log(emailVal);
				
                if(emailVal == emailRe){
                    $.ajax({
                        url : "/idFind.do",
                        data : {email : emailVal},
                        type : "post",
                        success : function(data){
                            if(data != null){
                                swal({
                                    title: "가입하신 아이디 정보",
                                    text: "< "+data+" > 입니다.",
                                    icon: "success", //"info,success,warning,error" 중 택1
                                    button: "돌아가기",
                                    })
                            }else{
                                swal({
                                    title: "조회하신 이메일 정보가 없습니다",
                                    text: "입력값을  다시 확인해주세요.",
                                    icon: "warning", //"info,success,warning,error" 중 택1
                                    button: "돌아가기",
                                    })
                                return false;                                
                            }
                        }                
                    })
                }
            });

        });
    </script>
</body>
</html>
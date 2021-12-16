<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta charset="UTF-8">
<title>Project Outline</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<link rel="stylesheet" href="/resources/css/projectTeam/projectManageDefault.css">
	<link rel="stylesheet" href="/resources/css/projectTeam/projectManageOutline.css">
<script>
	$(function(){
		$("#updateLabel1").click(function(){
            $(".checkboxFlexList").css("display","flex");
            $("#updateLabel1").css("display","none");
            $("#updateLabel2").css("display","block");
        });
        $("#updateLabel2").click(function(){
            $(".checkboxFlexList").css("display","none");
            $("#updateLabel1").css("display","block");
            $("#updateLabel2").css("display","none");
        });

        $("#updateLeaderLabel1").click(function(){
            $("#selectLeaderBox").css("display","block");
            $("#updateLeaderLabel1").css("display","none");
            $("#updateLeaderLabel2").css("display","block");
        });
        $("#updateLeaderLabel2").click(function(){
            $("#selectLeaderBox").css("display","none");
            $("#updateLeaderLabel1").css("display","block");
            $("#updateLeaderLabel2").css("display","none");
        });
        
    }
	
</script>
	
	<div class="container" id="projectContainer">
		<div class="main">
            <div class="main-left-box">
                <h2>프로젝트 명</h2>
                <ul>
                    <li class="flexLi" style="border-bottom: 3px dashed #90d1b4;">
                        <a href="#" class="subNaviAtag"><img src="img/recruitTeamProject/recruitPage/powerOn.png" class="subNaviImg"><span>프로젝트 개요</span></a>
                    </li>
                    <li class="flexLi">
                        <a href="#" class="subNaviAtag"><img src="img/recruitTeamProject/추후사용/calendar.png" class="subNaviImg"><span>캘린더</span></a>
                    </li>
                    <li class="flexLi">
                        <a href="#" class="subNaviAtag"><img src="img/recruitTeamProject/추후사용/makefg (8).png" class="subNaviImg"><span>과업 관리</span></a>
                    </li>
                    <li class="flexLi">
                        <a href="#" class="subNaviAtag"><img src="img/recruitTeamProject/추후사용/board.png" class="subNaviImg"><span>보드</span></a>
                    </li>
                    <c:foreach 바로가기>
                    <li class="flexLi">
                        <a href="#" class="subNaviAtag"><span>바로가기</span></a>
                    </li>
                    </c:foreach>
                    <li class="flexLi">
                        <a data-bs-toggle="modal" href="#shortcutModal" class="subNaviAtag"><img src="img/recruitTeamProject/추후사용/shortcuts.png" class="subNaviImg"><span>바로가기 추가</span></a>
                    </li>
                </ul>
            </div>
            <div class="main_wrap">
                <div class="titleFlexBox">
                    <p class="titleText">프로젝트 개요</p>
                    <button type="button" class="btn btn-primary" id="closeProjectBtn">프로젝트 종료</button>
                </div>
                <div class="titleLine"></div>
                <div class="projectInfoFlexBox">
                    <div class="projectInfoLine1">
                        <form action="#" method="post">
                            <div class="form-group">
                                <label class="col-form-label col-form-label-lg mt-4" for="inputLarge" >프로젝트 이름</label>
                                <input class="form-control form-control-lg" type="text" placeholder="프로젝트명" id="inputLarge">
                            </div>
                            <div class="form-group">
                                <label class="col-form-label col-form-label-lg mt-4" for="inputLarge" >프로젝트 목표</label>
                                <input class="form-control form-control-lg" type="text" placeholder="프로젝트명" id="inputLarge">
                            </div>
                            <div class="projectLanguageBox">
                                <div class="projectLanguageFlexBox">
                                    <p class="infoLineText1">사용 언어</p>
                                    <button type="button" class="btn btn-primary btn-sm" id="updateLabel1">수정</button>
                                    <button type="button" class="btn btn-primary btn-sm" id="updateLabel2">취소</button>
                                </div>
                                <div class="languageBox">
                                    <img src="img/recruitTeamProject/common/language/django.png" style="width: 50px; margin-right: 10px;">
                                    <img src="img/recruitTeamProject/common/language/flutter.png" style="width: 50px; margin-right: 10px;">
                                    <img src="img/recruitTeamProject/common/language/python.png" style="width: 50px; margin-right: 10px;">
                                </div>
                                <div class="checkboxFlexList">
                                    <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
                                        <c:forEach items="${dlList }" var="dll" begin="0" end="7" step="1">
                                            <input type="checkbox" class="btn-check" id="${dll.langName }" autocomplete="off" name="chk" value="${dll.langName }">
                                            <label class="btn btn-primary" for="${dll.langName }">${dll.langName }</label>
                                        </c:forEach>
                                    </div>
                                    <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group" id="bottomCheckBox">
                                        <c:forEach items="${dlList }" var="dll" begin="8" end="15" step="1">
                                            <input type="checkbox" class="btn-check" id="${dll.langName }" autocomplete="off" name="chk" value="${dll.langName }">
                                            <label class="btn btn-primary" for="${dll.langName }">${dll.langName }</label>
                                        </c:forEach>
                                    </div>
                                    <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group" id="bottomCheckBox">
                                        <c:forEach items="${dlList }" var="dll" begin="16" end="23" step="1">
                                            <input type="checkbox" class="btn-check" id="${dll.langName }" autocomplete="off" name="chk" value="${dll.langName }">
                                            <label class="btn btn-primary" for="${dll.langName }">${dll.langName }</label>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                            <div class="projectLeader">
                                <div class="projectLanguageFlexBox">
                                    <p class="infoLineText1">프로젝트 리더</p>
                                    <button type="button" class="btn btn-primary btn-sm" id="updateLeaderLabel1">수정</button>
                                    <button type="button" class="btn btn-primary btn-sm" id="updateLeaderLabel2">취소</button>
                                </div>
                                <div class="leaderInfoBox">
                                    <img src="img/recruitTeamProject/common/user.png" class="leaderImg">
                                    <p class="leaderIdText">memberId</p>
                                    <img src="img/recruitTeamProject/common/rank/challenger.png" class="leaderGradeImg">
                                </div>
                                <div id="selectLeaderBox">
                                    <div class="form-group">
                                        <label for="exampleSelect1" class="form-label mt-4">프로젝트 리더 선택</label>
                                        <select class="form-select" id="exampleSelect1" style="width: 400px;">
                                            <option><p>memberId</p></option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="crueBox">
                                    <p class="infoLineText1">프로젝트 크루 및 역할</p>
                                    <div class="crueTwoFlexBox">
                                        <div class="crueAllInfoBox">
                                            <div class="crueProfile"> 
                                                <img src="img/recruitTeamProject/common/user.png" class="crueImg">
                                                <p class="crueIdText">memberId</p>
                                                <img src="img/recruitTeamProject/common/rank/challenger.png" class="crueGradeImg">
                                            </div>
                                            <div class="rollBox">
                                                <div class="form-group">
                                                    <input class="form-control form-control-sm" type="text" id="inputSmall" name="crueRoll">
                                                </div>
                                            </div>
                                        </div> 
                                        <div class="crueAllInfoBox">
                                            <div class="crueProfile"> 
                                                <img src="img/recruitTeamProject/common/user.png" class="crueImg">
                                                <p class="crueIdText">memberId</p>
                                                <img src="img/recruitTeamProject/common/rank/challenger.png" class="crueGradeImg">
                                            </div>
                                            <div class="rollBox">
                                                <div class="form-group">
                                                    <input class="form-control form-control-sm" type="text" id="inputSmall" name="crueRoll">
                                                </div>
                                            </div>
                                        </div> 
                                    </div>
                                    <div class="crueTwoFlexBox">
                                        <div class="crueAllInfoBox">
                                            <div class="crueProfile"> 
                                                <img src="img/recruitTeamProject/common/user.png" class="crueImg">
                                                <p class="crueIdText">memberId</p>
                                                <img src="img/recruitTeamProject/common/rank/challenger.png" class="crueGradeImg">
                                            </div>
                                            <div class="rollBox">
                                                <div class="form-group">
                                                    <input class="form-control form-control-sm" type="text" id="inputSmall" name="crueRoll">
                                                </div>
                                            </div>
                                        </div> 
                                        <div class="crueAllInfoBox">
                                            <div class="crueProfile"> 
                                                <img src="img/recruitTeamProject/common/user.png" class="crueImg">
                                                <p class="crueIdText">memberId</p>
                                                <img src="img/recruitTeamProject/common/rank/challenger.png" class="crueGradeImg">
                                            </div>
                                            <div class="rollBox">
                                                <div class="form-group">
                                                    <input class="form-control form-control-sm" type="text" id="inputSmall" name="crueRoll">
                                                </div>
                                            </div>
                                        </div> 
                                    </div>
                                    <div class="crueTwoFlexBox">
                                        <div class="crueAllInfoBox">
                                            <div class="crueProfile"> 
                                                <img src="img/recruitTeamProject/common/user.png" class="crueImg">
                                                <p class="crueIdText">memberId</p>
                                                <img src="img/recruitTeamProject/common/rank/challenger.png" class="crueGradeImg">
                                            </div>
                                            <div class="rollBox">
                                                <div class="form-group">
                                                    <input class="form-control form-control-sm" type="text" id="inputSmall" name="crueRoll">
                                                </div>
                                            </div>
                                        </div> 
                                        <div class="crueAllInfoBox">
                                            <div class="crueProfile"> 
                                                <img src="img/recruitTeamProject/common/user.png" class="crueImg">
                                                <p class="crueIdText">memberId</p>
                                                <img src="img/recruitTeamProject/common/rank/challenger.png" class="crueGradeImg">
                                            </div>
                                            <div class="rollBox">
                                                <div class="form-group">
                                                    <input class="form-control form-control-sm" type="text" id="inputSmall" name="crueRoll">
                                                </div>
                                            </div>
                                        </div> 
                                    </div>
                                </div>
                                <div class="taskMainFlexBox">
                                    <div class="taskInfoBox">
                                        <p class="infoLineText2">최근에 완료된 일</p>
                                        <div class="taskSubFlexBox">
                                            <p class="taskText">스프린트</p>
                                            <span class="badge rounded-pill bg-primary">완료</span>
                                        </div>
                                    </div>
                                    <div class="taskInfoBox" style="margin-right: 150px;">
                                        <p class="infoLineText2">앞으로 해야 할 일</p>
                                        <div class="taskSubFlexBox">
                                            <p class="taskText">스프린트 회고</p>
                                            <span class="badge rounded-pill bg-primary">처리중</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="areaLine"></div>
                            <div class="submitBtnArea">
                                <button type="submit" class="btn btn-primary">수정</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="shortcutModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog  modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <form action="/insertContestMember.do" method="post">
                        <p style="font-size: 25px; font-weight: bold">공모전 신청</p>
                        <p style="font-size: 22px;">${list.contest.contestTitle }</p>
                        <div style="border: 1px solid #d9d9d9; padding: 20px; margin-bottom: 20px;">
                            <p><span style="font-weight: bold">신청자 ID</span> : ${sessionScope.m.memberId }</p>
                            <p><span style="font-weight: bold">신청자 이름</span> : ${sessionScope.m.memberName }</p>
                            <p><span style="font-weight: bold">신청자 전화번호</span> : ${sessionScope.m.phone }</p>
                            <p><span style="font-weight: bold">신청자 E-mail</span> : ${sessionScope.m.email }</p>
                            <p><span style="font-weight: bold">신청자 Git 주소</span> : </p>
                            <input type="text" class="form-control" name="cmGit">
                        </div>
                        <div style="text-align: right; ">
                            <button type="submit" class="btn btn-primary contesteEnrollBtn" style="width: 100px;">신청</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="width: 100px;">취소</button>
                        </div>
                        <input type="hidden" name="contestNo" value="${list.contest.contestNo }">
                        <input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
                        <input type="hidden" name="cmStatus" value="1">
                    </form>
                </div>
            </div>
        </div>
    </div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
	$(function(){
		 
		$("#summernote").summernote({
			height : 700,
			lang : "ko-KR",
			focus: false,
			placeholder: '프로젝트 공고내용을 자세히 작성해주세요..!',
			toolbar:[ 
						['fontname', ['fontname']],
						['fontsize', ['fontsize']], 
						['style', ['bold', 'italic', 'underline','strikethrough', 'clear']], 
						['color', ['forecolor','color']], 
						['table', ['table']], 
						['para', ['ul', 'ol', 'paragraph']], 
						['height', ['height']], 
						['insert',['picture','link']], 
						['view', ['fullscreen', 'codeview', 'help']] 
					], 
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'], 
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			callbacks:{
				onImageUpload : function(files){
 					uploadImage(files[0], this);
 				}
			}
		});
	});
	
	function uploadImage(file, editor){
		data = new FormData();
		data.append("file",file);
		var fileData = $("input[name=files]").val();
		$.ajax({
			url : "/rUploadImage.do",
			type :"post",		//file전송을 위해 ajax를 할떄는 type을 post로 해줘야한다
			data : data,
			enctype : 'multipart/form-data',
			processData : false,
			contentType : false,
			success : function(data){
				$(editor).summernote("insertImage",data);
				
			}
		});
	}
	
	$(function() {	
		$('#datePicker').datepicker({
		    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
		    startDate: '0d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
		    endDate: '+14d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
		    autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
		    calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
		    clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
		    /* datesDisabled : ['2019-06-24','2019-06-26'],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함. */
		    /* daysOfWeekDisabled : [0,6],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
		    daysOfWeekHighlighted : [3], //강조 되어야 하는 요일 설정 */
		    disableTouchKeyboard : false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
		    immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
		    multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
		    multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
		    templates : {
		        leftArrow: '&laquo;',
		        rightArrow: '&raquo;'
		    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
		    showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
		    title: "마감일 선택",	//캘린더 상단에 보여주는 타이틀
		    todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
		    toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
		    weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
		    language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
		    
		});//datepicker end
	});//ready end
	</script>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico"/>
<link rel="stylesheet" href="/resources/css/projectTeam/recruitMember.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Recruit Crue</title>
</head>
<script>
	$(function(){
		var selectLangList = $(".selectLangList");
		var arr = new Array();
		for(var i=0;i<selectLangList.length;i++){
			arr.push(selectLangList.eq(i).html());
		}
		var langCount = $(".language_icon").length;
		var langValue;
		var viewValue = $(".clickCssKeeper").val();
	    var checkValue = $(".checkCssKeeper").val();
		// delCheckValue -> 1 언어취소 안한상태 / 2 언어취소 한 상태(재클릭) / 3 언어선택 자체를 안한 초기상태
		
	    $(".language_icon").click(function(){
	    	langValue = $(this).attr("alt");
	    	if($.inArray(langValue, arr) != -1){
	    		arr.splice($.inArray(langValue, arr),1);
	    	}else{
	    		arr.push(langValue);
	    	}
	    	
	        if($(".language_icon_disabled").length == 0 ){
	        	var url = "/recruitTeamMember_mainSelectPage.do?reqPage=1&viewValue="+viewValue+"&checkValue="+checkValue;
	 	        $(".languageList").css("background-color", "#90d1b44f");
	            $(".language_icon").addClass("language_icon_disabled");
	            $(this).toggleClass("language_icon_disabled");
	            if(!($(this).hasClass("language_icon_disabled"))){
	            	for(var i = 0; i < arr.length; i++ ){
	            		var addData = '&langValue='+arr[i];
	            		url += addData;
	            	}
	            	location.href= url;
		            
	            } else {
	            	for(var i = 0; i < arr.length; i++ ){
	            		var addData = '&langValue='+arr[i];
	            		url += addData;
	            	}
	            	location.href= url;
		            // location.href="/recruitTeamMember_mainSelectPage.do?reqPage=1&viewValue="+viewValue+"&checkValue="+checkValue+"&langValue="+langValue;
	            }
	        } else {
	        	$(this).toggleClass("language_icon_disabled");
	        	if(!($(this).hasClass("language_icon_disabled"))){
	        		for(var i = 0; i < arr.length; i++ ){
	            		var addData = '&langValue='+arr[i];
	            		url += addData;
	            	}
	            	location.href= url;
	            } else {
	            	for(var i = 0; i < arr.length; i++ ){
	            		var addData = '&langValue='+arr[i];
	            		url += addData;
	            	}
	            	location.href= url;
	            }
	        }
	        if($(".language_icon_disabled").length == 14){
	        	$(".languageList").css("background-color", "white");
	            $(".language_icon_disabled").removeClass("language_icon_disabled");
	            location.href=url;
	        }
	    });
	
	    if(arr != null){
	    	$(".languageList").css("background-color", "#90d1b44f");
	    	$(".language_icon").addClass("language_icon_disabled");
	    	for(var i = 0; i < arr.length; i++){
	    		if($.inArray(($(".language_icon_disabled").eq(i).attr("alt")), arr) != -1){
	    			$(".language_icon_disabled").eq(i).removeClass("language_icon_disabled");
	    		}
	    	}
	    }else {
	    	$(".languageList").css("background-color", "white");
	    }
	    
	    $(".rBox_Leftnavi_left").click(function(){
	    	if($(".navi_checkbox").is(":checked")){
				location.href="/recruitTeamMember_mainSelectPage.do?reqPage=1&viewValue=1&checkValue=2";
			} else {
				location.href="/recruitTeamMember_mainSelectPage.do?reqPage=1&viewValue=1&checkValue=1";
			}
	    });
	    
		$(".rBox_Leftnavi_right").click(function(){
			if($(".navi_checkbox").is(":checked")){
				location.href="/recruitTeamMember_mainSelectPage.do?reqPage=1&viewValue=2&checkValue=2";
			} else {
				location.href="/recruitTeamMember_mainSelectPage.do?reqPage=1&viewValue=2&checkValue=1";
			}
		 });
		
		$(".navi_checkbox").change(function(){
			if($(".navi_checkbox").is(":checked")){
				location.href="/recruitTeamMember_mainSelectPage.do?reqPage=1&viewValue=1&checkValue=2";
			} else {
				location.href="/recruitTeamMember_mainSelectPage.do?reqPage=1&viewValue=1&checkValue=1";
			}
		});
		
		
		
	    
	    if(checkValue == 1){
	    	$(".navi_checkbox").prop("checked", false);
	    	if(viewValue == 1){
	    		$(".rBox_Leftnavi_right").css("opacity", "0.5");
		        $(".rBox_Leftnavi_left").css("opacity", "1"); 
	    	}else if(viewValue == 2){
	    		$(".rBox_Leftnavi_right").css("opacity", "1");
		        $(".rBox_Leftnavi_left").css("opacity", "0.5"); 
	    	}
	    } else if(checkValue == 2){
	    	$(".navi_checkbox").prop("checked", true);
			if(viewValue == 1){
				$(".rBox_Leftnavi_right").css("opacity", "0.5");
		        $(".rBox_Leftnavi_left").css("opacity", "1");
	    	}else if(viewValue == 2){
	    		$(".rBox_Leftnavi_right").css("opacity", "1");
		        $(".rBox_Leftnavi_left").css("opacity", "0.5"); 
	    	}
	    }
	});
</script>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container" id="projectContainer">
            <div class="main">
                <div class="languageBox">
                <c:choose>
                	<c:when test="${empty viewValue }">
                		<input type="hidden" class="checkCssKeeper" value="1">
		            	<input type="hidden" class="clickCssKeeper" value="1">
                	</c:when>
                	<c:otherwise>
                		<input type="hidden" class="checkCssKeeper" value="${checkValue }">
		            	<input type="hidden" class="clickCssKeeper" value="${viewValue }">
                	</c:otherwise>
                </c:choose>
                    <ul class="languageList">
                    <c:forEach items="${developLangList }" var="dll">
                    	<li class="languageItem">
                            <img class="language_icon" src="${dll.langImg }" alt="${dll.langName }">
                        </li>
                    </c:forEach>
                    </ul>
                    <img id="languageBox_label" src="/resources/img/recruitTeamProject/recruitPage/select_language.png"><span id="label_font1">원하는 언어를 선택해 주세요!</span>
                </div>
                <div class="main_wrap">
                    <div class="recruitBox">
                        <div class="rBox_navi">
                            <div id="left_site" class="left_site">
	                            <div class="rBox_Leftnavi_left">
	                                   <img class="rBox_navi_icon" src="/resources/img/recruitTeamProject/recruitPage/newList.png">
	                                   <span class="navi_left_font">최신</span>
	                            </div>
	                            <div class="rBox_Leftnavi_right">
	                                    <img class="rBox_navi_icon" src="/resources/img/recruitTeamProject/recruitPage/pop.png">
	                                    <span class="navi_left_font">인기</span>
	                           </div>
                            </div>
                            <div id="right_site">
                                <input type="checkbox" class="navi_checkbox">
                                <span class="navi_right_font">모집중인 글만 보기</span>
                                <a href="/recruitNotice_writeForm.do?memberNo=${m.memberNo }"><button type="button" class="btn btn-success" id="navi_button">글 쓰기</button></a>
                            </div>
                        </div>
                        <div class="rListBox">
                        <c:forEach items="${list }" var="pt" varStatus="mi">
                        	<div class="contentFlexBox">
                                <div class="imgBox">
                                    <img class="myInfoImg" src="${pt.writerImgPath }">
                                </div>
                                <div class="contentBox">
                                    <div class="textFlexBox1">
                                        <div class="textContent">
                                            <p class="contentText">${pt.RTitle }</p>
                                        </div>
                                        <div class="dateType">
                                            <b>작성일 : </b><span><b>${pt.RStartDate }</b></span>
                                        </div>
                                    </div>
                                    <div class="textFlexBox2">
                                        <div></div>
                                        <div class="dateType">
                                            <b>마감일 : </b><span><b>${pt.REndDate }</b></span>
                                        </div>
                                    </div>
                                    <div class="bottomFlexBox">
                                        <div class="subImgBox">
	                                        <c:forEach items="${pdLangList }" var="lI"  varStatus="i">
	                                        	<c:if test="${pt.projectNo eq lI.projectNo }">
	                                        		<img class="langImg" src="${lI.langImg }">
	                                           	</c:if>
	                                        </c:forEach>
                                        </div>
                                        <div class="countBox">
                                            <img class="countImg" src="/resources/img/recruitTeamProject/recruitPage/bubble-chat.png">
                                            <span class="countText">${pt.commentCount }</span>
                                            <img class="countImg" src="/resources/img/recruitTeamProject/recruitPage/eye.png">
                                            <span class="countText">${pt.viewCount }</span>
                                            <img class="countImg" src="/resources/img/recruitTeamProject/recruitPage/full_hart.png">
                                            <span class="countText">${pt.dibCount }</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <div id = "pageNavi">${pageNavi }</div>
                    </div>
                </div>
            </div>
        </div>
     </div>
     <c:forEach items="${selectLangList }" varStatus="i">
     	<span class="selectLangList">${selectLangList[i.index]}</span>
     </c:forEach>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<sec:authentication property="name" var="username"/>
<sec:authentication property="authorities" var="authorities"/>
<sec:authentication property="principal" var="principal"/>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seoul Traveler</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/travel.css" />
<script src="${pageContext.request.contextPath}/resources/js/common.js" defer></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=8d916d2023f8da17e354c4592559d114" ></script>
</head>

<script>
$(function(){
	loadImages();

});

function loadImages(){
	var ulImages = "";
	var images = $(".locationImage");
	var imageFilePaths = "${result[0].imageFilePaths }".split(" ");
	for(var i = 0; i<imageFilePaths.length; i++){
		ulImages = ulImages + '<li class="imgList"><div class="roll_content"><img class="locationImage" src="'+imageFilePaths[i]+'"  alt="${result[0].locationName}"><p class="roll_txtline"></p></div></li>';		
	}
	$(".ImgList").html(ulImages);
}
</script>

<body>
    <div id="wrap">
        <header>
            <div class="header_area box_inner clear">
                <h1><a href="${pageContext.request.contextPath}/main">Seoul Traveler</a></h1>
                <div class="header_cont">
                    <ul class="util clear">
                    	<sec:authorize access="isAnonymous()">
	                        <li><a href="${pageContext.request.contextPath }/login">?????????</a></li>
	                        <li><a href="${pageContext.request.contextPath }/register">????????????</a></li>
                    	</sec:authorize>
                    	<sec:authorize access="isAuthenticated()">
	                    	<sec:authentication property="principal.username" var="username" />
							<sec:authentication property="principal.name" var="name" />
                    		<li class="welcome">???????????????, <strong>${username }</strong>(${name }) ???! </li>
	                    	<sec:authorize access="hasRole('ADMIN')">
		                        <li><a href="${pageContext.request.contextPath }/admin/">?????????</a></li>
	                    	</sec:authorize>
	                    	<sec:authorize access="hasRole('MEMBER')">
		                        <li><a href="${pageContext.request.contextPath }/user/mypage">???????????????</a></li>
	                    	</sec:authorize>
	                    	<li><a href="${pageContext.request.contextPath }/logout">????????????</a></li>
                    	</sec:authorize>
                    </ul>
                    <nav>
                        <ul class="gnb clear">
                            <li>
                                <a href="${pageContext.request.contextPath }/travel/culture/cultureList" class="openAll">?????? ?????????</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath }/room/roomForm" class="openAll">?????? ??????</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath }/notice/list" class="openAll">????????????</a>
                            </li>
                            <li>
                            <div id="weather"></div>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </header>
        <div class="title">
        <h2 id="locationName">${result[0].locationName }</h2>
        </div>
<div class="content">
		<div class="imageWrap">
		<div class="subtitle">?????? ??????</div>
			<div id="image" style="width: 100%; height: 350px;">
			          <ul class="ImgList">
                    </ul>
                </div>
		</div>
		
	<div class="infoWrap">	
	<div class="subtitle">?????? ??????</div>
	 <div id="info">
	 ${result[0].content }
	 </div>
	</div>
	<div class="mapWrap">	
		<div id="map"></div>
		<div class="mapInfo">
			<div class="address">
				<div class="mAddr"><span>??????</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="locationAddr">${result[0].locationAddr }</span></div>
				<div class="homepage"><span>????????????</span> &nbsp;&nbsp;&nbsp;${result[0].homepage }</div>
				<div class="price"><span>????????????</span> &nbsp;&nbsp;&nbsp;&nbsp;${result[0].businessHour }</div>
				<div class="price"><span>??????</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${result[0].phoneNo }</div>
				<div class="price"><span>?????????</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${result[0].fee }</div>
			</div>
		</div>
	</div>
	</div>
	</div>
<!-- //content -->
        <footer>
            <div class="foot_area box_inner">
                <ul class="foot_list clear">
                    <li><a href="#">????????????</a></li>
                    <li><a href="#">????????????????????????</a></li>
                </ul>
                <h2>Traveler</h2>
                <p class="addr">
                    ??????????????? ????????? ???????????? 146
                    <span class="gubun">/</span>
                    <span class="br_line">????????????
                        <span class="space0">02-1234-5678</span>
                    </span>
                    <span class="gubun">/</span>
                    <span class="br_line">E-mail : 
                        <span class="space0">traveler@traveler.com</span>
                    </span>
                </p>
                <p class="copy box_inner">
                    Copyright??? SeoulTraveler all right reserved
                </p>
            </div>
        </footer>
        </div>
</body>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bf6f76ad722b04c307bfdc8a887d2d33&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // ????????? ????????? div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // ????????? ????????????
        level: 3 // ????????? ?????? ??????
    };  

// ????????? ???????????????    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// ??????-?????? ?????? ????????? ???????????????
var geocoder = new kakao.maps.services.Geocoder();

// ????????? ????????? ???????????????
geocoder.addressSearch($("#locationAddr").text(), function(result, status) {

    // ??????????????? ????????? ??????????????? 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // ??????????????? ?????? ????????? ????????? ???????????????
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

		var locationName = $("#locationName").text()

        // ?????????????????? ????????? ?????? ????????? ???????????????
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+locationName+'</div>'
        });
        infowindow.open(map, marker);

        // ????????? ????????? ??????????????? ?????? ????????? ??????????????????
        map.setCenter(coords);
    }else{
    	alert("?????? ??????");
    } 
    
});    
    </script>
    </html> 
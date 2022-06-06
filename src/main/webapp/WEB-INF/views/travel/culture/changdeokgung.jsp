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
<body>
    <div id="wrap">
        <header>
            <div class="header_area box_inner clear">
                <h1><a href="${pageContext.request.contextPath}/main">Seoul Traveler</a></h1>
                <div class="header_cont">
                    <ul class="util clear">
                    	<sec:authorize access="isAnonymous()">
	                        <li><a href="${pageContext.request.contextPath }/login">로그인</a></li>
	                        <li><a href="${pageContext.request.contextPath }/register">회원가입</a></li>
                    	</sec:authorize>
                    	<sec:authorize access="isAuthenticated()">
	                    	<sec:authentication property="principal.username" var="username" />
	                    	<sec:authentication property="principal.name" var="name" />
                    		<li class="welcome">환영합니다, <strong>${username }</strong>(${name }) 님! </li>
	                    	<sec:authorize access="hasRole('ADMIN')">
		                        <li><a href="${pageContext.request.contextPath }/admin/">관리자</a></li>
	                    	</sec:authorize>
	                    	<sec:authorize access="hasRole('MEMBER')">
		                        <li><a href="${pageContext.request.contextPath }/user/mypage">마이페이지</a></li>
	                    	</sec:authorize>
	                    	<li><a href="${pageContext.request.contextPath }/logout">로그아웃</a></li>
                    	</sec:authorize>
                    </ul>
                    <nav>
                        <ul class="gnb clear">
                            <li>
                                <a href="${pageContext.request.contextPath }/travel/culture/cultureList" class="openAll">추천 여행지</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath }/room/roomForm" class="openAll">숙소 예약</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath }/notice/list" class="openAll">공지사항</a>
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
        <h2 id="locationName">창덕궁</h2>
        </div>
<div class="content">
		<div class="imageWrap">
		<div class="subtitle">사진 보기</div>
			<div id="image" style="width: 100%; height: 350px;">
			          <ul class="ImgList">
                        <li class="imgList0">
                            <div class="roll_content">
                                <img src="../../resources/images/travel/culture/changdeokgung_1.jpg"  alt="창덕궁"><p class="roll_txtline"></p>
                            </div>
                        </li>
                        <li class="imgList1">
                            <div class="roll_content">
                                <img src="../../resources/images/travel/culture/changdeokgung_2.jpg" alt="창덕궁"><p class="roll_txtline"></p>
                            </div>
                        </li>
                        <li class="imgList2">
                            <div class="roll_content">
                                <img src="../../resources/images/travel/culture/changdeokgung_3.jpg"  alt="창덕궁"><p class="roll_txtline"></p>
                            </div>
                        </li>
                    </ul>
                </div>
		</div>
		
	<div class="infoWrap">	
	<div class="subtitle">상세 정보</div>
	 <div id="info">
	 창덕궁은 1405년 경복궁의 이궁으로 지은 궁궐이다. 경복궁의 동쪽에 위치한다 하여 이웃한 창경궁과 더불어 동궐이라 불렀다. 임진왜란으로 모든 궁궐이 불에 타자 광해군 때에 다시 짓고 고종이 경복궁을 중건하기까지 정궁 역할을 하였다. 조선의 궁궐 중 가장 오랫동안 임금들이 거처했던 궁궐이다.
	 </div>
	</div>
	<div class="mapWrap">	
		<div id="map"></div>
		<div class="mapInfo">
			<div class="address">
				<div class="mAddr"><span>주소</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서울 종로구 율곡로 99</div>
				<div class="homepage"><span>홈페이지</span> &nbsp;&nbsp; http://www.cdg.go.kr/</div>
				<div class="price"><span>운영시간</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;매일 09:00 - 18:00 (2월~5월, 9월~10월)</div>
			</div>
		</div>
	</div>
	</div>
	</div>
<!-- //content -->
        <footer>
            <div class="foot_area box_inner">
                <ul class="foot_list clear">
                    <li><a href="#">이용약관</a></li>
                    <li><a href="#">개인정보취급방침</a></li>
                </ul>
                <h2>Traveler</h2>
                <p class="addr">
                    서울특별시 강남구 테헤란로 146
                    <span class="gubun">/</span>
                    <span class="br_line">대표전화
                        <span class="space0">02-1234-5678</span>
                    </span>
                    <span class="gubun">/</span>
                    <span class="br_line">E-mail : 
                        <span class="space0">traveler@traveler.com</span>
                    </span>
                </p>
                <p class="copy box_inner">
                    Copyrightⓒ SeoulTraveler all right reserved
                </p>
            </div>
        </footer>
        </div>
</body>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bf6f76ad722b04c307bfdc8a887d2d33&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('서울 종로구 율곡로 99', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });


    	var locationName = $("#locationName").text();
        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+locationName+'</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    }else{
    	alert("지도 실패");
    } 
    
});    
    </script>
    </html> 
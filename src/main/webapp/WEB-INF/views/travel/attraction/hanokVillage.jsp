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
                                <a href="${pageContext.request.contextPath }/" class="openAll">숙소 예약</a>
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
        <h2 id="locationName">북촌 한옥마을</h2>
        </div>
<div class="content">
		<div class="imageWrap">
		<div class="subtitle">사진 보기</div>
			<div id="image" style="width: 100%; height: 350px;">
			          <ul class="ImgList">
                        <li class="imgList0">
                            <div class="roll_content">
                                <img src="../../resources/images/travel/attraction/hanokVillage_1.jpg"  alt="북촌한옥마을"><p class="roll_txtline"></p>
                            </div>
                        </li>
                        <li class="imgList1">
                            <div class="roll_content">
                                <img src="../../resources/images/travel/attraction/hanokVillage_2.jpg" alt="북촌한옥마을"><p class="roll_txtline"></p>
                            </div>
                        </li>
                        <li class="imgList2">
                            <div class="roll_content">
                                <img src="../../resources/images/travel/attraction/hanokVillage_3.jpg"  alt="북촌한옥마을"><p class="roll_txtline"></p>
                            </div>
                        </li>
                    </ul>
                </div>
		</div>
		
	<div class="infoWrap">	
	<div class="subtitle">상세 정보</div>
	 <div id="info">
	 경복궁과 창덕궁, 금원(비원) 사이 북악산 기슭에 있는 한옥 보존지구로 청계천과 종로의 윗동네라는 뜻으로 북촌이라고도 한다. 북촌은 고관대작들과 왕족, 사대부들이 모여서 거주해온 고급 살림집터로 한옥은 모두 조선시대의 기와집이다.원래 이 지역에는 솟을대문이 있는 집 몇 채와 30여 호의 한옥만이 있었으나 일제강점기 말부터 한옥이 많이 지어졌고, 1992년 가회동한옥보존지구에서 해제되고, 1994년 고도제한이 풀리면서 일반 건물들이 많이 들어섰다. 총 2,297동의 건물이 있는데, 이 가운데 1,408동이 한옥이고 나머지는 일반 건물이다. 북촌 거리에는 북촌양반생활문화전시관과 북촌 한옥촌 상징조형물을 설치되어 있고, 옛 선조의 생활모습을 구경할 수 있는 가회동 전통 마을축제가 열린다. 주변에 경복궁 창덕궁 덕수궁 금원 삼청공원 국립중앙박물관 등의 관광지가 있다.
	 </div>
	</div>
	<div class="mapWrap">	
		<div id="map"></div>
		<div class="mapInfo">
			<div class="address">
				<div class="mAddr"><span>주소</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서울 종로구 계동길 37</div>
				<div class="homepage"><span>홈페이지</span> &nbsp;&nbsp; hanok.seoul.go.kr</div>
				<div class="price"><span>전화</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;02-2133-1372</div>
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
geocoder.addressSearch('서울 종로구 계동길 37', function(result, status) {

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
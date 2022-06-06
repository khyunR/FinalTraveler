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
        <h2 id="locationName">롯데월드타워</h2>
        </div>
<div class="content">
		<div class="imageWrap">
		<div class="subtitle">사진 보기</div>
			<div id="image" style="width: 100%; height: 350px;">
			          <ul class="ImgList">
                        <li class="imgList0">
                            <div class="roll_content">
                                <img src="../../resources/images/travel/attraction/lotteTower_1.jpg"  alt="롯데월드타워"><p class="roll_txtline"></p>
                            </div>
                        </li>
                        <li class="imgList1">
                            <div class="roll_content">
                                <img src="../../resources/images/travel/attraction/lotteTower_2.jpg" alt="롯데월드타워"><p class="roll_txtline"></p>
                            </div>
                        </li>
                    </ul>
                </div>
		</div>
		
	<div class="infoWrap">	
	<div class="subtitle">상세 정보</div>
	 <div id="info">
	 한국적 곡선의 미를 지닌 한국 전통의 도자기와 붓의 형상을 모티브로 설계된 롯데월드타워는 총 123층, 555M 높이로 세계 5위의 초고층 빌딩이다. 대지면적은 축구장의 12.2배, 전체 총 면적은 축구장의 110배에 달하는 거대한 수직도시이다. 2016년 12월 마침내 준공되었으며, 특급 호텔 '시그니엘 서울'과, 화려한 서울의 야경을 볼 수 있는 전망대인 '서울스카이', 최고급 레지던스와 오피스 공간, 복합기능공간 등으로 구성되어있다. 롯데월드몰은 국내 최대의 명품 백화점인 '에비뉴엘'과 국내 시내 면세점 중 최대 면적을 자랑하는 '롯데면세점', '롯데 하이마트', '쇼핑몰', '롯데마트' 등이 위치해있는 쇼핑 관광의 명소로 다양한 국내외 브랜드를 만날 수 이는 공간이다. 쇼핑공간 외에도 문화·예술공간으로 아시아 최대규모의 멀티플렉스인 '롯데시네마 월드타워관', '롯데월드 아쿠아리움', 국내 최초 빈야드 스타일의 '롯데 콘서트홀'이 있어 쇼핑과 엔터테인먼트를 함께 즐길 수 있는 복합 쇼핑몰이다.
	 </div>
	</div>
	<div class="mapWrap">	
		<div id="map"></div>
		<div class="mapInfo">
			<div class="address">
				<div class="mAddr"><span>주소</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서울 송파구 올림픽로 300</div>
				<div class="homepage"><span>홈페이지</span> &nbsp;&nbsp; http://www.lwt.co.kr/</div>
				<div class="price"><span>전화</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;02-3213-5000</div>
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
geocoder.addressSearch('서울 송파구 올림픽로 300', function(result, status) {

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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<sec:authentication property="name" var="username"/>
<sec:authentication property="authorities" var="authorities"/>
<sec:authentication property="principal" var="principal"/>
<!DOCTYPE html>
<html lang="ko-KR">
<head>
<meta charset="UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js" defer></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/roomdetail.css" />
<script type="text/javascript" src="e6f400fd66b45b896ffa06450e898046"></script> 
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=8d916d2023f8da17e354c4592559d114" ></script>
<title>room</title>
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

    <div class="room_name" id="room_name">페어필드 바이 메리어트 서울</div>
    <div class="room_pic">
        <img src="${pageContext.request.contextPath}/images/hotel1.jpg" alt="페어필드 바이 메리어트 서울">
    </div>
    <div class="room_choose">
        <p>price</p>
        <input name="birth" type="date" class="room_date" placeholder="날짜"/>
        <button id="button1" type="submit" class="room_res">예약</button>
    </div>
    <div class="room_pics">
        <img src="${pageContext.request.contextPath}/images/hotel1-1.jpg" alt="페어필드 바이 메리어트 서울">
        <img src="${pageContext.request.contextPath}/images/hotel1-2.jpg" alt="페어필드 바이 메리어트 서울">
    </div>
    <div class="room_info">
    <p>페어필드 바이 메리어트는 1호선 영등포역 3번 출구에서 도보 약 5분 거리에 있으며, 
    여의도 한강공원까지 차로 약 10분, 영등포 타임스퀘어까지 도보 5분, 문래창작촌까지 도보로 약 20분 거리에 위치해 있습니다. 
    호텔에는 피트니스 센터, 비즈니스 센터 등의 부대시설이 갖춰져 있습니다. 총 556개의 객실 내에는 에어컨, TV, 냉장고, 다리미 및 다리미판, 
    커피/티 메이커, 욕실 어메니티 등이 구비되어 있습니다.</p>
    </div>
    
    <div class="room_map" id="map"></div>
    
    <sec:authorize access="isAuthenticated()">
    	<ul>
    	<c:forEach items="${reply}" var="dto">
    	<li>
    		<div>
    			<p>${dto.uid} / ${dto.regDate}</p>
    			<p>${dto.content}</p>
    		</div>
    	</li>
    	</c:forEach>
		</ul> 
	
		<div class="room_comment">
		<form method="POST" action="writeReviewOk">
		<p>
			<label>댓글 작성자</label> <input type="text" name="username" value="${principal.username }" disabled/>
			<input type="text" name="mb_uid" hidden value="${principal.uid }"/>
		</p>
		<p>
			<textarea rows="5" cols="50" name="content" ></textarea>
		</p>
		<p>
			<button type="submit" id="button1">댓글 작성</button>
		</p>
		</form>
		</div>
    </sec:authorize>
    
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
	
	<script>
	$("#button1").click(function() {
	alert("숙소 예약되었습니다.");
	});
	</script>

    
   
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
geocoder.addressSearch("서울특별시 영등포구 경인로 870", function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });


    	var locationName = "페어필드 바이 메리어트 서울";
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<sec:authentication property="authorities" var="authorities"/>
<!DOCTYPE html>
<html lang="ko-KR">
<head>
<meta charset="UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/roomdetail.css" />
<script type="text/javascript" src="e6f400fd66b45b896ffa06450e898046"></script> 
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=8d916d2023f8da17e354c4592559d114" ></script>
<title>room</title>
</head>
<body>
    
<div id="wrap">

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
    	<c:forEach items="${reply}" var="relpy">
    	<li>
    		<div>
    			<p>${reply.write} / ${reply.regDate}</p>
    			<p>${reply.content}</p>
    		</div>
    	</li>
    	</c:forEach>
		</ul> 
	
		<div class="room_comment">
		<p>
			<label>댓글 작성자</label> <input type="text">
		</p>
		<p>
			<textarea rows="5" cols="50"></textarea>
		</p>
		<p>
			<button type="button">댓글 작성</button>
		</p>
		</div>
    </sec:authorize>
    
	
	
	<script>
	$("#button1").click(function() {
	alert("버튼1을 누르셨습니다.");
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

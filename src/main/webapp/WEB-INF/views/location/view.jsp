<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<sec:authentication property="name" var="username"/>
<sec:authentication property="authorities" var="authorities"/>
<sec:authentication property="principal" var="principal"/>



<c:choose>
	<c:when test="${empty list || fn:length(list) == 0 }">
		<script>
			alert("해당 정보가 삭제되거나 없습니다");
			history.back();
		</script>
	</c:when>

	<c:otherwise>
		<c:set var="dto" value="${list[0] }"/>
	</c:otherwise>
</c:choose>

<!DOCTYPE html>
<html lang="ko">

<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/notice.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/locationView.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/ckeditor/contents.css" />

<script src="${pageContext.request.contextPath}/resources/js/common.js" defer></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=8d916d2023f8da17e354c4592559d114" ></script>
    <meta charset="utf-8">
<title>추천 여행지 세부</title>

    
<script>
function chkDelete(){
	var answer = confirm("삭제하시겠습니까?");
	if(answer){
		document.forms['frmDelete'].submit();
	}
}
</script>
</head>

<body>
<div id="wrap">
        <header>
            <div class="header_area box_inner clear">
                <h1><a href="/">Seoul Traveler</a></h1>
                <div class="header_cont">
                    <ul class="util clear">
                    	<sec:authorize access="isAnonymous()">
	                        <li><a href="${pageContext.request.contextPath }/login">로그인</a></li>
	                        <li><a href="${pageContext.request.contextPath }/register">회원가입</a></li>
                    	</sec:authorize>
                    	<sec:authorize access="isAuthenticated()">
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
                                <a href="${pageContext.request.contextPath }/location/list" class="openAll">추천 여행지</a>
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
        <h2>추천 여행지</h2>
        </div>
          <form name="frmDelete" action="deleteOk" method="POST">
          <input type="hidden" name="uid" value="${dto.uid }">
          </form>
        <div class="contents_read">
            <div class="subject">
                <div class="subject_ti"></div>
                <div id="subject"><h3><b>제목 : ${dto.subject }</b></h3></div>
                <div id="username">by ${dto.username }</div>
                <div id="regDate">${dto.regDate }</div>
            </div>
            	<div class="mapWrap">	
		            <div id="locationInfo">
		            	<div id="locationName"><h3><b>${dto.locationName }</b></h3></div>
		            	<div id="locationAddr">${dto.locationAddr }</div>
		            </div>
					<div id="map"></div>
				</div>
            <div class="content">
                <div class="content_ti"></div>
                <div id="content">${dto.content }</div>
            </div>
			<div class="viewCntArea">
				조회수: ${dto.viewCnt }
			</div>
            <div class="button">
	            <a class="butt" onclick="backToList()">목록</a>
	            <script>
	            	function backToList(){
	            		var prevUrl = document.referrer;
	            		if(prevUrl.includes("/list"))
	            			window.location.href=prevUrl;
	            		else
	            			window.location.href="/location/list";	            			
	            	}
	            </script>
	            <sec:authorize access="isAuthenticated()">
		        	<sec:authorize access="hasRole('ADMIN')">
		        		<c:if test="${principal.username eq dto.username }">
				            <a class="butt" href="update?uid=${dto.uid }">수정</a>
				            <a class="butt" onclick="chkDelete()">삭제</a>
		        		</c:if>
			            <a class="butt" href="write">작성</a>
		        	</sec:authorize>
		        </sec:authorize>	                
            </div>
        </div>
</div>
</body>
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
geocoder.addressSearch($("#locationAddr").text(), function(result, status) {

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




















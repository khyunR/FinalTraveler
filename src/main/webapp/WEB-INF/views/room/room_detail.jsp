<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko-KR">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="./style_roomdetail.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
    <title>room</title>
</head>

<body>
    <div id="wrap">
    	<header>
            <div class="header_area box_inner clear">
                <h1><a href="">Seoul Traveler</a></h1>
                <div class="header_cont">
                    <ul class="util clear">
                        <li><a href="">로그인</a></li>
                        <li><a href="">회원가입</a></li>
                    </ul>
                    <nav>
                        <ul class="gnb clear">
                            <li>
                                <a href="#" class="openAll">추천 여행지</a>
                            </li>
                            <li>
                                <a href="" class="openAll">숙소 예약</a>
                            </li>
                            <li>
                                <a href="#" class="openAll">공지사항</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </header>
        
        <div class="room_name">페어필드 바이 메리어트 서울</div>
        <div class="room_pic">
        	<a href="#">
        	<img src="${pageContext.request.contextPath}/resources/images/hotel1.jpg" alt="페어필드 바이 메리어트 서울" class="img_topplace">
        </div>
        <div class="room_choose">
            <p>price</p>
            <input name="birth" type="date" class="room_date" placeholder="날짜"/></br>
            <button type="submit" class="room_res">예약</button>
        </div>
        <div class="room_pics">
            <img src="${pageContext.request.contextPath}/resources/images/hotel1-1.jpg" alt="페어필드 바이 메리어트 서울" class="img_topplace">
        	<img src="${pageContext.request.contextPath}/resources/images/hotel1-2.jpg" alt="페어필드 바이 메리어트 서울" class="img_topplace">
        </div>
        <div class="room_info">
            <p>페어필드 바이 메리어트는 1호선 영등포역 3번 출구에서 도보 약 5분 거리에 있으며, 
여의도 한강공원까지 차로 약 10분, 영등포 타임스퀘어까지 도보 5분, 문래창작촌까지 도보로 약 20분 거리에 위치해 있습니다. 
호텔에는 피트니스 센터, 비즈니스 센터 등의 부대시설이 갖춰져 있습니다. 총 556개의 객실 내에는 에어컨, TV, 냉장고, 다리미 및 다리미판, 
커피/티 메이커, 욕실 어메니티 등이 구비되어 있습니다.</p>
        </div>

        <div>지도 api</div>

        <div class="room_review">
            <p>후기</p>
            <div class="user_review">
                이용고객이름
                작성시간
                좋아요
                숙소 후기 설명글
            </div>
        </div>
    </div>
</body>
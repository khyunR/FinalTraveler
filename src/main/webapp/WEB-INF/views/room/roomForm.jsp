<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소</title>
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
        
        <div id="room_all">
            <div id="room_img">
            	<img src="${pageContext.request.contextPath}/resources/images/hotel1.jpg" alt="페어필드 바이 메리어트 서울" class="img_topplace">
            </div>
            <div id="room_name">
            	<h2>페어핑드 바이 메리어트 서울</h2>
            </div>
        </div>
        <div id="room_all">
            <div id="room_img">
            	<img src="${pageContext.request.contextPath}/resources/images/hotel2.jpg" alt="파스파라 서울" class="img_topplace">
            </div>
            <div id="room_name">
            	<h2>파스파라 서울</h2>
            </div>
        </div>
        <div id="room_all">
            <div id="room_img">
            	<img src="${pageContext.request.contextPath}/resources/images/hotel3.jpg" alt="글래드 강남 코엑스 센터" class="img_topplace">
            </div>
            <div id="room_name">
            	<h2>글래드 강남 코엑스 센터</h2>
            </div>
        </div>
        <div id="room_all">
            <div id="room_img">
            	<img src="${pageContext.request.contextPath}/resources/images/hotel4.jpg" alt="글래드 여의도" class="img_topplace">
            </div>
            <div id="room_name">
            	<h2>글래드 여의도</h2>
            </div>
        </div>
	</div>   
</body>
</html>
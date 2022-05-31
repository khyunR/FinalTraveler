<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko-KR">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/roomdetail.css" />
<script type="text/javascript" src="e6f400fd66b45b896ffa06450e898046"></script> 
<title>room</title>
</head>

    
<div id="wrap">

    <div class="room_name">페어필드 바이 메리어트 서울</div>
    <div class="room_pic">
        <img src="img/hotel1.jpg" alt="페어필드 바이 메리어트 서울">
    </div>
    <div class="room_choose">
        <p>price</p>
        <input name="birth" type="date" class="room_date" placeholder="날짜"/>
        <button type="submit" class="room_res">예약</button>
    </div>
    <div class="room_pics">
        <img src="img/hotel1-1.jpg" alt="페어필드 바이 메리어트 서울">
        <img src="img/hotel1-2.jpg" alt="페어필드 바이 메리어트 서울">
    </div>
    <div class="room_info">
    <p>페어필드 바이 메리어트는 1호선 영등포역 3번 출구에서 도보 약 5분 거리에 있으며, 
    여의도 한강공원까지 차로 약 10분, 영등포 타임스퀘어까지 도보 5분, 문래창작촌까지 도보로 약 20분 거리에 위치해 있습니다. 
    호텔에는 피트니스 센터, 비즈니스 센터 등의 부대시설이 갖춰져 있습니다. 총 556개의 객실 내에는 에어컨, TV, 냉장고, 다리미 및 다리미판, 
    커피/티 메이커, 욕실 어메니티 등이 구비되어 있습니다.</p>
    </div>
    
    <div class="room_map">지도 api</div>
    
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
	
	<div>
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


    
   
</div>
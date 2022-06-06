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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/room.css" />
<meta charset="UTF-8">
<title>숙소</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index.css" />
<script src="${pageContext.request.contextPath}/resources/js/common.js" defer></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

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
    
        <div id="room_all">
            <div class="room_img">
            	<a href="${pageContext.request.contextPath}/room/roomDetail">
            	<img class="img" src="${pageContext.request.contextPath}/images/hotel1.jpg" alt="페어필드 바이 메리어트 서울">
            	</a>
            </div>    
            <div id="room_name">
                <h2><a href="${pageContext.request.contextPath}/room/roomDetail"></a>페어필드 바이 메리어트 서울</h2>
                <p>4성급 ＊ 영등포구 경인로 870</p>
            </div>
        </div>
        <div id="room_all">
            <div class="room_img">
            	<a href="#"></a><img src="${pageContext.request.contextPath}/images/hotel2.jpg" alt="파스파라 서울">
            </div>
            <div id="room_name">
            	<a href="#"></a><h2>파라스파라 서울</h2>
                <p>5성급 ＊ 강북구 삼양로 689</p>
            </div>
        </div>
        <div id="room_all">
            <div class="room_img">
            	<a href="#"></a><img src="${pageContext.request.contextPath}/images/hotel3.jpg" alt="글래드 강남 코엑스 센터">
            </div>
            <div id="room_name">
            	<a href="#"></a><h2>글래드 강남 코엑스 센터</h2>
                <p>3성급 ＊ 강남구 테헤란로 610</p>
            </div>
        </div>
        <div id="room_all">
            <div class="room_img">
            	<a href="#"></a><img src="${pageContext.request.contextPath}/images/hotel4.jpg" alt="글래드 여의도">
            </div>
            <div id="room_name">
            	<a href="#"></a><h2>글래드 여의도</h2>
                <p>4성급 ＊ 영등포구 의사당대로 16</p>
            </div>
        </div>
        
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
</html>
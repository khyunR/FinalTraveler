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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/travelList.css" />
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

        <div id="container">
            <div class="main_rolling_pc">
                <div class="visualRoll">
                <img src="${pageContext.request.contextPath}/resources/images/img_slidecontents01.jpg">
                     <div class="roll_content">
                           <a href="#"></a><p class="roll_txtline">서울의 궁궐 문화재</p>
                      </div>
                </div>
            </div>
            <div id="locationWrap">
                    <div id="subDepth">
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/travel/culture/cultureList" class="on">문화재</a></li>
                                <li><a href="${pageContext.request.contextPath}/travel/park/parkList" >자연&공원</a></li>
                                <li><a href="${pageContext.request.contextPath}/travel/museum/museumList" >박물관&미술관</a></li>
                                <li><a href="${pageContext.request.contextPath}/travel/attraction/attractionList" >명소</a></li>
                            </ul>
                        </div>
            </div>

            <div class="about_area">
                <div class="about_box">
                    <ul class="place_list box_inner clear">
                        <li class="place_list_img">
                            <a href="${pageContext.request.contextPath}/travel/culture/gyeongbokgung">
                                <img src="${pageContext.request.contextPath}/resources/images/travel/culture/gyeongbokgung_1.jpg" alt="경복궁" class="img_topplace">
                                <h3>경복궁</h3>
                                <p class="txt">
                                    
                                </p>
                            </a>
                        </li>
                        <li class="place_list_img">
                            <a href="${pageContext.request.contextPath}/travel/culture/changdeokgung">
                                <img src="${pageContext.request.contextPath}/resources/images/travel/culture/changdeokgung_1.jpg" alt="창덕궁" class="img_topplace">
                                <h3>창덕궁</h3>
                                <p class="txt">
                                    
                                </p>
                            </a>
                        </li>
                        <li class="place_list_img">
                            <a href="${pageContext.request.contextPath}/travel/culture/jongmyoShrine">
                                <img src="${pageContext.request.contextPath}/resources/images/travel/culture/jongmyoShrine_1.jpg" alt="종묘" class="img_topplace">
                                <h3>종묘</h3>
                                <p class="txt">
                                    
                                </p>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="about_area">
                <div class="about_box">
                    <ul class="place_list box_inner clear">
                        <li class="place_list_img">
                            <a href="${pageContext.request.contextPath}/travel/culture/deoksugung">
                                <img src="${pageContext.request.contextPath}/resources/images/travel/culture/deoksugung_3.png" alt="덕수궁" class="img_topplace">
                                <h3>덕수궁</h3>
                                <p class="txt">
                                    
                                </p>
                            </a>
                        </li>
                        <li class="place_list_img">
                            <a href="${pageContext.request.contextPath}/travel/culture/changgyeonggung">
                                <img src="${pageContext.request.contextPath}/resources/images/travel/culture/changgyeonggung_1.jpg" alt="창경궁" class="img_topplace">
                                <h3>창경궁</h3>
                                <p class="txt">
                                    
                                </p>
                            </a>
                        </li>
                        <li class="place_list_img">
                            <a href="${pageContext.request.contextPath}/travel/culture/gyeonghuigung">
                                <img src="${pageContext.request.contextPath}/resources/images/travel/culture/gyeonghuigung_3.jpg" alt="경희궁" class="img_topplace">
                                <h3>경희궁</h3>
                                <p class="txt">
                                    
                                </p>
                            </a>
                        </li>
                    </ul>
                </div>
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
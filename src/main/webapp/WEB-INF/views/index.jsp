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
                    <ul class="viewImgList">
                        <li>
                            <a href="${pageContext.request.contextPath}/travel/culture/cultureList">
                            	<img src="${pageContext.request.contextPath}/resources/images/img_slidecontents01.jpg" alt=""></a>
                             <a href="${pageContext.request.contextPath}/travel/culture/cultureList"><p class="roll_txtline">서울의 궁궐 문화재</p></a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/travel/park/parkList">
                            <img src="${pageContext.request.contextPath}/resources/images/img_slidecontents02.jpg" alt=""></a>
                            <a href="${pageContext.request.contextPath}/travel/park/parkList"><p class="roll_txtline">서울의 자연 속 공원들</p></a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/travel/museum/museumList">
                            <img src="${pageContext.request.contextPath}/resources/images/travel/museum/nationalMuseum_1.jpg" alt=""></a>
                            <a href="${pageContext.request.contextPath}/travel/museum/museumList"><p class="roll_txtline">서울의 미술관&박물관</p></a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/travel/attraction/attractionList">
                            <img src="${pageContext.request.contextPath}/resources/images/img_slidecontents03.jpg" alt=""></a>
                             <a href="${pageContext.request.contextPath}/travel/attraction/attractionList"><p class="roll_txtline">서울의 명소</p></a>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="about_area">
                <h2> 서울 인기 여행지 </h2>
                <div class="about_box">
                    <ul class="place_list box_inner clear">
                        <li class="place_list_img">
                            <a href="${pageContext.request.contextPath}/travel/attraction/namsanTower">
                                <img src="${pageContext.request.contextPath}/resources/images/travel/attraction/namsan_tower.jpg" alt="남산 타워" class="img_topplace">
                                <h3>남산 타워</h3>
                                <p class="txt">
                                    
                                </p>
                            </a>
                        </li>
                        <li class="place_list_img">
                            <a href="${pageContext.request.contextPath}/travel/culture/gyeongbokgung">
                                <img src="${pageContext.request.contextPath}/resources/images/travel/culture/gyeongbokgung_2.jpg" alt="경복궁" class="img_topplace">
                                <h3>경복궁</h3>
                                <p class="txt">
                                    
                                </p>
                            </a>
                        </li>
                        <li class="place_list_img">
                            <a href="${pageContext.request.contextPath}/travel/museum/nationalMuseum">
                                <img src="${pageContext.request.contextPath}/resources/images/travel/museum/nationalMuseum_1.jpg" alt="국립중앙박물관" class="img_topplace">
                                <h3>국립중앙박물관</h3>
                                <p class="txt">
                                    
                                </p>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
               <div class="about_area">
                <h2> 추천 여행지 </h2>
                <div class="about_box">
                    <ul class="place_list box_inner clear">
                        <li class="recommend_place_list_img">
                            <a href="${pageContext.request.contextPath}/location/view?uid=${uidList[0]}">
                                <img src="${imgSrcList[0] }" alt="${locationNameList[0] }" class="img_topplace">
                                <h3>${locationNameList[0] }</h3>
                            </a>
                        </li>
                        <li class="recommend_place_list_img">
                            <a href="${pageContext.request.contextPath}/location/view?uid=${uidList[1]}">
                                <img src="${imgSrcList[1] }" alt="${locationNameList[1] }" class="img_topplace">
                                <h3>${locationNameList[1] }</h3>
                            </a>
                        </li>
                        <li class="recommend_place_list_img">
                            <a href="${pageContext.request.contextPath}/location/view?uid=${uidList[2]}">
                                <img src="${imgSrcList[2] }" alt="${locationNameList[2] }" class="img_topplace">
                                <h3>${locationNameList[2] }</h3>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index.css" />
<script src="${pageContext.request.contextPath}/resources/js/common.js" defer></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seoul Traveler</title>
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
                        <li class="imgList0">
                            <div class="roll_content">
                                <a href="#"></a><p class="roll_txtline">SEOUL TRAVELER</p>
                            </div>
                        </li>
                        <li class="imgList1">
                            <div class="roll_content">
                                <a href="#"></a><p class="roll_txtline">SEOUL TRAVELER</p>
                            </div>
                        </li>
                        <li class="imgList2">
                            <div class="roll_content">
                                <a href="#"></a><p class="roll_txtline">SEOUL TRAVELER</p>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="about_area">
                <h2> 서울 인기 여행지 </h2>
                <div class="about_box">
                    <ul class="place_list box_inner clear">
                        <li class="place_list_img">
                            <a href="${pageContext.request.contextPath}/travel/namsanTower">
                                <img src="${pageContext.request.contextPath}/resources/images/namsan_tower.jpg" alt="남산 타워" class="img_topplace">
                                <h3>남산 타워</h3>
                                <p class="txt">
                                    
                                </p>
                            </a>
                        </li>
                        <li class="place_list_img">
                            <a href="${pageContext.request.contextPath}/travel/olympicPark">
                                <img src="${pageContext.request.contextPath}/resources/images/olympic_park.jpg" alt="올림픽 공원" class="img_topplace">
                                <h3>올림픽 공원</h3>
                                <p class="txt">
                                    
                                </p>
                            </a>
                        </li>
                        <li class="place_list_img">
                            <a href="${pageContext.request.contextPath}/travel/seoulForest">
                                <img src="${pageContext.request.contextPath}/resources/images/seoul_forest.jpg" alt="서울숲" class="img_topplace">
                                <h3>서울숲</h3>
                                <p class="txt">
                                    
                                </p>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
               <div class="about_area">
                <h2> 서울 인기 여행지 </h2>
                <div class="about_box">
                    <ul class="place_list box_inner clear">
                        <li class="place_list_img">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/resources/images/namsan_tower.jpg" alt="남산 타워" class="img_topplace">
                                <h3>남산 타워</h3>
                                <p class="txt">
                                    
                                </p>
                            </a>
                        </li>
                        <li class="place_list_img">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/resources/images/olympic_park.jpg" alt="올림픽 공원" class="img_topplace">
                                <h3>올림픽 공원</h3>
                                <p class="txt">
                                    
                                </p>
                            </a>
                        </li>
                        <li class="place_list_img">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/resources/images/seoul_forest.jpg" alt="서울숲" class="img_topplace">
                                <h3>서울숲</h3>
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
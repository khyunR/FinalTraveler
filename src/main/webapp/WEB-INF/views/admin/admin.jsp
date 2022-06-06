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
<title>admin main</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/notice.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/authority.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js" defer></script>

</head>
<body>
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
        <main>
      		<div class="notice_list">
				<h2><br>관리자 페이지<br></h2><br>
				<a class="btn btn-primary text-white" href="${pageContext.request.contextPath}/admin/authority">회원 권한 추가/삭제</a>&nbsp
				<a class="btn btn-primary text-white" href="${pageContext.request.contextPath}/notice/list">공지사항 게시판</a>&nbsp
				<a class="btn btn-primary text-white" href="${pageContext.request.contextPath}/location/list">추천 여행지 게시판</a>&nbsp
		
			    <div class="line_chart_containter" style="width:480;">
			        <canvas id="line-chart" width="600" height="150"></canvas>
			    </div>
      		</div>
      	</main>
    <c:set var="prevMonthsName" value="${prevMonthsName }"/>
    <c:set var="prevMonthsCnt" value="${prevMonthsCnt }"/>
<script>
new Chart(document.getElementById("line-chart"), {
	  type: 'line',
	  data: {
	    labels: ${prevMonthsName},
	    datasets: [{ 
	        data: ${prevMonthsCnt},
	        label: "신규 가입자",
	        borderColor: "#3e95cd",
	        fill: false
	      }
	    ]
	  },
	  options: {
	    title: {
	      display: true,
	      text: '월간 가입자 수 '
	    }
	  }
	});
</script>
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
</html>
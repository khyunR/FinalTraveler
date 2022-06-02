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
<title>회원 권한 관리</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/notice.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/authority.css" />
<script src="${pageContext.request.contextPath}/resources/js/common.js" defer></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">


<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css" />
<script>

function addAuth(hrefVal){
	var answer = confirm("관리자 권한을 추가하시겠습니까?");
	if(answer){
		location.href = hrefVal;
	}
}
function removeAuth(hrefVal){
	var answer = confirm("관리자 권한을 제거하시겠습니까?");
	if(answer){
		location.href = hrefVal;
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
        <br><br><br><br><br><br><br>
    <main>
	<h2>회원 권한</h2>
	<div class="table-wrap">
		<div class="notice_list">
		<table class="table">
			<tr><th>아이디</th><th>일반회원</th><th>관리자</th><th></th></tr>
			<c:forEach var="dto" items="${ list }">
	            <tr>
					<td>${dto.username }</td>
					<td>${dto.isMember }</td>
					<td>${dto.isAdmin }</td>
					<td>
						<c:choose>
							<c:when test="${dto.isAdmin eq 'Yes'}">
								<button class="btn" onclick="removeAuth('${pageContext.request.contextPath}/admin/removeAdminAuth?username=${dto.username}')">관리자 권한 삭제</button>
							</c:when>
							<c:otherwise>
								<button class="btn" onclick="addAuth('${pageContext.request.contextPath}/admin/addAdminAuth?username=${dto.username}')">관리자 권한 추가</button>
							</c:otherwise>
						</c:choose>
					</td>
	            </tr>
          	</c:forEach>
		</table>
		</div>
	</div>
</main>
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
</body>
</html>
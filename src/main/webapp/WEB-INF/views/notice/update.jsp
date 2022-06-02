<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<sec:authentication property="name" var="username"/>
<sec:authentication property="authorities" var="authorities"/>
<sec:authentication property="principal" var="principal"/>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/notice.css" />
<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js" defer></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

    
<c:choose>
	<c:when test="${empty list || fn:length(list) == 0 }">
		<script>
			alert("해당 정보가 삭제되거나 없습니다");
			history.back();
		</script>
	</c:when>
	
	<c:otherwise>
		<c:set var="dto" value="${list[0] }"/>


<!DOCTYPE html>
<html lang="ko">

<head>
<title>공지사항 수정</title>
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

</head>

<body>
        <div class="title">
        <h2>공지사항 수정</h2>
        </div>
        <div class="contents_update">
        <form name="frm" action="updateOk" method="post">
        <input type="hidden" name="uid" value="${dto.uid }"/>  
            <div class="subject">
                <input type="text" id="subject" placeholder="제목을 입력하세요" name="subject" value="${dto.subject }" required>
            </div>
            <div class="content">
                <textarea id="content" placeholder="내용을 입력하세요" name="content">${dto.content }</textarea>
                <Script>
					var ckeditor_config = {
						resize_enaleb : false,
						enterMode : CKEDITOR.ENTER_BR,
						shiftEnterMode : CKEDITOR.ENTER_P,
						filebrowserUploadUrl : "/admin/notice/ckUpload"
					};
					CKEDITOR.replace("content", ckeditor_config);
				</Script>
            </div>
			<div class="button">
            <button type="submit" class="butt">수정완료</button>
            <button type="button" class="butt" onclick="history.back()">이전으로</button>
            <a class="butt" href="list">목록</a>
            </div>
        </form>
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
</html>

	</c:otherwise>
</c:choose>
































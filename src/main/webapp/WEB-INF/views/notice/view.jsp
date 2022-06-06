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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/ckeditor/contents.css" />

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
    <meta charset="utf-8">
<title>공지사항 세부</title>

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

<script>
function chkDelete(){
	var answer = confirm("삭제하시겠습니까?");
	if(answer){
		document.forms['frmDelete'].submit();
	}
}
</script>

<body>
        <div class="title">
        <h2>공지사항</h2>
        </div>
          <form name="frmDelete" action="deleteOk" method="POST">
          <input type="hidden" name="uid" value="${dto.uid }">
          </form>
        <div class="contents_read">
            <div class="subject">
                <div class="subject_ti"></div>
                <div id="subject">제목 : ${dto.subject }</div>
                <div id="regDate">${dto.regDate }</div>
            </div>
            <div class="content">
                <div class="content_ti"></div>
                <div id="content">${dto.content }</div>
            </div>

            <div class="button">
	            <a class="butt" onclick="backToList()">목록</a>
	           	<script>
	            	function backToList(){
	            		var prevUrl = document.referrer;
	            		if(prevUrl.includes("/notice/list"))
	            			window.location.href=prevUrl;
	            		else
	            			window.location.href="/notice/list";	            			
	            	}
	            </script>
	            <sec:authorize access="isAuthenticated()">
		        	<sec:authorize access="hasRole('ADMIN')">
		        		<c:if test="${principal.username eq dto.username }">
				            <a class="butt" href="update?uid=${dto.uid }">수정</a>
				            <a class="butt" onclick="chkDelete()">삭제</a>
		        		</c:if>
			            <a class="butt" href="write">작성</a>
		        	</sec:authorize>
		        </sec:authorize>	                    
            </div>
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



















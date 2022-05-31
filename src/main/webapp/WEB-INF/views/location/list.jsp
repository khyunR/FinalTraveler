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
<script src="${pageContext.request.contextPath}/resources/js/common.js" defer></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
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
                                <a href="#" class="openAll">추천 여행지</a>
                            </li>
                            <li>
                                <a href="" class="openAll">숙소 예약</a>
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
        <table id="table_menu">
          <thead class="title">
            <tr>
              <th style="height:40px;">No</th>
              <th style="height:40px;">제목</th>
              <th style="height:40px;">작성자</th>
              <th style="height:40px;">작성일</th>
            </tr>
          </thead>
          <tbody>
          	<c:forEach var="dto" items="${ list }">
	            <tr>
                    <td>${dto.uid }</td>
                    <td><a href="view?uid=${dto.uid }">${dto.subject }</a></td>
                    <td>${dto.username }</td>
                    <td>${dto.regDate }</td>
	            </tr>
          	</c:forEach>
          </tbody>
        </table>
        </div>
      </main>


        <div id="">
          <ul class="pagination justify-content-center">
          	<c:if test="${ page > 1 }">
            	<li class="page-item">
	              <a href="${ url }?page=1" class="page-link text-dark" title="처음">&laquo;</a>
	            </li>
          	</c:if>
          	
          	<c:if test="${ startPage > 1 }">
          		<li class="page-item">
          			<a href="${ url }?page=${ startPage - 1 }" class="page-link text-dark">&lt;</a>
          		</li>
          	</c:if>
          	
          	<c:if test="${ totalPage > 1 }">
          		<c:forEach var="k" begin="${ startPage }" end="${ endPage }">
          			<c:choose>
          				<c:when test="${ k != page }">
				            <li class="page-item">
				              <a href="${ url }?page=${ k }" class="page-link text-dark">${ k }</a>
				            </li>
          				</c:when>
          				<c:otherwise>
				            <li class="page-item active">
				              <a href="javascript:void(0);" class="page-link text-dark">${k }</a>
				            </li>
          				</c:otherwise>
          			</c:choose>
          		</c:forEach>
          	</c:if>
          	
          	<c:if test="${ totalPage > endPage }">
          		<li class="page-item">
          			<a href="${ url }?page=${ endPage + 1 }" class="page-link text-dark">&gt;</a>
          		</li>
          	</c:if>
          	
          	<c:if test="${ page < totalPage }">
	            <li class="page-item">
	              <a href="${ url }?page=${ totalPage }" class="page-link text-dark">&raquo;</a>
	            </li>
          	</c:if>
          </ul>
        </div>
 		<div class="contents_read">
	        <div class="button">
			    <sec:authorize access="isAuthenticated()">
					<sec:authorize access="hasRole('ADMIN')">
						<a class="butt" href="write">작성</a>
					</sec:authorize>
				</sec:authorize>	                    
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

    

</body>
</html> 
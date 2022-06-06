<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<sec:authentication property="name" var="username"/>
<sec:authentication property="authorities" var="authorities"/>
<sec:authentication property="principal" var="principal"/>

    
<c:if test="${empty list || fn:length(list) == 0 }">
		<script>
			alert("해당 정보가 삭제되거나 없습니다");
			history.back();
		</script>
</c:if>


<!DOCTYPE html>
<html lang="ko">

<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/notice.css" />
<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js" defer></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<title>추천 여행지 수정</title>
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
        <h2>추천 여행지 수정</h2>
        </div>
        <div class="contents_update">
        <form name="frm" action="updateOk" method="post">
        <input type="hidden" name="uid" value="${list[0].uid }"/>  
            <div class="subject">
                <input type="text" id="subject" placeholder="제목을 입력하세요" name="subject" value="${list[0].subject }" required>
            </div>
            				
			<br>
			<div class="locationType">
				카테고리 선택:&nbsp&nbsp
				<select name="category" required>
					<option hidden></option>
					<option value="culture" <c:if test="${list[0].category eq 'culture' }"> selected=true </c:if>>문화재</option>
					<option value="park" <c:if test="${list[0].category eq 'park' }"> selected=true </c:if>>자연 & 공원</option>
					<option value="museum" <c:if test="${list[0].category eq 'museum' }"> selected=true </c:if>>박물관 & 미술관</option>
					<option value="attraction" <c:if test="${list[0].category eq 'attraction' }"> selected=true </c:if>>명소</option>						
				</select>
			</div>
			<br>
           				
			<div class="locationName">
				<input type="text" class="form-control" id="locationName" placeholder="여행지 이름을 입력하세요" name="locationName" value="${list[0].locationName }" required>
			</div>
			
			<div class="locationAddr">
				<input type="text" class="form-control" id="locationAddr" placeholder="여행지 주소를 입력하세요" name="locationAddr" value="${list[0].locationAddr }" required>
			</div>
			<div class="phoneNum">
				<input type="text" class="form-control" id="phoneNum" placeholder="전화번호를 입력하세요" name="phoneNo" value="${list[0].phoneNo }" >
			</div>
			<div class="homepage">
				<input type="text" class="form-control" id="homepage" placeholder="홈페이지 주소를 입력하세요" name="homepage" value="${list[0].homepage }" >
			</div>
			<div class="businessHour">
				<input type="text" class="form-control" id="businessHour" placeholder="운영시간을 입력하세요" name="businessHour" value="${list[0].businessHour }">
			</div>
			<div class="fee">
				<input type="text" class="form-control" id="fee" placeholder="입장료를 입력하세요" name="fee" value="${list[0].fee }" >
			</div>
			<br>
				
            <div class="content">
            	이미지를 뺀 본문 글 필히  &lt;div id=&quot;detail&quot;&gt;&lt;/div&gt;로 감싸주세요.
                <textarea id="content" placeholder="내용을 입력하세요" name="content">${list[0].content }</textarea>
                <Script>
					var ckeditor_config = {
						resize_enaleb : false,
						enterMode : CKEDITOR.ENTER_BR,
						shiftEnterMode : CKEDITOR.ENTER_P,
						filebrowserUploadUrl : "/admin/location/ckUpload"
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
































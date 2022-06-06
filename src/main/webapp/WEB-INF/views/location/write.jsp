<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<sec:authentication property="name" var="username"/>
<sec:authentication property="authorities" var="authorities"/>
<sec:authentication property="principal" var="principal"/>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천 여행지 작성</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/notice.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/write.css" />

<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js" defer></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
</head>

<body>
	<div id="wrap">
		<header>
			<div class="header_area box_inner clear">
				<h1>
					<a href="${pageContext.request.contextPath}/main">Seoul Traveler</a>
				</h1>
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
								<li><a
									href="${pageContext.request.contextPath }/user/mypage">마이페이지</a></li>
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

		<div class="title">
			<h2>추천 여행지 작성</h2>
		</div>
		<div class="contents">
			<form name="frm" action="writeOk" method="POST">
				<div class="subject">
					<div class="subject_ti"></div>
					<input type="text" class="form-control" id="subject" placeholder="제목을 입력하세요" name="subject" required>
				</div>
				
				<br>
				<div class="locationType">
					카테고리 선택:&nbsp&nbsp
					<select name="category" required>
						<option hidden></option>
						<option value="culture">문화재</option>
						<option value="park">자연 & 공원</option>
						<option value="museum">박물관 & 미술관</option>
						<option value="attraction">명소</option>						
					</select>
				</div>
				<br>
				<div class="locationName">
					<input type="text" class="form-control" id="locationName" placeholder="여행지 이름을 입력하세요" name="locationName" required><span style="color:red;"><strong> *</strong></span>
				</div>
				
				<div class="locationAddr">
					<input type="text" class="form-control" id="locationAddr" placeholder="여행지 주소를 입력하세요" name="locationAddr" required><span style="color:red;"><strong> *</strong></span>
				</div>
				<div class="phoneNum">
					<input type="text" class="form-control" id="phoneNum" placeholder="전화번호를 입력하세요" name="phoneNo" >
				</div>
				<div class="homepage">
					<input type="text" class="form-control" id="homepage" placeholder="홈페이지 주소를 입력하세요" name="homepage" >
				</div>
				<div class="businessHour">
					<input type="text" class="form-control" id="businessHour" placeholder="운영시간을 입력하세요" name="businessHour" >
				</div>
				<div class="fee">
					<input type="text" class="form-control" id="fee" placeholder="입장료를 입력하세요" name="fee" >
				</div>
				
				<div class="content">
					<div class="content_ti"></div>
					<br><p>꼭 이미지를 먼저 첨부 후 아래에 본문 글을 &lt;div id="detail"&gt; &lt;/div&gt;로 감싸서 작성하세요. </p> 
					<textarea class="form-control" rows="5" id="content" placeholder="내용을 입력하세요" name="content"></textarea>
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
					<button type="submit" class="write">작성완료</button>
					<button type="button" class="write" onclick="history.back();">취소</button>
				</div>
			</form>
		</div>
	</div>
	<br>
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
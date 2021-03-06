<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<sec:authentication property="principal" var="principal" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/notice.css" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/mypage.js"></script>
	<title>마이페이지</title>
	
</head>
<body>
	<div id="wrap">
        <header>
            <div class="header_area box_inner clear">
                <h1><a href="${pageContext.request.contextPath}/">Seoul Traveler</a></h1>
            </div>
        </header>  
        <div class="blank_under_header "><br><br><br><br><br><br><br><br></div>  
		<div class="memberInfoContainer container">
			<h5><strong>마이페이지</strong></h5>
			<br><br>
			<div class="basicInfoArea container">
				아이디: ${principal.username }<br><br>
				이름: ${principal.name }<br><br>
			</div>
			<button id="changePasswordBtn" class="btn" onclick="openChangePw()">비밀번호 변경</button>
			<div class="changePwFormArea container" <c:if test="${empty pwChangeFailed}"> hidden </c:if>>
				<b>현재 비밀번호와 변경할 비밀번호를 입력해주세요.</b><br><br>
				<form action="${pageContext.request.contextPath}/user/changePasswordOk" method="POST" id="changePwFrm" name="changePwFrm" class="form">
				  <div class="form-group">
					    <label for="currentPw">현재 비밀번호: </label><span class="text-danger">${pwIncorrect }</span>
					    <input type="password" class="form-control" id="currentPw" name="currentPw" placeholder=""><br>
				  </div>
				  <br>
				  <div class="form-group">
					    <label for="newPw">변경할 비밀번호:</label><span class="text-danger">${pwWrongPattern }</span>
					    <input type="password" class="form-control" id="newPw" name="newPw" placeholder=""><br>
					    <label for="newPwRe">비밀번호 재확인:</label>
					    <input type="password" class="form-control" id="newPwRe" name="newPwRe" placeholder="">
					    <span class="text-danger" id="pwNotMatching"></span><br>			    
				  </div>
				  <br>
				  <button type="submit" id="submitChangePwFrmBtn" class="btn btn-primary" disabled>변경</button>
				  <button type="button" class="btn btn-primary" onclick="closeChangePw()">취소</button>
				</form>		
			</div>
			<br><br>
			<div class="contactInfoArea container" <c:if test="${not empty contactChangeFailed}"> hidden </c:if>>
				이메일: ${principal.email }<br><br>
				휴대폰 번호: ${principal.mobile }<br><br>
			</div>
			<button id="changeContactBtn" class="btn" onclick="openChangeContact()">연락처 변경</button>
			<div class="changeContactFormArea container" <c:if test="${empty contactChangeFailed}"> hidden </c:if>>
				<form action="${pageContext.request.contextPath}/user/changeContactOk" method="POST" id="changecontactFrm" name="changecontactFrm" class="form">
				<label for="email">이메일: </label><span class="text-danger"><b> ${errEmail }</b></span><br>
					<input type="email" name="email" id="email" style="width:60%"
						<c:choose>
							<c:when test="${not empty inputEmail }"> value="${inputEmail }" </c:when>
							<c:otherwise> value="${principal.email }" </c:otherwise>
						</c:choose>
					required>
					<input type="button" id="sendVerificationCode" style="width:39%; min-height: 45px" value="인증번호 전송" onclick="sendCode()"><br><br>
					<input type="text" name="verificationCode" id="verificationCode" value="" style="width:60%" required>
					<input type="button" id="verifyEmail" style="width:39%; min-height: 45px" value="인증번호 확인" onclick="checkCode()" disabled><br><br>					
					<label for="mobile">휴대폰 번호('-' 제외) : </label><span class="text-danger"><b> ${errMobile }</b></span><br>
					<input type="text" name="mobile" id="mobile" class="form-control" 
						<c:choose>
							<c:when test="${not empty inputMobile }"> value="${inputMobile }" </c:when>
							<c:otherwise> value="${principal.mobile }" </c:otherwise>
						</c:choose>
					required><br><br>
					<button type="submit" id="submitChangeContactFrmBtn" class="btn btn-primary" disabled>변경</button>
				  	<button type="button" class="btn btn-primary" onclick="closeChangeContact()">취소</button>
				</form>
			</div>
			
			<div class="notice_list">
		        <table id="table_menu">
		          <thead class="title">
		            <tr>
		              <th style="width:40%; height:40px; text-align:center;">예약 숙소 이름</th>
		              <th style="width:40%; height:40px; text-align:center;">예약 날짜</th>
		              <th style="width:20%; height:40px; text-align:center;"> </th>
		            </tr>
		          </thead>
		          <tbody>
		          	<c:forEach var="dto" items="${ reservationList }">
			            <tr>
		                    <td>${dto.accommoName }</td>
		                    <td>${dto.resDate }</td>
		                    <td><button type="button" onclick="deleteChk(${dto.uid}, '${dto.accommoName}', '${dto.resDate}')">예약 취소</button></td>
			            </tr>
		          	</c:forEach>
		          </tbody>
		        </table>
	        </div>
			
		</div>
	
	</div>
	<br><br>
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
	<script>

	</script>
</html>
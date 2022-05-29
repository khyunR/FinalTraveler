<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/findPassword.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/findPassword.js" defer></script>
	
	<title>비밀번호 찾기</title>
</head>
<body>

	<div id="wrap">
        <header>
            <div class="header_area box_inner clear">
                <h1><a href="${pageContext.request.contextPath}/">Seoul Traveler</a></h1>
            </div>
        </header>  
        <div class="blank_under_header"><br><br><br><br><br><br><br><br></div>  
        <div class="login_form_container row">
        	<div class="col-md-3" style="float: none; margin:0 auto; width:60%;">
        		<h2><strong>비밀번호 찾기</strong></h2>
		       	<form method="POST" name="findPasswordFrm" id="findPasswordFrm" action="findPasswordOk">
					<label for="username">아이디: </label><br>
					<input type="text" name="username" id="username" class="form-control" required><br><br>
					<label for="email">이메일: </label><br>
					<input type="email" name="email" id="email" value="${w.email }" style="width:60%" required>
					<input type="button" id="sendVerificationCode" style="width:39%;" value="인증번호 전송" onclick="sendCode()"><br><br>
					<input type="text" name="verificationCode" id="verificationCode" value="" style="width:60%" required>
					<input type="button" id="verifyEmail" style="width:39%;" value="인증번호 확인" onclick="checkCode()" disabled><br><br>
					<span class="text-danger">${errorMessage }</span><br>

					<button type="submit" class="btn btn-outline-dark" id="submitFormBtn" disabled>찾기</button>
				</form><br><br><br>
				<a href="${pageContext.request.contextPath}/login">로그인</a> / <a href="${pageContext.request.contextPath}/register">회원가입</a> / <a href="${pageContext.request.contextPath}/findUsername">아이디 찾기</a><br><br><br>
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
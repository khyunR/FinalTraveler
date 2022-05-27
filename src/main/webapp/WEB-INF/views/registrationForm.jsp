<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/registrationForm.js"></script>

	<title>회원가입</title>
</head>
<body>
	<form method="POST" name="registration" id="registration" action="registerOk">
		<label for="username">아이디*: </label><span class="text-danger"><b> ${errUsername }</b></span><br>
		<input type="text" name="username" id="username" class="" value="${w.username }" required><br><br>
		<label for="password">비밀번호*: (문자, 숫자, 기호를 조합하여 8자 이상, 20자 이하)</label><br>
		<input type="password" name="password" id="password" class="" required><br>
		<label for="repassword">비밀번호 확인*: </label><span class="text-danger"><b> ${errPassword }</b></span><br>
		<input type="password" name="repassword" id="repassword" class="" required><br>
		<span class="text-danger" id="pwNotMatching"></span><br><br>
		<label for="nickname">별명 : </label><span class="text-danger"><b> ${errNickname }</b></span><br>
		<input type="text" name="nickname" id="nickname" class="" value="${w.nickname }" ><br><br>
		<label for="email">이메일*: </label><span class="text-danger"><b> ${errEmail }</b></span><br>
		<input type="email" name="email" id="email" class="" value="${w.email }" required><br><br>
		<label for="mobile">휴대폰 번호('-' 제외) : </label><span class="text-danger"><b> ${errMobile }</b></span><br>
		<input type="text" name="mobile" id="mobile" class="" value="${w.mobile }" ><br><br>
		<button type="submit" id="submitFormBtn" class="btn btn-outline-dark" disabled> 가입 </button>
	</form>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
	<title>로그인</title>
</head>
<body>

	<form method="POST" name="login" id="login" action="loginOk">
		<label for="username">아이디: </label><br>
		<input type="text" name="username" id="username" class="" required><br>
		<label for="password">비밀번호: </label><br>
		<input type="password" name="password" id="password" class="" required><br>
		<button type="submit" class="btn btn-outline-dark">로그인</button>
	</form>
	<a class="btn btn-outline-dark" href="/register">회원가입</a><br>
	<a href="#">아이디 찾기</a> / <a href="#">비밀번호 찾기</a>

</body>
</html>
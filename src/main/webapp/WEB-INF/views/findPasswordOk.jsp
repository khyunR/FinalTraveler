<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:choose>
	<c:when test="${result == 0}">
	<script>
		alert("비밀번호 재설정 실패");
		hostory.back();
	</script>
	</c:when>
	<c:otherwise>
	<script>
		alert("비밀번호가 재설정 되었습니다.\n 새로운 비밀번호는 이메일에서 확인하실 수 있습니다.");
		location.href = "/login";
	</script>
	</c:otherwise>
</c:choose>
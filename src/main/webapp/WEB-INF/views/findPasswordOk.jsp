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
		alert("임시 비밀번호가 설정되어 이메일로 전송되었습니다.");
		location.href = "/login";
	</script>
	</c:otherwise>
</c:choose>
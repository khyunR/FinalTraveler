<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<c:choose>
	<c:when test="${result == 0 }">
	<script>
		alert("권한 변경 실패");
		history.back();
	</script>	
	</c:when>
	<c:otherwise>
	<script>
		alert("권한 변경 성공");
		location.href = "authority";
	</script>
	</c:otherwise>	
</c:choose>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin main</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

</head>
<body>
<h2>관리자</h2>
<a href="${pageContext.request.contextPath}/notice/list">공지사항 게시판</a>
<a href="${pageContext.request.contextPath}/location/list">추천 여행지 게시판</a>
<a href="${pageContext.request.contextPath}/admin/authority">권한 추가/삭제</a>

    <div>
        <canvas id="line-chart" width="800" height="450"></canvas>
    </div>
    <c:set var="prevMonthsName" value="${prevMonthsName }"/>
    <c:set var="prevMonthsCnt" value="${prevMonthsCnt }"/>
<script>
new Chart(document.getElementById("line-chart"), {
	  type: 'line',
	  data: {
	    labels: ${prevMonthsName},
	    datasets: [{ 
	        data: ${prevMonthsCnt},
	        label: "신규 가입자",
	        borderColor: "#3e95cd",
	        fill: false
	      }, {
    	    data: [2, 3, 5, 6, 9, 12],
		    label: "회원 수",
		    borderColor: "#A851F5",
		    fill: false  
	      }
	    ]
	  },
	  options: {
	    title: {
	      display: true,
	      text: '월간 가입자 수 '
	    }
	  }
	});
</script>
</body>
</html>
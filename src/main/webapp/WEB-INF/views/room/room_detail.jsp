<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko-KR">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/roomdetail.css" />
    <script src="${pageContext.request.contextPath}/resources/js/common.js" defer></script>
    <script type="text/javascript" src="e6f400fd66b45b896ffa06450e898046"></script>
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
    <%-- Summernote 웹에디터--%>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    

    <title>room</title>
</head>

<script>
    $(document).ready(function(){
        $('#content').summernote({
            height: 300
        });
    });
    </script>
    
<div id="wrap">

    <div class="room_name">페어필드 바이 메리어트 서울</div>
    <div class="room_pic">
        <img src="img/hotel1.jpg" alt="페어필드 바이 메리어트 서울">
    </div>
    <div class="room_choose">
        <p>price</p>
        <input name="birth" type="date" class="room_date" placeholder="날짜"/>
        <button type="submit" class="room_res">예약</button>
    </div>
    <div class="room_pics">
        <img src="img/hotel1-1.jpg" alt="페어필드 바이 메리어트 서울">
        <img src="img/hotel1-2.jpg" alt="페어필드 바이 메리어트 서울">
    </div>
    <div class="room_info">
    <p>페어필드 바이 메리어트는 1호선 영등포역 3번 출구에서 도보 약 5분 거리에 있으며, 
    여의도 한강공원까지 차로 약 10분, 영등포 타임스퀘어까지 도보 5분, 문래창작촌까지 도보로 약 20분 거리에 위치해 있습니다. 
    호텔에는 피트니스 센터, 비즈니스 센터 등의 부대시설이 갖춰져 있습니다. 총 556개의 객실 내에는 에어컨, TV, 냉장고, 다리미 및 다리미판, 
    커피/티 메이커, 욕실 어메니티 등이 구비되어 있습니다.</p>
    </div>
    
    <div class="room_map">지도 api</div>
    
    <%-- 인증 헤더 --%>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <div class="container mt-3">
        <h2>작성</h2>
        <hr>
        <form action="writeOk.do" method="POST" enctype="Multipart/form-data">
            <div class="mb-3">
                <label for="name">작성자:</label>
                <span class="form-control">${PRINCIPAL.username } (${PRINCIPAL.name })</span>
            </div>
            <div class="mb-3 mt-3">
                <label for="subject">제목:</label>
                <input type="text" class="form-control" id="subject" placeholder="제목을 입력하세요" name="subject" required>
            </div>
            <div class="mb-3 mt-3">
                <label for="content">내용:</label>
                <textarea class="form-control" rows="5" id="content" placeholder="내용을 입력하세요" name="content"></textarea>
            </div>
            
            <!-- 첨부파일 -->
			<%-- 상단에 jQuery 추가하기--%>
			<div class="container mt-3 mb-3 border rounded">
				<div class="mb-3 mt-3">
					<label>첨부파일:</label>
					<div id="files">
					
					</div>
					<button type="button" id="btnAdd" class="btn btn-secondary">추가</button>
				</div>
			</div>
			
			<script>
			var i = 0;
			$("#btnAdd").click(function(){
				$("#files").append(
						  '<div class="input-group mb-2">'
                        +   '<input class="form-control col-xs-3" type="file" name="upfile' + i + '"/>'
                        +   '<button type="button" class="btn btn-outline-danger" onclick="$(this).parent().remove()">삭제</button>'
                        + '</div>');
				i++;
			});
			</script>			
			<!-- 첨부파일 -->

            <button type="submit" class="btn btn-outline-dark">작성완료</button>
            <a class="btn btn-outline-dark" href="list.do">목록</a>
        </form>

    </div>

</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<sec:authentication property="name" var="username"/>
<sec:authentication property="authorities" var="authorities"/>
<sec:authentication property="principal" var="principal"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입 동의</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index.css" />
<script src="${pageContext.request.contextPath}/resources/js/common.js" defer></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script>
function checkIfAgreed(){
	var mst = $('.membershipTerm:checked').val();
	var pit = $('.personalInfoTerm:checked').val();
	if(mst=="agree" && pit=="agree"){
		$("#sbmt").attr("disabled", false);
	}else{		
		$("#sbmt").attr("disabled", true);
	}
}
</script>
</head>

<body>
	<header>
	    <div class="header_area box_inner clear">
	        <h1><a href="${pageContext.request.contextPath}/main">Seoul Traveler</a></h1>
	        <div class="header_cont">
	            <ul class="util clear">
	            	<sec:authorize access="isAnonymous()">
	                 <li><a href="${pageContext.request.contextPath }/login">로그인</a></li>
	                 <li><a href="${pageContext.request.contextPath }/register">회원가입</a></li>
	            	</sec:authorize>
	            	<sec:authorize access="isAuthenticated()">
	             	<sec:authentication property="principal.username" var="username" />
	             	<sec:authentication property="principal.name" var="name" />
	            		<li class="welcome">환영합니다, <strong>${username }</strong>(${name }) 님! </li>
	             	<sec:authorize access="hasRole('ADMIN')">
	                  <li><a href="${pageContext.request.contextPath }/admin/">관리자</a></li>
	             	</sec:authorize>
	             	<sec:authorize access="hasRole('MEMBER')">
	                  <li><a href="${pageContext.request.contextPath }/user/mypage">마이페이지</a></li>
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
    <div id="wrap">

        <div id="container">
        	<div style="min-height:120px; width:100%;"></div>
            <div class="col-md-8 col-md-offset-2">
                <div class="visualRoll">
		            <h2> 회원 가입 </h2>
		            <form name="agreement" action="register" method="POST">
		            <div class="about_area">
		            	<br><br><br>
		                <h3> 회원 약관 </h3>
		                <div class="memberAgreement">
							<div class="agreementDetail" style="width:100%; height:300px; background-color:#e0e0e0; overflow:auto">
<br>제 1장 총칙
<br>제 2장 회원가입과 서비스이용
<br>제 3장 계약해지 및 서비스 이용제한
<br>제 4장 계약변경 등
<br>제 5장 정보의 제공
<br>제 6장 손해 배상
<br>제 1장 총칙
<br>제 1조 목적
<br>이 약관은 Seoul Traveler(이하 ”회사”라 한다) 제공하는 서비스인 https://seoultraveler.co.kr의 이용조건 및 절차에 관한 사항과 기타 필요한 사항을 규정함을 목적으로 합니다.
<br>
<br>제 2조 약관의 효력과 변경
<br>1. "회사"에서 운영하는 모든 회원서비스는 이 약관에 동의한 이용자들에게 무료로 제공되는 서비스 입니다. 이용자가 "동의합니다." 버튼을 누르면 이 약관에 동의하는 것으로 간주됩니다.
<br>2. 회원에 가입하여 서비스를 이용하고자 하는 희망자는 "회사"에서 요청하는 개인 신상정보를 제공해야 합니다.
<br>제 3조 약관 외 준칙
<br>이 약관에 명시되지 않은 사항이 관계법령에 규정되어 있을 경우는 그 규정에 따릅니다.
<br>
<br>제 2장 회원가입과 서비스 이용
<br>제 1조 이용 계약의 성립
<br>1. 약관은 이용자에게 공시함으로써 효력을 발생합니다.
<br>2. "회사"사정상 변경의 경우와 영업상 중요사유가 있을 때 약관을 변경할 수 있으며, 변경된 약관은 전항과 같은 방법으로 효력을 발생합니다.
<br>3. 등록정보 - ”회사”는 이용자 등록정보를 집단적인 형태로 사용할 수는 있지만 각 이용자 개인 정보는, 불법적이거나 기타 다른 불온한 문제를 일으킬 경우를 제외하고, 이용자의 동의 없이는 절대 공개하지 않습니다. 학원을 이용하여 타인에게 피해를 주거나 미풍양속을 해치는 행위를(즉 욕설, 비방성글, 인신공격성 발언, 사회적질서를 혼란시키는 유언비어등)한 이용자는 회원자격이 박탈되며, 이로 인해 발생되는 모든 사회적문제는 전지점 학원에서 책임지지 않습니다.
<br>4. 약관의 수정 - ”회사”는 이 약관을 변경할 수 있으며 변경된 약관은 서비스 화면에 게재하거나 기타 다른 방법으로 이용자에게 공지함으로써 효력을 발생합니다.
<br>5. ID와 패스워드 - 이용자번호(ID)와 비밀번호(password)에 관한 모든 관리책임은 이용자에게 있습니다. 이용자에게 부여된 이용자번호(ID) 및 비밀번호(password)의 관리소홀, 부정사용에 의하여 발생하는 모든 결과에 대한 책임은 이용자에게 있습니다. 자신의 ID가 부정하게 사용된 경우 이용자는 반드시 학원에 그 사실을 통보해야 합니다.
<br>6. 사용자 정보 - ”회사”에 기재하는 모든 이용자 정보는 이름을 포함하여 모두 실제 데이타인 것으로 간주됩니다. 실명이나 실제 정보를 입력하지 않은 사용자는 법적인 보호를 받을 수 없으며, ”회사”의 서비스 제한 조치를 받을 수 있습니다
<br>7. 광고 게재 및 컨텐츠 제휴 - ”회사”는 광고수익과 컨텐츠 제휴를 기반으로 컨텐츠 서비스를 제공하고 있습니다. ”회사”의 서비스를 이용하고자 하는 이용자는 광고게재및 컨텐츠 제휴에 대해 동의하는 것으로 간주됩니다.
<br>제 3장 계약해지 및 서비스 이용제한
<br>제 1조 계약해지 및 이용제한
<br>이용자가 이용 계약을 해지 하고자 하는 때에는 이용자 본인이 직접 온라인을 통해 해지하거나 관리자에게 메일을 보내어 해지 신청을 하여야 합니다.
<br>
<br>"회사"또는 이용자가 다음 사항에 해당하는 행위를 하였을 경우 사전 통지 없이 이용 계약을 해지 하거나 또는 기간을 정하여 서비스 이용을 중지할 수 있습니다.
<br>
<br>(1) 공공질서 및 미풍양속에 반하는 경우
<br>(2) 범죄적 행위에 관련되는 경우
<br>(3) 이용자가 국익 또는 사회적 공익을 저해할 목적으로 서비스 이용을 계획 또는 실행 할 경우
<br>(4) 타인의 서비스 아이디 및 비밀 번호를 도용한 경우
<br>(5) 타인의 명예를 손상시키거나 불이익을 주는 경우
<br>(6) 같은 사용자가 다른 아이디로 이중 등록을 한 경우
<br>(7) 서비스에 위해를 가하는 등 서비스의 건전한 이용을 저해하는 경우
<br>(8) 기타 관련법령이나 회사가 정한 이용조건에 위배되는 경우
<br>제 2조 이용제한의 해제 절차
<br>(1) ”회사”는 규정에 의하여 이용제한을 하고자 하는 경우에는 그 사유, 일시 및 기간을 정하여 서면 또는 전화 등의 방법에 의하여 해당 이용자 또는 대리인에게 통지합니다. 다만, ”회사”가 긴급하게 이용을 정지할 필요가 있다고 인정하는 경우에는 그러하지 아니합니다.
<br>(2) 제1항의 규정에 의하여 이용정지의 통지를 받은 이용자 또는 그 대리인은 그 이용정지의 통지에 대하여 이의가 있을 때에는 이의신청을 할 수 있습니다.
<br>(3) ”회사”는 제2항의 규정에 의한 이의신청에 대하여 그 확인을 위한 기간까지 이용정지를 일시 연기할 수 있으며, 그 결과를 이용자 또는 그 대리인에게 통지합니다.
<br>(4) ”회사”는 이용정지 기간 중에 그 이용정지 사유가 해소된 것이 확인된 경우 에는 이용정지조치를 즉시 해제합니다.
<br>제 3조 이용자의 게시물
<br>”회사”는 이용자가 게시하거나 등록하는 서비스 내의 내용물이 다음 각 사항에 해당된다고 판단되는 경우에 사전 통지 없이 삭제할 수 있습니다.
<br>
<br>(1) 다른 이용자 또는 제 3자를 비방하거나 중상 모략으로 명예를 손상시키는 내용인 경우
<br>(2) 공공질서 및 미풍 양속에 위반되는 내용인 경우
<br>(3) 범죄적 행위에 결부된다고 인정되는 내용일 경우
<br>(4) 제 3자의 저작권 등 기타 권리를 침해하는 내용인 경우
<br>(5) 기타 관계 법령이나 회사에서 정한 규정에 위배되는 경우
<br>제 4장 계약변경 등
<br>제 1조 계약사항의 변경
<br>1. 이용자는 주소 또는 이용계약 내용을 변경하거나, 서비스를 해지할 경우에는 전화나 서비스를 통해서 이용계약을 변경/해지 하여야 합니다.
<br>
<br>제 5장 정보의 제공
<br>제 1조 정보의 제공
<br>1. "회사"는 이용자가 서비스 이용 중 필요가 있다고 인정되는 다양한 정보에 대해서는 전자우편이나 서신우편 등의 방법으로 이용자에게 제공할 수 있습니다.
<br>
<br>제 6장 손해배상
<br>제 1조 손해배상
<br>"회사"는 서비스 이용과 관련하여 이용자에게 발생한 어떠한 손해에 관하여도 책임을 지지 않습니다. 서비스 이용으로 발생한 분쟁에 대해 소송이 제기될 경우 "회사"의 소재지를 관할하는 법원을 관할법원으로 합니다.
<br>
<br>[부칙]
<br>
<br>(시행일) 이 약관은 2022년 05월 18일부터 시행합니다.
							</div><br>
							<label><input type="radio" name="membershipTerm" class="membershipTerm" value="disagree" onclick="checkIfAgreed()">&nbsp;&nbsp;동의하지 않습니다.</label>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<label><input type="radio" name="membershipTerm" class="membershipTerm" value="agree" onclick="checkIfAgreed()">&nbsp;&nbsp;동의합니다.</label>
		                </div>
		            </div>
		               <div class="about_area">
		                <div class="personalInfoAgreement">
			               	<br><br><br>
			                <h3> 개인정보처리방침 </h3>
								<div class="agreementDetaill" style="width:100%; height:300px; background-color:#e0e0e0; overflow:auto">
<br>Seoul Traveler의 개인정보처리방침은 다음과 같은 내용을 담고 있습니다.
<br>가. 수집하는 개인정보 항목 및 수집방법
<br>나. 개인정보의 수집 및 이용목적
<br>다. 수집한 개인정보의 보유 및 이용기간
<br>라. 동의를 거부할 권리가 있다는 사실과 동의 거부에 따른 불이익 내용
<br>
<br>가.수집하는 개인정보 항목 및 수집방법
<br>Seoul Traveler는 고객님의 숙박시설 예약 대행 서비스 진행을 위해 개인정보를 아래와 같이 수집하고 있습니다.
<br>- [필수]이름, 이메일
<br>- [선택]휴대폰번호
<br>
<br>Seoul Traveler는 다음과 같은 방법으로 개인정보를 수집합니다.
<br>- 홈페이지 내 회원가입
<br>
<br>나.개인정보 수집 및 이용목적
<br>Seoul Traveler는 수집한 개인정보를 다음의 목적을 위해 활용합니다.
<br>- 제휴 숙박시설 예약
<br>
<br>다.수집한 개인정보의 보유 및 이용기간
<br>모든 검토가 완료된 후 5년간 이용자의 조회를 위하여 보관하며, 이 후 해당정보를 지체없이 파기합니다.
<br>
<br>라. 동의를 거부할 권리가 있다는 사실과 동의 거부에 따른 불이익 내용
<br>이용자는 Seoul Traveler 홈페이지에서 수집하는 개인정보에 대해 동의를 거부할 권리가 있으며 동의 거부 시에는 회원가입이 제한됩니다.								
								</div><br>
							
							<label><input type="radio" name="personalInfoTerm" class="personalInfoTerm" value="disagree" onclick="checkIfAgreed()">&nbsp;&nbsp;동의하지 않습니다.</label>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<label><input type="radio" name="personalInfoTerm" class="personalInfoTerm" value="agree" onclick="checkIfAgreed()">&nbsp;&nbsp;동의합니다.</label>
		                </div>
		               </div>
		            <br><br><br><button type="submit" id="sbmt" style="margin:3px; width:150px; height:30px;" disabled> 가입하기 </button>
		            </div>
		            </form>
                </div>
            </div>
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
    
</body>
</html> 
$(function() {
	$("#newPw").change(comparePwInput);
	$("#newPwRe").change(comparePwInput);

	$("#mobile").keyup(function() {
		$(this).val($(this).val().replace(/[^0-9]/g, "").replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/, "$1-$2-$3").replace("--", "-"));
		if ($(this).val().length > 13) {
			let temp = $(this).val().substring(0, 13).split("-").join("");
			$(this).val(temp.substring(0,3)+"-"+temp.substring(3,7)+"-"+temp.substring(7,11));
		}
	});
});

function openChangePw(){
	$(".changePwFormArea").removeAttr("hidden");
	$("#changePasswordBtn").attr("hidden",true);		
}

var comparePwInput = function() {
	if ($("#newPw").val() != $("#newPwRe").val()) {
		$("#pwNotMatching").text("입력하신 두 비밀번호가 일치하지 않습니다.");
		$("#submitChangePwFrmBtn").attr("disabled", true);
	} else {
		$("#pwNotMatching").text("");
		$("#submitChangePwFrmBtn").removeAttr("disabled");
	}
}

function closeChangePw(){
	$(".changePwFormArea").attr("hidden",true);
	$("#changePasswordBtn").removeAttr("hidden");	
}

function openChangeContact(){
	$(".changeContactFormArea").removeAttr("hidden");
	$(".contactInfoArea").attr("hidden",true);		
	$("#changeContactBtn").attr("hidden",true);		
}

function closeChangeContact(){
	$(".changeContactFormArea").attr("hidden",true);
	$(".contactInfoArea").removeAttr("hidden");	
	$("#changeContactBtn").removeAttr("hidden");	
}

function sendCode(){
	console.log("jQuery sendCode() 호출");
	const data = {
		"emailAddr" : $("#email").val()
	}
	
	var url = "/email/sendCode";
	$.ajax({
		url :  url,
		type : "POST",
		data : data,
		cache: false,
	}).done(function(data){
		if(data.status == "Ok"){			
				alert("입력하신 이메일 주소로 인증코드를 전송하였습니다.\n3분 이내로 확인 후 입력해주세요.");
				$("#verifyEmail").removeAttr("disabled");
		}else{
				alert("인증코드 발송에 실패하였습니다.")			
		}
	});
}

function checkCode(){
	console.log("jQuery checkCode() 호출");
	const data = {
		"code" : $("#verificationCode").val()
	};
	var url = "/email/checkCode";
	$.ajax({
		url :  url,
		type : "POST",
		data : data,
		cache: false,
	}).done(function(data){
		if(data.status == "Ok"){			
			alert("이메일 인증에 성공하였습니다.");
			$("#submitChangeContactFrmBtn").removeAttr("disabled");
		}else{
			alert("인증에 실패하였습니다.")		
		}
	});
}
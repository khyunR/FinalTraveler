/**
 * 
 */

function sendCode(){
	console.log("jQuery sendCode() 호출");
	const data = {
		"emailAddr" : $("#email").val()
	}
	
	var url = getContextPath()+"/email/sendCode";
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
	var url = getContextPath()+"/email/checkCode";
	$.ajax({
		url :  url,
		type : "POST",
		data : data,
		cache: false,
	}).done(function(data){
		if(data.status == "Ok"){			
			alert("이메일 인증에 성공하였습니다.");
			$("#submitFormBtn").removeAttr("disabled");
		}else{
			alert("인증에 실패하였습니다.")		
		}
	});
}

function getContextPath(){
	var hostIndex = location.href.indexOf(location.host) + location.host.length;
	return location.href.substring(hostIndex, location.href.indexOf('/', hostIndex+1));
}
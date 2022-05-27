/**
 * 
 */

$(function() {
	$("#repassword").change(function() {
		if ($(this).val() != $("#password").val()) {
			$("#pwNotMatching").text("입력하신 두 비밀번호가 일치하지 않습니다.");
			$("#submitFormBtn").attr("disabled", true);
		} else {
			$("#pwNotMatching").text("");
			$("#submitFormBtn").removeAttr("disabled");
		}
	});

	$("#mobile").keyup(function() {
		$(this).val($(this).val().replace(/[^0-9]/g, "").replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/, "$1-$2-$3").replace("--", "-"));
		if ($(this).val().length > 13) {
			let temp = $(this).val().substring(0, 13).split("-").join("");
			$(this).val(temp.substring(0,3)+"-"+temp.substring(3,7)+"-"+temp.substring(7,11));
		}
	});
});
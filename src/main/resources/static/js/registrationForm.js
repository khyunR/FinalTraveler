/**
 * 
 */

$(function(){
    $("#repassword").keyup(function(){
        if(this.val()!=$("#password")){
            $("#pwNotMatching").text("입력하신 두 비밀번호가 일치하지 않습니다.");
            $("#submitRegisterBtn").attr("disabled");
        }else{
            $("#pwNotMatching").text("");
            $("#submiFormBtn").removeAttr("disabled");
        }
    })
});
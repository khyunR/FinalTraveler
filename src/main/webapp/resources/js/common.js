$(document).ready(function(){ 
	$('.viewImgList').bxSlider({ 
		auto: true, 
		speed: 500, 
		pause: 4000, 
		mode:'fade', 
		autoControls: false, 
		pager:false, 
		}); 
	$('.ImgList').bxSlider({ 
		auto: false, 
		speed: 500, 
		pause: 4000, 
		mode:'fade', 
		autoControls: false, 
		pager:true, 
		}); 
		$(".openAll").hover(function(){
    $(this).css("border-bottom", '5px solid DarkBlue');
      }, function(){
    $(this).css("border-bottom", '5px solid transparent');
	});

})

        $(function(){
        $.ajax({
                method: "GET",
                url: "http://api.openweathermap.org/data/2.5/weather",
                data: {
                    q: "SEOUL",
                    appid:"279cc18f7611a5f00d49fcfcb00e2e52",
                    units:"metric",
                    lang:"KR"
                }
            })
            .done(function(msg) {
                console.log(msg);
            var iconcode = msg.weather[0].icon;
            var iconurl = "http://openweathermap.org/img/w/" + iconcode + ".png" ;
            $("#weather").append("<img src='"+iconurl+"'vertical-align: middle;>");
            $("#weather").append("&nbsp;&nbsp;<strong>"+(msg.main.temp)+"&deg"+"</strong>");
            $("#weather").append("&nbsp;&nbsp;<strong>"+"서울"+"</strong>");
            }); 
        });
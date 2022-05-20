$(document).ready(function(){ 
	$('.viewImgList').bxSlider({ 
		auto: true, 
		speed: 500, 
		pause: 4000, 
		mode:'fade', 
		autoControls: false, 
		pager:false, 
		}); 
		$(".openAll").hover(function(){
    $(this).css("border-bottom", '5px solid deepskyblue');
      }, function(){
    $(this).css("border-bottom", '5px solid transparent');
	});

})


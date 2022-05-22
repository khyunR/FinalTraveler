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
    $(this).css("border-bottom", '5px solid deepskyblue');
      }, function(){
    $(this).css("border-bottom", '5px solid transparent');
	});

})


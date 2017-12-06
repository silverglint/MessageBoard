$(function() {
	var ul = $('.main-cont .banner .banner-pic');
	var index = 1;
	var flag = true;
	$('.btn-next').on('click',function(){
		if(flag==false){
			return;
		}
		flag = false;
		index++;
		move();
	});
	
	$('.btn-pre').on('click',function(){
		if(flag==false){
			return;
		}
		flag = false;
		index--;
		move();
	});
	
	function move() {
		console.log(index);
		ul.animate({"margin-left":-index*1000},1000,function(){
			if(index==6){
				ul.css("margin-left","-1000px");
				index = 1;
			}
			if(index==0){
				index = 5;
				ul.css("margin-left",-index*1000);
			}
			$('.btn ul li a').removeClass('active');
			$('.btn ul li:nth-child('+index+') a').addClass('active');
		});
		setTimeout(() => {
			flag = true;
		}, 1000);
	}
	
	$('.btn ul li a').on('click',function(){
		if(flag==false){
			return;
		}
		flag = false;
		$('.btn ul li a').removeClass('active');
		$(this).addClass('active');
		index = $(this).text();
		move();
	});
	
	
//	function move() {
//		console.log(index);
//		ul.animate({"margin-left":-index*1000},1000);
//		if(index==6){
//			ul.css("margin-left","-1000px");
//			index = 1;
//		}
//	}
})
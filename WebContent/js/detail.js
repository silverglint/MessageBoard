
$(function() {
	$('.cont .article .article-message .time span:last-child a:nth-child(1)').on('click',function(){
		$('.cont .article .article-cont pre').css({'font-size':'22px','line-height':'32px'});
	});
	$('.cont .article .article-message .time span:last-child a:nth-child(2)').on('click',function(){
		$('.cont .article .article-cont pre').css({'font-size':'18px','line-height':'28px'});
	});
	$('.cont .article .article-message .time span:last-child a:nth-child(3)').on('click',function(){
		$('.cont .article .article-cont pre').css({'font-size':'14px','line-height':'24px'});
	});
})
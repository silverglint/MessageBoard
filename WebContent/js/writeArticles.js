function closeAd() {
	$('.ad').hide();
}

function checkArticleName() {
	var article_name = $('#article_name').val();
	$.ajax({
		type:'post',
		url:'/MessageBoard/control/checkArticleName.jsp',
		data:{'article_name':article_name},
		error:function(){
			alert('检查文章标题出错');
		},
		success:function(data){
			if(data==-1){
				alert('文章重名！');
				$('#article_name').val("");
			}
		}
	})
}

function addArticle() {
	var classify_id = $('#classify_id').val();
	var article_name = $('#article_name').val();
	var article_head = $('#article_head').val();
	var article_content = $('#article_content').val();
	var article_description = $('#article_description').val();
	if(classify_id==""||article_name==""||article_head==""||article_content==""||article_description==""){
		alert('请填写完整');
		return;
	}
	// console.log(classify_id+','+article_name+'.'+article_head+','+article_content);

	$.ajax({
		type : 'post',
		url : '/MessageBoard/control/addArticle.jsp',
		data : {
			'classify_id' : classify_id,
			'article_name' : article_name,
			'article_head' : article_head,
			'article_content' : article_content,
			'article_description' : article_description
		},
		error:function(){
			alert('上传文章出错');
		},
		success:function(data){
			var a = document.createElement('a');
			a.href = "/MessageBoard/content/detail.jsp?id="+data;
			a.click();
		}
	})
}
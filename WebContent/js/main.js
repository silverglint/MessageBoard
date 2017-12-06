//点击文章封面跳转
function detail(id) {
	var a = document.createElement('a');
//	a.target = "_blank";
	a.href = "/MessageBoard/content/detail.jsp?id="+id;
//	console.log(a);
	a.click();
}

<%@page import="entity.Discuss"%>
<%@page import="java.util.List"%>
<%@page import="service.ShowDiscuss"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="entity.Article"%>
<%@page import="java.util.Map"%>
<%@page import="service.ShowArticle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/detail.css">
<link rel="stylesheet" type="text/css" href="../css/iconfont.css">
<script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
</head>
<body>
<% 
	String id = request.getParameter("id");
	//System.out.print(id);
	ShowArticle sa = new ShowArticle();
	Article article = sa.selectArticle(id);
	//System.out.print(article);
	String name = article.getName();
	String content = article.getContent();
	String writer = article.getUser_id();
	String classify = article.getClassify_id();
	DateFormat dateFormat = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分");
	String createTime = dateFormat.format(article.getCreateTime());
	String lastUpdate = dateFormat.format(article.getLastUpdate());
%>
	<div class="cont">
		<jsp:include page="../content/nav.jsp"></jsp:include>
		<div class="article">
			<div class="article-message">
				<h1><%=name %></h1>
				<p class="classify">文章类别：<span><%=classify %></span></p>
				<p class="time">发布时间：<span><%=createTime %></span>&nbsp;&nbsp;<span>|</span>&nbsp;&nbsp;最后更新：<span><%=lastUpdate %></span><span>字号：<a>大</a><a>中</a><a>小</a></span></p>
			</div>
			<div class="article-cont">
				<pre><%=content %></pre>
			</div>
		</div>
		<div class="writer">
			<div class="writer-message">
				<img alt="头像消失了哟！" src="../img/writer-img.jpg">
				<span>作者：<i><%=writer %></i></span>
			</div>
		</div>
		<div style="clear:both;"></div>
		<div class="discuss">
			<div class="discuss-inner">
				<p>FeedBack：</p>
				<textarea id="discuss-text" placeholder="输入评论(300字以内)" maxlength="300"></textarea>
				<a id="commit" onclick="addDiscuss();">提交评论</a>
			</div>
			<% 
				ShowDiscuss sd = new ShowDiscuss();
				List<Discuss> list = sd.showDiscuss(id);
				for(Discuss discuss:list){
					String time = dateFormat.format(discuss.getCreateTime());
			%>
			<div class="discuss-cont">
				<div class="discuss-writer"><span><%=time %></span><span><%=discuss.getUser_id() %></span></div>
				<pre><%=discuss.getContent() %></pre>
				<div class="agree-dis">
					<div class="agree"><span class="iconfont">&#xe634;</span>(<span><%=discuss.getAgree() %></span>)</div>
					<div class="disagree"><span class="iconfont">&#xe65d;</span>(<span><%=discuss.getDisagree() %></span>)</div>
				</div>
			</div>
			<% } %>
		</div>
	</div>
	<script type="text/javascript">
		function addDiscuss() {
			var article_id = '<%=id %>';
			var username = '<%=session.getAttribute("username") %>';
			//console.log(username);
			if (username === "null") {
				alert('登陆后才能评论哟！');
				return;
			}
			var content = $('#discuss-text').val();
			var agree = $('.agree span:last-child').val();
			var disagree = $('.disagree span:last-child').val();
			
			$.ajax({
				type : 'post',
				url : '/MessageBoard/control/addDiscuss.jsp',
				data : {
					'article_id' : article_id,
					'username' : username,
					'content' : content,
					'agree' : agree,
					'disagree' : disagree
				},
				error:function(){
					alert('评论出错！');
				},
				success:function(data){
					//刷新
					window.location.reload();
				}
			})
		};
	</script>
<script type="text/javascript" src="../js/detail.js"></script>

</body>
</html>
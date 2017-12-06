<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发布文章</title>
<link rel="stylesheet" type="text/css" href="../css/writeArticles.css">
<script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
</head>
<body>
<jsp:include page="nav.jsp"></jsp:include>
<div class="cont">
	<div class="cont-message">
		<div>
			<span>文章类别：</span>
			<select id="classify_id">
				<option value="1">编程代码类</option>
				<option value="2">散文诗歌类</option>
				<option value="3">杂谈</option>
				<option value="4" selected="selected">其他</option>
			</select>
		</div>
		<div>
			<span>文章标题：</span>
			<input onblur="checkArticleName();" id="article_name" type="text" maxlength="30">
		</div>
		<div>
			<span>相关类(如唐诗)：</span>
			<input id="article_head" type="text" maxlength="30">
		</div>
		<div>
			<span>简要概述：</span>
			<input id="article_description" type="text" maxlength="254">
		</div>
	</div>
	<div class="cont-main">
		<div>
			<textarea id="article_content"></textarea>
		</div>
		<div class="commit"><a onclick="addArticle();">提交文章</a></div>
	</div>
	<div class="ad">
		<p>广告位出租啦！（）</p>
		<a onclick="closeAd();">关闭</a>
	</div>
</div>
<script type="text/javascript" src="../js/writeArticles.js"></script>
</body>
</html>
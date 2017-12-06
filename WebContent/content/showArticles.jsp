<%@page import="utils.DataBaseUtil"%>
<%@page import="service.ShowArticle"%>
<%@page import="entity.Article"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文章展示</title>
<link rel="stylesheet" type="text/css" href="../css/showArticles.css">
<script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
<jsp:include page="nav.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/MessageBoard/css/showArticles.css">
</head>
<body>
<div class="cont">
	<%
		ShowArticle sa = new ShowArticle();
		String article_id = request.getParameter("id");
		String sql = "select name from classify where uid="+article_id;
		String title = String.valueOf(DataBaseUtil.queryForSelect(sql));
	%>
	<div>
		<h3><%=title %></h3>
		<ul>
			<% 
			List<Article> articles = sa.showArticle(article_id, 0, 100);
			for (Article article : articles) {
				//System.out.println(article);
				String uid = article.getUid();
				String header = article.getHeader();
				String name = article.getName();
				String description = article.getDescription();
				String user_id = article.getUser_id();
			%>
			<li class="item" onclick="detail(<%=uid %>);">
				<p class="item-header"><%=header%></p>
				<p class="item-name"><%=name%></p>
				<p class="item-writer"><%=user_id%>著</p>
				<p class="item-des"><%=description%></p>
			</li>
			<%
				}
			
			%>
		</ul>
	</div>
</div>
<script type="text/javascript" src="/MessageBoard/js/main.js"></script>
</body>
</html>
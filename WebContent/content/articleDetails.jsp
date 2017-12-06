<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.List"%>
<%@page import="service.ShowArticle"%>
<%@page import="entity.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div>
	<h3>编程类</h3>
	<ul>
		<%
			//System.out.print("mmm");
			ShowArticle sa = new ShowArticle();
			List<Article> articles_code = sa.showArticle(1,0,4);
			for (Article article : articles_code) {
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
			<p class="item-writer"><%=user_id%>
				著
			</p>
			<p class="item-des"><%=description%></p>
		</li>
		<%
			}
		%>
	</ul>
</div>
<div>
	<h3>散文诗歌类</h3>
	<ul>
		<%
			//System.out.print("mmm");
			List<Article> articles_poem = sa.showArticle(2, 0, 4);
			for (Article article : articles_poem) {
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
<div>
	<h3>杂谈</h3>
	<ul>
		<%
			//System.out.print("mmm");
			List<Article> articles_warm = sa.showArticle(3, 0, 4);
			for (Article article : articles_warm) {
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
<div>
	<h3>其他</h3>
	<ul>
		<%
			//System.out.print("mmm");
			List<Article> articles_else = sa.showArticle(4, 0, 4);
			for (Article article : articles_else) {
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
<script type="text/javascript" src="js/main.js"></script>

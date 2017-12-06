<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/MessageBoard/css/nav.css">
</head>
<% 
	String username = (String)session.getAttribute("username");
%>
<body>
	<nav>
	<div class="nav-cont">
		<div>SKY留言板</div>
		<ul>
			<li><a href="/MessageBoard/index.jsp">首页</a></li>
			<%
				if(username==null){
			%>
				<li><a onclick="toLog();">发布文章</a></li>
			<% }else{ %>
				<li><a href="/MessageBoard/content/writeArticles.jsp">发布文章</a></li>
			<% } %>
			
			<li>
				<a class="showArticle">热门美文</a>
				<div class="drop-down">
					<a href="/MessageBoard/content/showArticles.jsp?id=1">编程代码类</a>
					<a href="/MessageBoard/content/showArticles.jsp?id=2">诗歌散文类</a>
					<a href="/MessageBoard/content/showArticles.jsp	?id=3">杂谈</a>
					<a href="/MessageBoard/content/showArticles.jsp?id=4">其他</a>
				</div>
			</li>
			<li><a>关于我</a></li>
		</ul>
		<%
			if(username==null){
		%>
		<div class="login">
			<a>登录</a><span>&nbsp;&nbsp;|&nbsp;&nbsp;</span><a>注册</a>
		</div>
		<% }else{ %>
		<div id="user-login">
			<span>欢迎您,</span><span><%=username %></span>&nbsp;&nbsp;|&nbsp;&nbsp;<a
				href="${basePath}/control/quit.jsp">登出</a>
		</div>
		<% } %>
	</div>
	</nav>
	<div id="login">
		<div class="login-cont">
			<p>登录窗口</p>
			<div>
				<span>用户名:</span>
				<input id="username" type="text" name="username" placeholder="输入用户名" autofocus>
			</div>
			<div>
				<span>密码:</span>
				<input id="password" type="password" name="password" placeholder="输入密码">
			</div>
			<div><a onclick="login();">登录</a></div>
			<p>没有账号？点击&nbsp;&nbsp;<a>注册</a>&nbsp;！</p>
		</div>
	</div>
	<div id="reg">
		<div class="reg-cont">
			<p>注册窗口</p>
			<div>
				<span>用户名:</span>
				<input onblur="checkUsername();" id="reg-username" type="text" name="username" placeholder="输入用户名" autofocus>
			</div>
			<i id="already-username"></i>
			<div>
				<span>密码:</span>
				<input onblur="not_null();" id="reg-password" type="password" name="password" placeholder="输入密码">
			</div>
			<div>
				<span>确认密码:</span>
				<input onblur="secPassword();" id="sec-reg-password" type="password" name="password" placeholder="确认密码">
			</div>
			<i id="not-same"></i>
			<div><a onclick="reg();">注册</a></div>
			<p>已有账号？点击&nbsp;&nbsp;<a>登录</a>&nbsp;！</p>
		</div>
	</div>
	<div class="mask"></div>
	<script type="text/javascript" src="/MessageBoard/js/user.js"></script>
</body>
</html>
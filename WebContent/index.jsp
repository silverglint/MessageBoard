<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>留言板</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>

<%
	//获取绝对路径
    String path = request.getContextPath();
    int port = request.getServerPort();
    String basePath  = null;
    if(port==80){
        basePath = request.getScheme()+"://"+request.getServerName()+path;
    }else{
        basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    }
    request.setAttribute("basePath", basePath);
%>
</head>
<body>
	<div class='cont'>
		<jsp:include page="content/nav.jsp"></jsp:include>
		<div class='main-cont'>
			<div class="banner">
				<ul class="banner-pic">
					<li><a><img src="img/5.jpg"></a></li>
					<li><a><img src="img/1.jpg"></a></li>
					<li><a><img src="img/2.jpg"></a></li>
					<li><a><img src="img/3.jpg"></a></li>
					<li><a><img src="img/4.jpg"></a></li>
					<li><a><img src="img/5.jpg"></a></li>
					<li><a><img src="img/1.jpg"></a></li>
				</ul>
				<div class="btn">
					<span class="btn-pre">&lt;</span>
					<span class="btn-next">&gt;</span>
					<ul>
						<li><a class="active">1</a></li>
						<li><a>2</a></li>
						<li><a>3</a></li>
						<li><a>4</a></li>
						<li><a>5</a></li>
					</ul>
				</div>
			</div>
			<div id="article">
				<jsp:include page="content/articleDetails.jsp"></jsp:include>
			</div>
		</div>
		<footer><span>关于我</span><span>电话:17771780642</span><span>邮箱393165736@qq.com</span><i>Made By 施宽</i></footer>
	</div>
	<script type="text/javascript" src="js/banner.js"></script>
	
</body>
</html>
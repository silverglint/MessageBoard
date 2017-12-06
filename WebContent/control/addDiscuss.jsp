<%@page import="utils.DataBaseUtil"%>
<%@page import="service.ShowDiscuss"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String article_id = request.getParameter("article_id");
	//System.out.print(article_id);
	String username = request.getParameter("username");
	String content = request.getParameter("content");
	String agree = request.getParameter("agree");
	String disagree = request.getParameter("disagree");
	String sql = "select uid from user_test where username=\""+username+"\";";
	System.out.println(sql);
	String user_id = String.valueOf(DataBaseUtil.queryForSelect(sql));
	ShowDiscuss sd = new ShowDiscuss();
	sd.addDiscuss(user_id, article_id, content);
%>
</body>
</html>
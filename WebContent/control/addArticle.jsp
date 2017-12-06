<%@page import="java.io.PrintWriter"%>
<%@page import="utils.DataBaseUtil"%>
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
	String classify_id = request.getParameter("classify_id");
	String article_name = request.getParameter("article_name");
	String article_head = request.getParameter("article_head");
	String article_content = request.getParameter("article_content");
	String article_description = request.getParameter("article_description");
	String username = (String)session.getAttribute("username");
	String sql1 = "select uid from user_test where username="+"\""+username+"\"";
	String user_id = String.valueOf(DataBaseUtil.queryForSelect(sql1));
	
	String sql2 = "insert into article_copy(user_id,classify_id,header,name,content,description) values(?,?,?,?,?,?);";
	DataBaseUtil.update(sql2, user_id,classify_id,article_head,article_name,article_content,article_description);
	
	String sql3 = "select uid from article_copy where name="+"\""+article_name+"\"";
	String article_id = String.valueOf(DataBaseUtil.queryForSelect(sql3));
	
	PrintWriter pout = response.getWriter();
	pout.write(article_id);
	pout.flush();
	pout.close();
	
%>
</body>
</html>
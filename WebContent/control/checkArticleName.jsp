<%@page import="utils.DataBaseUtil"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.io.PrintWriter"%>
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
	String article_name = request.getParameter("article_name");

	String sql = "select name from article_copy";
	List<Map<String,Object>> list = DataBaseUtil.queryForList(sql);
	for(Map<String,Object> map:list){
		String existName = (String)map.get("name");
		//System.out.println(existName);
		if(article_name.equals(existName)){
			PrintWriter pout = response.getWriter();
			pout.write("-1");
			pout.flush();
			pout.close();
		}
	}
%>
</body>
</html>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
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
		String username = request.getParameter("username");
		
		//System.out.println(username);
		String sql = "select username from user_test";
		List<Map<String,Object>> list = DataBaseUtil.queryForList(sql);
		for(Map<String,Object> map:list){
			String existName = (String)map.get("username");
			//System.out.println(existName);
			if(username.equals(existName)){
				PrintWriter pout = response.getWriter();
				pout.write("-1");
				pout.flush();
				pout.close();
			}
		}
	%>
</body>
</html>
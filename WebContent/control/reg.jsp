<%@page import="service.Reg"%>
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
		String password = request.getParameter("password");
		
		//System.out.println(username+','+password);
		
		Reg reg = new Reg();
		reg.reg(username, password);
	%>
</body>
</html>
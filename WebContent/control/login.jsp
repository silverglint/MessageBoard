<%@page import="java.io.PrintWriter"%>
<%@page import="entity.User"%>
<%@page import="service.Login"%>
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
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		PrintWriter pout = response.getWriter();
		
		if(username==""||password==""){
			
			pout.write("-1");
			pout.flush();
			pout.close();
			System.out.print("null");
			return;
		}
		Login login = new Login();
		User user = login.getUser(username);
		if(user==null){
			pout.write("-2");
			pout.flush();
			pout.close();
			return;
		}
		if(!user.getUsername().equals(username)||!user.getPassword().equals(password)){
			pout.write("-3");
			pout.flush();
			pout.close();
			return;
		}
		if(user.getUsername().equals(username)&&user.getPassword().equals(password)){
			pout.write("1");
			pout.flush();
			pout.close();
			session.setAttribute("user", user);
			session.setAttribute("username", username);
			
		}
	%>
</body>
</html>
<%@page import="Tam.CGioHang"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	CGioHang g = (CGioHang) session.getAttribute("gh");
	String th = request.getParameter("th");		
	g.XoaItem(th, g.ds);	
	if(g.ds.size()==0)
		session.removeAttribute("gh");
	else
		session.setAttribute("gh", g);	
	response.sendRedirect("DatHang.jsp");
	%>
</body>
</html>
<%@page import="Tam.CGioHang"%>
<%@page import="java.util.Enumeration"%>
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
	Enumeration<String> d = request.getParameterNames();
	while (d.hasMoreElements()) {		
		String chon = d.nextElement();
		String kt = request.getParameter(chon);	
		out.print(chon);
		 if (kt.equals("true")) {
			CGioHang g = (CGioHang) session.getAttribute("gh");			
			g.XoaItem(chon, g.ds);
			if (g.ds.size() == 0)
				session.removeAttribute("gh");
			else
				session.setAttribute("gh", g);
		} 

	}
	response.sendRedirect("DatHang.jsp"); 
	%>
</body>
</html>
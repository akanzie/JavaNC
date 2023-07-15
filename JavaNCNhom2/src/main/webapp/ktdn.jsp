<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
String tamtk = request.getParameter("txtun");
String tammk = request.getParameter("txtpass");
%>
<%=tamtk%>
<%=tammk%>
<%
if(tamtk.equals("abc") && tammk.equals("123")) {	
	 response.sendRedirect("https://student.husc.edu.vn/News");
}else{	
	response.sendRedirect("login.jsp?loi=1");
}
 
%>
</body>
</html>
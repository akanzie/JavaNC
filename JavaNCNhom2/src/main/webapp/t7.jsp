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
   Enumeration<String> d= request.getParameterNames();
   while(d.hasMoreElements())
     out.println( d.nextElement());
 %>
 
</body>
</html>
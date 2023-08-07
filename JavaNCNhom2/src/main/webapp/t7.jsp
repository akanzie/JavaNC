<%@page import="java.util.Enumeration"%>
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
   Enumeration<String> d= request.getParameterNames();
   while(d.hasMoreElements())
     out.println( d.nextElement());
 %>
 
</body>
</html>
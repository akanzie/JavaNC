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
	String trang=request.getParameter("gt");
	if(trang==null)	
		trang="1";
%>
Noi dung trang: <%=trang %> <hr>
<% for(int i=1;i<=10;i++){ %>
<a href="t3.jsp?gt=<%=i%>"><%=i %></a>
<%} %>
</body>
</html>
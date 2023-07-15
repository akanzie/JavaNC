<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%
if(session.getAttribute("ss")==null){
	session.setAttribute("ss", (int)0);
}
String str = request.getParameter("txtn");
if(str != null) {
	int s=(int)session.getAttribute("ss");
	s=s+Integer.parseInt(str);
	session.setAttribute("ss", s);
}
%>
<form action="test.jsp" method="post">
	
    	n=<input class="input-lg" type="number" name="txtn" value="<%=str%>">	
    	<input type="submit" class="btn-primary" name="th" value="Tong">
		
</form>	
<a href="testsession.jsp">test</a><hr>
<%=session.getAttribute("ss")%>
</body>
</html>
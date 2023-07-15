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
<form action="xbcc.jsp" method="post">
	<%
	String str = request.getParameter("bangcuuchuong");
	int i = 0;
    if(str != null) {
    	i = Integer.parseInt(str);
    	str = "";%>
    	<input class="input-lg" type="number" name="bangcuuchuong" value="<%=i%>">
    	<input type="submit" class="btn-primary">
    	<h1>Bảng cửu chương <%=i%></h1>		
		<%for (int j = 1; j <= 10; j++) {
			out.print(i + " x " + j + " = " + i * j + "<br>");	
		}
	}    
    else{ %>
    	<input class="input-lg" type="number" name="bangcuuchuong" value="<%=str%>">	
    	<input type="submit" class="btn-primary">
		<%} %>
</form>	
</body>
</html>
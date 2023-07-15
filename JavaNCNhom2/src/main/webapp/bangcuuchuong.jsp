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
<div class="row">
	<%for (int i = 1; i <= 10; i++) {	%>
	<div class="text-center" style="border: 1px solid; width: 420px; margin: 10px 10px 10px 10px">
		<h1>Bảng cửu chương<%=i%></h1>		
		<%for (int j = 1; j <= 10; j++) {
			out.print(i + " x " + j + " = " + i * j + "<br>");	}%>
	</div>
	<%}%>
	</div>
</body>
</html>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
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
		<div>
			chon ngay: 
			<select name="s1">
				<%
				for (int i = 1; i <= 31; i++) {
					if (i != LocalDate.now().getDayOfMonth()) {
						out.print("<option>" + i + "</option>");
					} else
						out.print("<option selected>" + i + "</option>");
				}
				%>
			</select>
		</div>
		<div>
			chon thang: 
			<select name="s2">
				<%
				for (int i = 1; i <= 12; i++) {
					if (i != LocalDate.now().getMonthValue()) {
						out.print("<option>" + i + "</option>");
					} else
						out.print("<option selected>" + i + "</option>");
				}
				%>
			</select>
		</div>
		<div>
			chon nam: 
			<select name="s3">
				<%
				for (int i = 1960; i <= 2023; i++) {
					if (i != LocalDate.now().getYear()) {
						out.print("<option>" + i + "</option>");
					} else
						out.print("<option selected>" + i + "</option>");
				}
				%>
			</select>
		</div>
	</div>
</body>
</html>
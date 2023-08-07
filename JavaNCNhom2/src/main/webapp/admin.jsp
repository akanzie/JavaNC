<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="bean.adminxacnhanbean"%>
<%@page import="java.util.List"%>
<%@page import="bean.chitietgiohangbean"%>
<%@page import="bean.khachhangbean"%>
<%@page import="bean.sachbean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.sachbo"%>
<%@page import="bean.loaibean"%>
<%@page import="bo.loaibo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
.book-title {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
</head>
<body>
	<nav class="navbar navbar-dark bg-dark navbar-expand-md">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Nhà sách AK</a>
			<button type="button" class="navbar-toggler" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="navbar-nav">
					<li class="nav-item active"><a class="nav-link"
						href="adminloai">Quản lý loại</a></li>
					<%
					List<chitietgiohangbean> g = new ArrayList<chitietgiohangbean>();
					//Neu mua hang lan dau
					if (session.getAttribute("gh") != null) {
						//Gian session: gh vao bien: g
						g = (List<chitietgiohangbean>) session.getAttribute("gh");
					}
					%>
					<li class="nav-item"><a class="nav-link" href="adminsach">Quản
							lý sách </a></li>
					<li class="nav-item"><a class="nav-link" href="adminhoadon">Xác
							nhận hóa đơn</a></li>
					<li class="nav-item"><a class="nav-link" href="adminds">Danh
							sách khách hàng</a></li>
				</ul>
				<%
				khachhangbean kh = (khachhangbean) session.getAttribute("un");
				if (kh == null) {
				%>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="admindangky"><span
							class="bi bi-person"></span> Đăng ký</a></li>
					<li class="nav-item"><a class="nav-link" href="admindangnhap"><span
							class="bi bi-person"></span> Đăng nhập</a></li>
				</ul>
				<%
				} else {
				%>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="#">Xin
							chào: <%=kh.getHoten()%></a></li>
					<li class="nav-item"><a class="nav-link" href="admindangxuat"></span>
							Đăng xuất</a></li>
				</ul>
				<%
				}
				String k = "";
				if (session.getAttribute("key") != null) {
				k = (String) session.getAttribute("key");
				}
				%>
			</div>
		</div>
	</nav>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>Họ tên khách hàng</th>
				<th>Tên sách</th>
				<th>Giá</th>
				<th>Số lượng mua</th>
				<th>Thành tiền</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<%-- <%ArrayList<adminxacnhanbean> ds= (ArrayList<adminxacnhanbean>) request.getAttribute("ds");
	for(adminxacnhanbean xn: ds){
	%>
	<tr>
	<td><%=xn.getHoten()%></td>
	<td><%=xn.getTensach()%></td>
	<td><%=xn.getGia()%></td>
	<td><%=xn.getSoLuongMua()%></td>
	<td><%=xn.getThanhtien()%></td>
	<td><a href="adminxacnhan?mact=<%= xn.getMaChiTietHoaDon() %>">Xác nhận</a></td>
	</tr>
	<%} %> --%>
			<c:forEach items="${ds}" var="xn">
				<tr>
					<td>${xn.getHoten()}</td>
					<td>${xn.getTensach()}</td>
					<td>${xn.getGia()}</td>
					<td>${xn.getSoLuongMua()}</td>
					<td>${xn.getThanhtien()}</td>
					<td><a href="adminxacnhan?mact=${xn.getMaChiTietHoaDon()}">Xác
							nhận</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
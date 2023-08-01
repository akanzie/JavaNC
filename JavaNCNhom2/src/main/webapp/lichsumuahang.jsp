<%@page import="bean.lichsumuabean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.chitiethoadonbean"%>
<%@page import="bean.chitietgiohangbean"%>
<%@page import="java.util.List"%>
<%@page import="bean.khachhangbean"%>
<%@page import="bo.giohangbo"%>
<%@page import="bean.hoadonbean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
</style>
<body>
	<nav class="navbar navbar-dark bg-dark navbar-expand-sm">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggler" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="navbar-toggler-icon"></span>
				</button>
				<a class="navbar-brand" href="#">Nhà sách AK</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="sach">Trang
							chủ</a></li>
					<%
					List<chitietgiohangbean> g = new ArrayList<chitietgiohangbean>();
					//Neu mua hang lan dau
					if (session.getAttribute("gh") != null) {
						//Gian session: gh vao bien: g
						g = (List<chitietgiohangbean>) session.getAttribute("gh");
					}
					%>
					<li class="nav-item"><a class="nav-link" href="gio">Giỏ
							hàng(<%=g.size()%>)
							<li class="nav-item"><a class="nav-link" href="luu">Xác
									nhận đặt mua</a></li>
							<li class="nav-item active"><a class="nav-link"
								href="lichsumuahang">Lịch sử mua hàng</a></li>
				</ul>
				<%
				khachhangbean kh = (khachhangbean) session.getAttribute("un");
				if (kh == null) {
				%>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="dangky"><span
							class="glyphicon glyphicon-user"></span> Đăng ký</a></li>
					<li class="nav-item"><a class="nav-link" href="dangnhap"><span
							class="glyphicon glyphicon-user"></span> Đăng nhập</a></li>
				</ul>
				<%
				} else {
				%>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="#">Xin
							chào: <%=kh.getHoten()%></a></li>
					<li class="nav-item"><a class="nav-link" href="dangxuat"></span>
							Đăng xuất</a></li>
				</ul>
				<%
				}
				%>
			</div>
		</div>
	</nav>
	<div class="container mt-4">
		<h1>Lịch sử mua hàng</h1>
		<div class="dropdown">
			<button type="button" class="btn btn-primary dropdown-toggle"
				data-toggle="dropdown">Lọc</button>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="lichsumuahang?damua=0">Chưa thanh
					toán</a> 
				<a class="dropdown-item" href="lichsumuahang?damua=1">Đã
					thanh toán</a>
			</div>
		</div>
		<div class="table-responsive">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Mã hóa đơn</th>
						<th>Ngày mua</th>
						<th>Tên sách</th>
						<th>Số lượng</th>
						<th>Đơn giá</th>
						<th>Tổng tiền</th>
					</tr>
				</thead>
				<tbody>
					<%
					if (request.getAttribute("dshd") != null) {
						List<lichsumuabean> dshd = (List<lichsumuabean>) request.getAttribute("dshd");
						for (lichsumuabean hd : dshd) {
					%>
					<tr>
						<td><%=hd.getMaHoaDon()%></td>
						<td><%=hd.getNgayMua()%></td>
						<td><%=hd.getTensach()%></td>
						<td><%=hd.getSoLuongMua()%></td>
						<td><%=hd.getGia()%></td>
						<td><%=hd.getSoLuongMua() * hd.getGia()%></td>
					</tr>
					<%
					}
					%>
				</tbody>
				<%
				}
				%>
			</table>
		</div>
	</div>
</body>
</html>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="bean.khachhangbean"%>
<%@page import="bean.chitietgiohangbean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Giỏ hàng | Nhà sách AK</title>
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
<body style="background-color: #f0f0f0;">
	<nav class="navbar navbar-dark bg-dark navbar-expand-sm">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Nhà sách AK</a>
				<button type="button" class="navbar-toggler" data-toggle="collapse"
					data-target="#myNavbar" style="margin-left: 150px">
					<span class="navbar-toggler-icon"></span>
				</button>
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
					<li class="nav-item active"><a class="nav-link" href="gio">Giỏ
							hàng(<%=g.size()%>)
							<li class="nav-item"><a class="nav-link" href="luu">Xác
									nhận đặt mua</a></li>
							<li class="nav-item"><a class="nav-link"
								href="lichsumuahang">Lịch sử mua hàng</a></li>
				</ul>
				<%
				khachhangbean kh = (khachhangbean) session.getAttribute("un");
				if (kh == null) {
				%>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="dangky"><span
							class="bi bi-person"></span> Đăng ký</a></li>
					<li class="nav-item"><a class="nav-link" href="dangnhap"><span
							class="bi bi-person"></span> Đăng nhập</a></li>
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
	<h1 style="text-align: center">Giỏ hàng</h1>
	<%
	//Hien thi do trong session: gh
	long tongtien = 0;
	if (session.getAttribute("gh") != null) {
		g = (List<chitietgiohangbean>) session.getAttribute("gh");
		int sh = g.size();
		if (session.getAttribute("tongtien") != null)
			tongtien = (long) session.getAttribute("tongtien");
	%>
	<form method="post">
		<div class="container-fluid p-4">
			<div class="table-responsive" style="background-color: white">
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th></th>
							<th>Ảnh</th>
							<th>Tên sách</th>
							<th>Giá</th>
							<th>Số lượng</th>
							<th>Thành tiền</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<%
						for (int i = 0; i < sh; i++) {
						%>
						<tr>
							<td><input type="checkbox" name="selected"
								value="<%=g.get(i).getMasach()%>"></td>
							<td style="text-align: center"><img
								src="<%=g.get(i).getAnh()%>" style="width: 100px;"></td>
							<td><%=g.get(i).getTensach()%></td>
							<td><%=g.get(i).getGia()%></td>
							<td><input type='number' style="width: 70px;"
								name='txtsua<%=g.get(i).getMasach()%>'
								value="<%=g.get(i).getSoluong()%>"> <input type='submit'
								name='tt' value='Cập nhật'
								formaction="sua?ms=<%=g.get(i).getMasach()%>"></td>
							<td><%=g.get(i).getThanhtien()%></td>
							<td><a class="btn btn-danger"
								href="xoa?ms=<%=g.get(i).getMasach()%>"><span
									class="fa fa-remove"></span></a></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row p-4">
			<div class="col-md-6" style="background-color: white">
				<a class="btn btn-danger" href="xoa?ms=all">Xóa tất cả</a> <input
					class="btn btn-danger" type="submit" value="Xóa" formaction="xoa">
			</div>
			<div class="col-md-6 text-right" style="background-color: white">
				<b>Tổng tiền: <%=tongtien%></b> <input class="btn btn-success"
					type="submit" formaction="luu" value="Xác nhận đặt mua">
			</div>
		</div>
	</form>
	<%
	} else {
	%>
	<%
	String thongbao = "Giỏ hàng trống";
	if (request.getAttribute("thongbao") != null) {
		thongbao = (String) request.getAttribute("thongbao");
	}
	%>
	<script>
	alert("<%=thongbao%>");
	</script>
	<%
	}
	%>
</body>
</html>
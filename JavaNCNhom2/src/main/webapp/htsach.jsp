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
					<li class="nav-item active"><a class="nav-link" href="sach">Trang
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
				String k = "";
				if (session.getAttribute("key") != null) {
				k = (String) session.getAttribute("key");
				}
				%>
				<form action="sach" method="post" class="form-inline d-md-none">
					<input class="form-control mr-sm-2" type="text" name="key"
						placeholder="Tìm sách..." value="<%=k%>" style="width: 88%">
					<button class="btn btn-success" type="submit"
						style="margin-left: 5px">
						<span class="fa fa-search"></span>
					</button>
				</form>
			</div>
		</div>
	</nav>
	<div class="dropdown d-block d-md-none m-2">
		<button type="button" class="btn btn-primary dropdown-toggle"
			data-toggle="dropdown" style="width: 100%">Thể loại</button>
		<div class="dropdown-menu" style="column-count: 2; width: 100%">
			<%
			ArrayList<loaibean> dsloai = (ArrayList<loaibean>) request.getAttribute("dsloai");

			for (loaibean loai : dsloai) {
			%>
			<a class="dropdown-item" href="sach?ml=<%=loai.getMaloai()%>"><%=loai.getTenloai()%></a>
			<%
			}
			%>
		</div>
	</div>
	<div class="d-none d-md-block">
		<div class="row">
			<div class="col-3 dropdown d-flex d-lg-none m-2">
				<button type="button" class="btn btn-primary dropdown-toggle"
					data-toggle="dropdown" style="width: 100%">Thể loại</button>
				<div class="dropdown-menu" style="column-count: 2;">
					<%
					for (loaibean loai : dsloai) {
					%>
					<a class="dropdown-item" href="sach?ml=<%=loai.getMaloai()%>"><%=loai.getTenloai()%></a>
					<%
					}
					%>
				</div>
			</div>
			<form action="sach" method="post"
				class="col form-inline my-2 my-lg-0 d-lg-none">
				<input class="form-control mr-sm-2" type="text" name="key"
					placeholder="Tìm sách..." value="<%=k%>" style="width: 88%">
				<button class="btn btn-success my-2 my-sm-0" type="submit">
					<span class="fa fa-search"></span>
				</button>
			</form>
		</div>
	</div>
	<div class="container-fluid mt-2">
		<div class="row text-center">
			<div class="col-lg-3 d-none d-lg-block" style="position: relative;">
				<ul class="list-group">
					<%
					for (loaibean loai : dsloai) {
					%>
					<li class="list-group-item"><a
						href="sach?ml=<%=loai.getMaloai()%>"><%=loai.getTenloai()%></a></li>
					<%
					}
					%>
				</ul>
			</div>
			<div class="col-lg-6">
				<div class="row">
					<%
					request.setCharacterEncoding("utf-8");
					response.setCharacterEncoding("utf-8");
					ArrayList<sachbean> dssach = (ArrayList<sachbean>) request.getAttribute("dssach");

					/* String ml = request.getParameter("ml");
					String key = request.getParameter("key"); */
					/* if (ml != null) {
						ds = sbo.TimMa(ml);
					} else if (key != null) {
						ds = sbo.Tim(key);
						session.setAttribute("key", key);
					} */
					for (sachbean sach : dssach) {
					%>
					<div class="col-sm-6 col-xl-4 col-lg-6 col-md-4">
						<img style="margin-top: 2px; height: 240px; width: 240px"
							src="<%=sach.getAnh()%>" class="img-thumbnail"> <br>
						<div class="book-title" style="height: 30px; margin-top: 4px">
							Tên sách:
							<%=sach.getTensach()%>
						</div>
						Giá:
						<%=sach.getGia()%><br> <a
							href="gio?ms=<%=sach.getMasach()%>&ts=<%=sach.getTensach()%>&gia=<%=sach.getGia()%>&anh=<%=sach.getAnh()%>"><img
							alt="" src="mua.jpg"></a>
						<hr>
					</div>
					<%
					}
					%>
				</div>
			</div>
			<div class="col-lg-3 d-none d-lg-block">
				<form action="sach" method="post" class="form-inline my-2 my-lg-0"
					style="flex-wrap: nowrap;">
					<input class="form-control mr-sm-2" type="text" name="key"
						placeholder="Tìm sách..." value="<%=k%>" style="width: 88%;">
					<button class="btn btn-success my-2 my-sm-0" type="submit">
						<span class="fa fa-search"></span>
					</button>
				</form>
			</div>
		</div>
		<div class="text-center">
			<ul class="pagination pagination-sm" style="justify-content: center;">
				<%
				int a = (int) session.getAttribute("page");
				for (int i = 1; i <= (int) session.getAttribute("pageCount"); i++) {
					if (i == a) {
				%>
				<li class="page-item active"><a class="page-link" href="#"><%=i%></a></li>
				<%
				} else {
				%>
				<li class="page-item"><a class="page-link"
					href="sach?page=<%=i%>"><%=i%></a></li>
				<%
				}

				}
				%>
			</ul>
		</div>
	</div>
</body>
</html>
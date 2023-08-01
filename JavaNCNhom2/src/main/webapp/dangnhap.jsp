<%@page import="bean.khachhangbean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.chitietgiohangbean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Đăng nhập</title>
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
</head>
<body>
	<nav class="navbar navbar-dark bg-dark navbar-expand-sm">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Nhà sách AK</a>
			<button type="button" class="navbar-toggler" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
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
					<li class="nav-item active"><a class="nav-link"
						href="dangnhap"><span class="bi bi-person"></span> Đăng nhập</a></li>
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
	<%
	String tk = "", loi = "";
	if (request.getAttribute("tk") != null) {
		tk = (String) request.getAttribute("tk");
	}
	if (request.getAttribute("loi") != null) {
		loi = (String) request.getAttribute("loi");
	}

	if (session.getAttribute("un") == null) {
	%>
	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<h3 class="text-center">Đăng nhập</h3>
					</div>
					<div class="card-body">
						<form method="post" action="dangnhap">
							<div class="form-group">
								<label for="username">Tài khoản:</label>
								<%
								if (tk != "") {
								%>
								<input name="txtun" type="text" class="form-control"
									id="username" placeholder="Nhập tài khoản" value="<%=tk%>"
									required>
								<%
								} else {
								%><input name="txtun" type="text" class="form-control"
									id="username" placeholder="Nhập tài khoản" required>
								<%
								}
								%>
							</div>
							<div class="form-group">
								<label for="password">Mật khẩu:</label> <input name="txtpass" type="password"
									class="form-control" id="password" placeholder="Nhập mật khẩu">
							</div>
							<%
							if (loi != "")
							%>
							<span style="color: red"><%=loi%></span>
							<button type="submit" class="btn btn-primary btn-block">Đăng
								nhập</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
	}
	%>
</body>
</html>
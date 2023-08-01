<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
<title>Đăng ký</title>
</head>
<body>
	<div class="container mt-4">
		<form class="form-group" action="dangky" method="post">
			<div class="mb-3">
				<label for="fullName" class="form-label">Họ tên</label> <input
					type="text" class="form-control" id="fullName" name="hoten"
					placeholder="Nhập họ tên">
			</div>
			<div class="mb-3">
				<label for="address" class="form-label">Địa chỉ</label> <input
					type="text" class="form-control" id="address" name="diachi"
					placeholder="Nhập địa chỉ">
			</div>
			<div class="mb-3">
				<label for="phone" class="form-label">Số điện thoại</label> <input
					type="text" class="form-control" id="phone" name="sodt"
					placeholder="Nhập số điện thoại">
			</div>
			<div class="mb-3">
				<label for="email" class="form-label">Email</label> <input
					type="email" class="form-control" id="email" name="email"
					placeholder="name@example.com">
			</div>
			<div class="mb-3">
				<label for="tendn" class="form-label">Tên đăng nhập</label> <input
					type="text" class="form-control" id="tendn" name="tendn"
					placeholder="Nhập tên đăng nhập">
			</div>
			<div class="mb-3">
				<label for="password" class="form-label">Mật khẩu</label> <input
					type="password" class="form-control" id="password" name="pass"
					placeholder="Nhập mật khẩu">
			</div>
			<div class="mb-3">
				<label for="repass" class="form-label">Xác nhận mật khẩu</label> <input
					type="password" class="form-control" id="repass" name="repass"
					placeholder="Nhập lại mật khẩu">
			</div>
			<%
			String loi = "";
			if (request.getAttribute("loi") != null) {
				loi = (String) request.getAttribute("loi");
			}
			if (!loi.equals("")) {
			%>
			<span style="color: red"><%=loi%></span> <br>
			<%
			}
			%>
			<button type="submit" class="btn btn-primary">Đăng ký</button>
		</form>
	</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>

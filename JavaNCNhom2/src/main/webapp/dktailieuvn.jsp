<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<style>
* {
	margin: 0px;
	padding: 0px;
}

html {
	font-size: 12px;
	font-family: sans-serif;
}

body {
	font-family: var(- -font);
	font-size: 14px;
	font-weight: 400;
	background-color: #f7f7f7;
	margin: auto;
}

.container {
	width: 782px;
	height: 300px;
	position: relative;
	font-size: 12px;
}

.lbtitle {
	background-color: #1a83d2;
	width: 100%;
	height: 42px;
}

.lbtitle span {
	color: #fff;
	padding-top: 10px;
	padding-left: 10px;
	float: left;
	font-weight: bold;
	font-size: 15px;
}

.lbtitle i {
	float: right;
	margin-right: 15px;
	margin-top: 15px;
	color: #fff;
	font-size: 15px;
}

.lbbody {
	padding: 15px 15px 0 15px;
}

.fbold {
	padding-left: 1px;
}

.fbold i {
	font-size: 15px;
}

.logfb {
	padding: 10px 0 10px 10px;
	position: relative;
}

.tipmark {
	float: right;
	background-color: #f5fbff;
	width: 302px;
	height: 68px;
	border: 1px dashed #01B5E6;
	border-radius: 5px;
}

.tipmark i {
	position: absolute;
	right: 306px;
	top: 38px;
	color: lightblue;
}

.tipmark ul {
	float: left;
	padding-top: 5px;
}

.tipmark li {
	float: left;
	line-height: 20px;
	margin-left: 5px;
	padding-left: 8px;
}

.tipmark span {
	color: red;
}

.tipmark a {
	color: blue;
	text-decoration: none;
}

.lbbody p {
	display: flex;
	margin-top: 10px;
}

.font {
	margin-left: 10px;
	color: #0080AF;
	font-weight: bold;
}

.drg {
	width: 100%;
	display: flex;
}

.dregister1 {
	display: flex;
	flex-direction: column;
}

.dregister1 input {
	margin-top: 10px;
	margin-left: 15px;
	width: 301px;
	height: 20px;
}

.dergister2 {
	display: flex;
	flex-direction: column;
}

input {
	margin-top: 10px;
	margin-left: 8px;
	width: 301px;
	height: 20px;
}

.sex {
	margin-top: 10px;
	margin-left: 8px;
	width: 78px;
	height: 23px;
}

.bd {
	margin-left: 8px;
}

.bd input {
	width: 150px;
}

.city {
	margin-top: 10px;
	margin-left: 8px;
	width: 78px;
	height: 23px;
}

.capcha input {
	width: 146px;
}

.capcha span {
	color: #0080AF;
	margin-left: 100px;
}

.sb {
	color: #fff;
	background-color: #01B5E6;
	overflow: hidden;
	border-radius: 4px;
	border: 1px solid #f5fbff;
	width: 85px;
	margin-left: 14px;
	text-align: center;
	height: 33px;
	cursor: pointer;
}

.ch {
	text-align: center;
	height: 10px;
	width: 50px;
}
.ngay-sinh{
display: flex;
margin-top: 10px;

}
.chon{
margin-left: 7px;
height: 25px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="lbtitle">
			<span>ĐĂNG KÝ</span> <i class="bi bi-x-lg"></i>
		</div>
		<div class="lbbody">
			<span class="fbold"><i class="bi bi-dot"></i>Đăng kí nhanh qua
				facebook</span>
			<div class="logfb">
				<a href="https://www.facebook.com/"> <img
					src="https://tailieu.vn/static/b2013az/templates/version1/default/images/btnfb277x45.jpg" alt="đăng nhập facebook">
				</a>
				<div class="tipmark">
					<i class="bi bi-caret-left-fill"></i>
					<ul>
						<li>Thưởng ngay <span>50 </span> ePoints khi đăng ký mới & <span>5</span>
							ePoints cho mỗi lượt chia sẽ Facebook
						</li>
						<li>Tích lũy nhiều ePoints khi Upload tài liệu <a
							href="https://tailieu.vn/gioi-thieu-diem-epoints.html">>></a>
					</ul>
				</div>
			</div>
			<p class="font">Đăng kí mới bằng tài khoản TaiLieu.VN</p>
			<P>Bạn cần kích hoạt tài khoản qua Email sau khi đăng kí để nhận
				ngay 50 ePoint thưởng từ TaiLieu.vn</P>
		</div>
		<div class="drg">
			<div class="dregister1">
				<div>
					<input type="text" placeholder="Nhập Username">
				</div>
				<div>
					<input type="password" placeholder="Nhập mật khẩu">
				</div>
				<div>
					<input type="Password" placeholder="Nhập lại mật khẩu">
				</div>
				<div>
					<input type="email" placeholder="Nhập địa chỉ email">
				</div>
				<div>
					<input type="email" placeholder="Nhập lại địa chỉ email">
				</div>
			</div>
			<div class="dergister2">
				<div>
					<input type="text" placeholder="Nhập Họ và Tên">
				</div>
				<select name="gioiTinh" class="sex">
					<option value="sex">Giới tính</option>
					<option value="1">Nam</option>
					<option value="0">Nữ</option>
				</select>
				<div class="ngay-sinh">
				<select name="ngay sinh" class="chon">
				<option value="0">Ngày sinh</option>
				<%for (int i = 1; i <= 31; i++){%>
					<option value="<%=i%>"><%=i%></option>
					<%}%>
				</select>
				<select name="thang" class="chon">
				<option value="0">Tháng</option>
				<%for (int i = 1; i <= 12; i++){%>
					<option value="<%=i%>"><%=i%></option>
					<%}%>
				</select>
				<select name="nam" class="chon">
				<option value="0">Năm</option>
				<%for (int i = 1960; i <= 1999; i++){%>
					<option value="<%=i%>"><%=i%></option>
					<%}%>
				</select>
				</div>
				
				<select name="thanhPho" class="city">
				<option value="0">Tỉnh thành</option>
				<%String[] danhSachTinh = {
			            "An Giang",
			            "Bà Rịa - Vũng Tàu",
			            "Bắc Giang",
			            "Bắc Kạn",
			            "Bạc Liêu",
			            "Bắc Ninh",
			            "Bến Tre",
			            "Bình Định",
			            "Bình Dương",
			            "Bình Phước",
			            "Bình Thuận",
			            "Cà Mau",
			            "Cao Bằng",
			            "Đắk Lắk",
			            "Đắk Nông",
			            "Điện Biên",
			            "Đồng Nai",
			            "Đồng Tháp",
			            "Gia Lai",
			            "Hà Giang",
			            "Hà Nam",
			            "Hà Tĩnh",
			            "Hải Dương",
			            "Hậu Giang",
			            "Hòa Bình",
			            "Hưng Yên",
			            "Khánh Hòa",
			            "Kiên Giang",
			            "Kon Tum",
			            "Lai Châu",
			            "Lâm Đồng",
			            "Lạng Sơn",
			            "Lào Cai",
			            "Long An",
			            "Nam Định",
			            "Nghệ An",
			            "Ninh Bình",
			            "Ninh Thuận",
			            "Phú Thọ",
			            "Quảng Bình",
			            "Quảng Nam",
			            "Quảng Ngãi",
			            "Quảng Ninh",
			            "Quảng Trị",
			            "Sóc Trăng",
			            "Sơn La",
			            "Tây Ninh",
			            "Thái Bình",
			            "Thái Nguyên",
			            "Thanh Hóa",
			            "Thừa Thiên Huế",
			            "Tiền Giang",
			            "Trà Vinh",
			            "Tuyên Quang",
			            "Vĩnh Long",
			            "Vĩnh Phúc",
			            "Yên Bái",
			            "Phú Yên",
			            "Cần Thơ",
			            "Đà Nẵng",
			            "Hải Phòng",
			            "Hà Nội",
			            "TP Hồ Chí Minh"
			        }; %>					
					<%for (int i = 0; i < danhSachTinh.length; i++){%>
					<option value="<%=i%>"><%=danhSachTinh[i]%></option>
					<%}%>
				</select>
				<div class="capcha">
					<input type="text" placeholder="Nhập mã xác nhận"> <span>Chọn
						mã xác nhận</span>
				</div>
			</div>
		</div>
		<div class="dk">
			<input class="sb" type="submit" value="Đăng ký"> <input
				class="ch" type="checkbox"> <span>Tôi đồng ý với các
				chính sách và thỏa thuận sử dụng của Tailieu.vn</span>
		</div>
	</div>
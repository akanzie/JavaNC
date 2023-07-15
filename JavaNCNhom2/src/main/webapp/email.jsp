<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
	<script src="https://code.iconify.design/iconify-icon/1.0.7/iconify-icon.min.js"></script>
<style>
.soan-thu {
	position: fixed;
	bottom: 0;
	right: 80px;
	border: 1px solid #ccc;
	padding: 2px;
	height: 468px;
	width: 518px;
	border-radius: 8px;
}

.thu-moi {
	height: 40px;
	display: flex;   
  justify-content: center;
  align-items: center;
  text-align: center;
  border-bottom: 1px solid #cfcfcf;
  font: bold;
}

.thu-btn {
	margin-left: 397px;
}
.den{
    height: 40px; 
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center; 
    border-bottom: 1px solid #cfcfcf;
}
.tieu-de{
    height: 40px;
    display: flex;
    margin-left: 3px;
    align-items: center;
    text-align: center; 
    border-bottom: 1px solid #cfcfcf;
}
.noi-dung {
    margin-top: 2px;
	width: 510px;
	height: 300px;
	resize: vertical;
    border: none; 
    outline: none;   
    margin-left: 3px;
}
.form-group{
    border: none; 
    outline: none; 
    font-size: 14px;
    margin-left: 2px;
}
button {
	margin-top: 10px;
	padding: 5px 10px;
	background-color: #4CAF50;
	color: white;
	border: none;
	cursor: pointer;
}
.footer {
    padding-left: 12px;
    display: flex;
    align-items: center;
}

.send-btn {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #0b57d0;
    border: none;
    outline: none;
    border-radius: 24px;
    width: 105px;
    height: 36px;
    color: #fff;
}

.send-btn:hover {
    cursor: pointer;
    box-shadow: 0 1px 2px 0 rgba(26, 115, 232, 0.451), 0 1px 3px 1px rgba(26, 115, 232, 0.302);
    background-color: #1e67c6;
}

.send-btn p {
    padding-left: 24px;
    padding-right: 16px;
}

.btn-line {
    height: 100%;
    border-left: 1px solid #000;
}

.down-icon {
    margin-right: 12px;
    font-size: 10px;
}

.footer-icon {
    font-size: 20px;
    margin-left: 20px;
    display: flex;
    opacity: 0.6;
}

.footer-icon iconify-icon {
    padding: 5px;
}

.footer-icon iconify-icon:hover {
    cursor: pointer;
    background-color: #ccc;
    border-radius: 4px;
}

.delete-icon {
    margin-left: 80px;
    padding: 5px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="soan-thu">
		<div class="thu-moi">
			<span>Thư mới</span>
			<div class="thu-btn">
				<i class="bi bi-dash"></i> <i class="bi bi-arrows-angle-expand"></i>
				<i class="bi bi-x-lg"></i>
			</div>
		</div>
		<form class="" action="">
			<div class="den">
				<label style="margin-right: 5px;">Đến</label> 
                <input type="text" class="form-group">
                <a href="" style="margin-left: 255px; margin-right: 2px;">Cc</a>
                <a href="">Bcc</a>
			</div>
			<div class="tieu-de">
				<input type="text" class="form-group" placeholder="Tiêu đề">
			</div>
		</form>

		<textarea class="noi-dung"></textarea>
		<footer class="footer">
            <button class="send-btn">
                <p>Gửi</p>
                <span class="btn-line"></span>
                <iconify-icon class="down-icon" icon="teenyicons:down-solid"></iconify-icon>
            </button>
            <div class="footer-icon">
                <iconify-icon icon="ph:text-a-underline-bold"></iconify-icon>
                <iconify-icon icon="ion:attach"></iconify-icon>
                <iconify-icon icon="material-symbols:link"></iconify-icon>
                <iconify-icon icon="mdi:emoji-outline"></iconify-icon>
                <iconify-icon icon="ri:drive-line"></iconify-icon>
                <iconify-icon icon="material-symbols:image-outline"></iconify-icon>
                <iconify-icon icon="material-symbols:lock-outline"></iconify-icon>
                <iconify-icon icon="charm:menu-kebab"></iconify-icon>
                <iconify-icon class="delete-icon" icon="material-symbols:delete-outline"></iconify-icon>
            </div>
        </footer>
	</div>
</body>
</html>

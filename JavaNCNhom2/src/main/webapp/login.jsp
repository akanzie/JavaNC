<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
	background-color: #006EB7;
}

.husc-login {
	display: flex;
	width: 1000;
}

.husc-login-photo {
	width: 55%;
	margin-left: 100px;
}

.husc-logo {
	margin-top: 40px;
}

.husc-logo img {
	width: 120px;
	height: 120px;
}

.husc-image {
	margin-top: 65px;
}

.husc-image img {
	width: 420px;
	height: 300px;
}

.text-center {
	text-align: center;
}

.husc-login-form {
	width: 25%;
}

.husc-form-login {
	background-color: white;
	margin-top: 205px;
	width: 290px;
	height: 310px;
	position: relative;
	padding: 15px;
	border: 5px solid #6bb9f0;
}

.husc-form-login img {
	border: 5px solid white;
	border-radius: 50%;
	position: absolute;
	top: -30px;
	right: 20px;
}

label {
	display: inline-block;
	max-width: 100%;
	margin-bottom: 10px;
	font-size: 14px;
}

.form-control {
	display: block;
	width: 100%;
}

.input-lg {
	height: 30px;
	font-size: 14px;
	border-radius: 4px;
	border: 1px solid #ccc;
	outline: none;
}

.btn {
	margin: 15px auto;
	width: 100%;
	padding: 10px 12px;
	font-size: 15px;
	border-radius: 4px;
	color: white;
	background-color: #337ab7;
	text-align: center;
	border: 1px solid transparent;
}

.husc-footer {
	margin-top: 75px;
	text-align: center;
	color: white;
	font-size: 12px;
	font-family: Arial, sans-serif;	
}
.husc-footer a {	
	text-decoration: none;
	color: white;
}
</style>
<meta charset="utf-8">
<title>Đăng nhập hệ thống</title>
</head>
<body>
	<div class="husc-login">
		<div class="husc-login-photo text-center">
			<div class="husc-logo">
				<a href="https://ums.husc.edu.vn"><img
					src="https://student.husc.edu.vn/Themes/Login/images/Logo-ko-nen.png"></a>
			</div>
			<div class="husc-image">
				<img
					src="https://student.husc.edu.vn/Themes/Login/images/image1.png"
					alt="">
			</div>
		</div>
		<div class="husc-login-form">
			
			<%
			String tk = request.getParameter("txtun");
			String mk = request.getParameter("txtpass");
			String loi = "";			
		    if(tk != null && mk!= null) {
		    	if(tk.equals("abc") && mk.equals("123")){
		    		
		    	}
		    	else{	
		    		loi="Thông tin đăng nhập của bạn không hợp lệ!";
		    	}
		    }		    
		    %><form class="husc-form-login" method="post" action="login.jsp">
				<img style="position: absolute;"
					src="https://student.husc.edu.vn/Themes/Login/images/logo-small.png">
				<h2 style="color: blue">SINH VIÊN</h2>
				<div style="margin-bottom: 10px;">
					<label><b>Mã sinh viên:</label> 
					<%if(tk!=null) {%>
						<input type="text" name="txtun" class="form-control input-lg" placeholder="Mã sinh viên" value="<%=tk%> "required>
					<%}
					else {%>						
							<input type="text" name="txtun" class="form-control input-lg" placeholder="Mã sinh viên" required>
					<%} %> 
				</div>
				<div style="margin-bottom: 10px;">
					<label><b>Mật khẩu:</label> <input type="password" name="txtpass"
						class="form-control input-lg" placeholder="Mật khẩu" required>
				</div>	
				<%if(loi!="") %> <span style="color: red"><%=loi %></span>			
				<input type="submit" class="btn" name="but" value="Đăng nhập">
				
			</form>
		</div>
	</div>
	<footer>
		<div class="husc-footer">
			<p>
				<a href="http://husc.edu.vn" target="_blank">Trường
					Đại học Khoa học, Đại học Huế</a>
			</p>
			<p>
				<span class="glyphicon glyphicon-home"></span> 77 Nguyễn Huệ, Thành
				phố Huế, Tỉnh Thừa Thiên Huế, Việt Nam
			</p>
			<p>
				<span class="glyphicon glyphicon-phone"></span> Điện thoại: (+84)
				0234.3823290 – Fax: (+84) 0234.3824901
			</p>
		</div>
	</footer>
</body>

</html>
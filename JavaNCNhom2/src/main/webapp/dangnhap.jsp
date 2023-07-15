<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">    
    <ul class="nav navbar-nav">
      <li class="active"><a href="tc.jsp">Trang chủ</a></li>      
     <!--  <li><a href="#">Giỏ hàng</a></li>
      <li><a href="#">Thanh toán</a></li>
      <li><a href="#">Lịch sử mua hàng</a></li> -->
    </ul>
    <%if(session.getAttribute("un")==null) {%>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="dangky.jsp"><span class="glyphicon glyphicon-user"></span> Đăng ký</a></li>
      <li><a href="dangnhap.jsp"><span class="glyphicon glyphicon-log-in"></span> Đăng nhập</a></li>
    </ul>
    <%}else{%>
    	<ul class="nav navbar-nav navbar-right">
    	 <li><a href="#">Xin chào: <%=session.getAttribute("un")%></a></li>
    	
    <li><a href="dangxuat.jsp"></span> Đăng xuất</a></li>
    
  </ul>
    <%}%>
  </div>
 
</nav>

 <% 
  
			String tk = request.getParameter("txtun");
			String mk = request.getParameter("txtpass");
			String loi = "";			
		    if(tk != null && mk!= null) {
		    	if(tk.equals("abc") && mk.equals("123")){
		    		session.setAttribute("un", tk);			    		
		    		response.sendRedirect("htsach.jsp");		    		
		    	}
		    	else{	
		    		loi="Thông tin đăng nhập của bạn không hợp lệ!";
		    	}
		    }		
		    if(session.getAttribute("un")==null){
		    %><form class="husc-form-login" method="post" action="dangnhap.jsp" style="width: 35%">				
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
			<%} %>
</body>
</html>
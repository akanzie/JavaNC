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
<%if(session.getAttribute("un")==null) {%>
	<script>alert('vui long dang nhap')</script>
	<a href="menu.jsp"><span class="glyphicon glyphicon-log-in"></span> Đăng nhập</a>
<%}
else{%>


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
      <li><a href="menu.jsp"><span class="glyphicon glyphicon-log-in"></span> Đăng nhập</a></li>
    </ul>
    <%}else{%>
    	<ul class="nav navbar-nav navbar-right">
    	 <li><a href="#">Xin chào: <%=session.getAttribute("un")%></a></li>
    	
    <li><a href="dangxuat.jsp"></span> Đăng xuất</a></li>
    
  </ul>
    <%}%>
  </div>
 
</nav>
 <%if(session.getAttribute("un")==null) {%>
 aaaaaaaaa
 <%}else{%>
	<h1>Xin chào: <%=session.getAttribute("un")%></h1>
	<%}%>
<%}%>
</body>
</html>
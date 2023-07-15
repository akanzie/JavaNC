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
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link rel="stylesheet href="bootstrap.min.css" type=”text/css”/>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<ul class="nav navbar-nav">
				<li class="active"><a href="htsach.jsp">Trang chủ</a></li>
				<li><a href="htgio.jsp">Giỏ hàng</a></li>
				<li><a href="thanhtoan.jsp">Thanh toán</a></li>
				<li><a href="">Lịch sử mua hàng</a></li>
			</ul>
			<%
			if (session.getAttribute("un") == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="dangky.jsp"><span
						class="glyphicon glyphicon-user"></span> Đăng ký</a></li>
				<li><a href="dangnhap.jsp"><span
						class="glyphicon glyphicon-log-in"></span> Đăng nhập</a></li>
			</ul>
			<%
			} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">Xin chào: <%=session.getAttribute("un")%></a></li>

				<li><a href="dangxuat.jsp"></span> Đăng xuất</a></li>

			</ul>
			<%
			}
			%>
		</div>

	</nav>
	<table width="1200" align="center">
		<tr>
			<td valign="top" width="200">
				<table class="table table-hover">
					<%
					loaibo lbo = new loaibo();
					for (loaibean loai : lbo.getloai()) {
					%>
					<tr>
						<td><a href="htsach.jsp?ml=<%=loai.getMaloai()%>"><%=loai.getTenloai()%></a>
						</td>
					</tr>
					<%
					}
					%>
				</table>
			</td>
			<td valign="top" width="800">
				<table >
					<%
					request.setCharacterEncoding("utf-8");
					response.setCharacterEncoding("utf-8");
					sachbo sbo = new sachbo();
					ArrayList<sachbean> ds = sbo.getsach();
					String ml = request.getParameter("ml");
					String key = request.getParameter("key");
					if(ml != null){
						ds = sbo.TimMa(ml);
					}					
					else if(key != null){
						ds = sbo.Tim(key);
					}
					int n = ds.size();
					for (int i = 0; i < n; i++) {
						sachbean s = ds.get(i);
					%>
					<tr style="display: inline-block;" class="col-sm-4" style="width: 100px" height="400px">
						<td><img src="<%=s.getAnh()%>" class="img-thumbnail"> <br> Tên sách: <%=s.getTensach()%><br>
							Giá: <%=s.getGia()%><br> 
							<a href="gia.jsp?ms=<%=s.getMasach()%>%ts=<%=s.getTensach()%>%gia=<%=s.getGia()%>"><img alt="" src="mua.jpg"></a>
							<hr></td>
					</tr>
					<%
					}
					%>
				</table>			
			</td>
			<td valign="top" width="200">
			<form action="htsach.jsp" method="post">
			<input type="text" name="key" placeholder="tim kiem" class="form-control">
			<input type="submit" value="search">
			</form>
			</td>
		</tr>
	</table>
</body>
</html>
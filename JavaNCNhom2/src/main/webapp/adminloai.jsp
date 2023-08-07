<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<body>
<form action="adminloai" method="post">
Mã loại: <input type="text" name="txtmaloai" value="${maloai}">
Tên loại: <input type="text" name="txttenloai" value="${tenloai}"> 
<input type="submit" name="butadd" value="Add" class="btn-primary">
<input type="submit" name="butupdate" value="Update" class="btn-success">
</form>
Danh sách loại:
<table class="table table-hover">
		<thead>
			<tr>
				<th>Mã loại</th>
				<th>Tên loại</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<%-- <%ArrayList<adminxacnhanbean> ds= (ArrayList<adminxacnhanbean>) request.getAttribute("ds");
	for(adminxacnhanbean xn: ds){
	%>
	<tr>
	<td><%=xn.getHoten()%></td>
	<td><%=xn.getTensach()%></td>
	<td><%=xn.getGia()%></td>
	<td><%=xn.getSoLuongMua()%></td>
	<td><%=xn.getThanhtien()%></td>
	<td><a href="adminxacnhan?mact=<%= xn.getMaChiTietHoaDon() %>">Xác nhận</a></td>
	</tr>
	<%} %> --%>
			<c:forEach items="${ds}" var="loai">
				<tr>
					<td>${loai.getMaloai()}</td>
					<td>${loai.getTenloai()}</td>
					<td><a href="adminloai?ml=${loai.getMaloai()}&tab=select">Select</a></td>
					<td><a href="adminloai?ml=${loai.getMaloai()}&tab=delete">Delete</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<c:if test="${loi!=null }">
	<script type="text/javascript">
	<alert("${loi}")">
	</script>
	</c:if>
</body>
</html>
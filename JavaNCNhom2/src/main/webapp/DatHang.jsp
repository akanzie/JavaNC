<%@page import="Tam.CGioHang"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form method='post' action='DatHang.jsp'>
		Ten hang <input type='text' name='txtth'><br>
		Gia <input type='text' name='txtgia'><br> 
		So luong <input type='text' name='txtsl'><br> 
		<input type='submit' name='un1' value='Dat Hang'>
	</form>
	Gio hang
	<%
	String th = request.getParameter("txtth");
	String gia = request.getParameter("txtgia");
	String sl = request.getParameter("txtsl");
	if (th != null && gia != null && sl != null) {
		CGioHang g = new CGioHang();
		//Neu mua hang lan dau
		if (session.getAttribute("gh") == null) {
			session.setAttribute("gh", g);//Tao gio
		}
		//Gian session: gh vao bien: g
		g = (CGioHang) session.getAttribute("gh");
		//Them hang vao bien: g
		g.Them(th, Integer.parseInt(gia), Integer.parseInt(sl));
		//Luu bien vao session
		session.setAttribute("gh", g);
	}
	//Hien thi do trong session: gh
	if (session.getAttribute("gh") != null) {
		CGioHang g = new CGioHang();
		g = (CGioHang) session.getAttribute("gh");
		int sh = g.ds.size();
	%>
	<form  method="post">
	<table border='1' width='100%'>
		<%
		for (int i = 0; i < sh; i++) {
		%>
		<tr>
			<td><input type="checkbox" name="<%=g.ds.get(i).getTenhang()%>" value="true"></td>
			<td><%=g.ds.get(i).getTenhang()%></td>
			<td><%=g.ds.get(i).getGia()%></td>
			<td><%=g.ds.get(i).getSoluong()%>				
					<input type='text' name='txtsua<%=g.ds.get(i).getTenhang()%>'> 
					<input type='submit' name='tt' value='Sua' formaction="sua.jsp?th=<%=g.ds.get(i).getTenhang()%>">
				</td>
			<td><%=g.ds.get(i).getThanhtien()%></td>
			<td><a href="xoa.jsp?th=<%=g.ds.get(i).getTenhang()%>">Xoa mat hang</a></td>
		</tr>
		<%
		}
		%>
	</table>
	<div align='right'>
		Tong tien:
		<%=g.Tongtien()%>
		</div>
		<a href="xoatatca.jsp">Xoa tat ca cac mat hang</a>
		<input type="submit" value="Xoa cac mat hang da chon" formaction="xoahangdachon.jsp">
		</form>
	<%
	}
	%>

</body>

</html>
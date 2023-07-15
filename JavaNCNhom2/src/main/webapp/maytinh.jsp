<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="bootstrap.min.css">

</head>
<body style="display:grid; place-items: center; height: 100vh;">
<form action="kq.jsp" method="post" class="text-center" style="border: 1px solid;">
<%
String kq = request.getParameter("kq"); 
String a = request.getParameter("a");
String b = request.getParameter("b");
%>
<label>A</label>
<input type="text" name="txta" class="input-lg" value="<%=(a==null)?0:a%>"> <br>
<label>B</label>
<input type="text" name="txtb" class="input-lg" value="<%=(b==null)?0:b%>"> <br>
<label>Kq</label>
<input type="text" name="txtkq" value="<%=(kq==null)?0:kq%>" class="input-lg"> <br>
<input type="submit" name="butc" value="+" class="btn">
<input type="submit" name="butt" value="-" class="btn">
<input type="submit" name="butn" value="x" class="btn">
<input type="submit" name="butchia" value="/" class="btn">
</form>
</body>
</html>
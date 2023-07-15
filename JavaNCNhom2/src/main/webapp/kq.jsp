<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

</head>
<body>
<label >Kq =</label> 
<%
String tama = request.getParameter("txta");
String tamb = request.getParameter("txtb");
if(tama!=null && tamb!=null) {
	int a=Integer.valueOf(tama);
	int b=Integer.valueOf(tamb);
	int kq=0;
	if(request.getParameter("butc")!=null)
		kq=a+b;
	if(request.getParameter("butt")!=null)
		kq=a-b;
	if(request.getParameter("butn")!=null)
		kq=a*b;
	if(request.getParameter("butchia")!=null)
		if(b!=0)
			kq=a/b;
		else
			out.print(b);
	 response.sendRedirect("maytinh.jsp?kq="+kq+"&a="+a+"&b="+b);
}else
 response.sendRedirect("maytinh.jsp");
%>
</body>
</html>